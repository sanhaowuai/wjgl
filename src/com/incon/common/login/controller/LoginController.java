package com.incon.common.login.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.security.interfaces.RSAPrivateKey;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.jasig.cas.client.authentication.AttributePrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.incon.common.login.service.LoginService;
import com.incon.common.pub.pubzj.service.PubZjService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.framework.util.IeasTool;
import com.incon.framework.util.MD5;
import com.incon.framework.util.RSAUserUtil;
import com.incon.framework.util.RSAUtils;
import com.incon.framework.util.propertiesLoader;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.xxtc.XxtcbEntity;
import com.incon.project.common.skin.service.SkinService;
import com.incon.project.common.xxtc.service.XxtcService;
import com.sun.image.codec.jpeg.ImageFormatException;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * @类名：com.incon.common.login.controller.LoginController
 * @作者：于洋
 * @时间：2014-3-10
 * @版本：
 * @描述：登录
 * @修改人员：丁起明
 * @修改时间：2014
 * @修改说明：
 */
@SuppressWarnings("all")
@Controller
public class LoginController
{
    private static final Logger logger = Logger
            .getLogger(LoginController.class);

    private propertiesLoader loader = new propertiesLoader();//加载配置文件
    
    @Resource(name = "loginService")
    private LoginService loginService;

    @Resource(name = "pubZjService")
    private PubZjService pubZjService;
    
    @Resource(name="skinService")
	public SkinService skinService;


	@Resource(name="xxtcService")
	private XxtcService xxtcService;
    @RequestMapping("/")
    public String loginIndex()
    {
        return "index";
    }
    /**
     * CAS登录入口
     * @param request
     * @param jsdm 统一门户推送过来的角色代码
     * @param model
     * @param session
     * @param methodUrl 实际访问的路径
     * @param response
     * @return
     */
	@RequestMapping("/welcome")
	public String welcome(HttpServletRequest request,String jsdm,
			Model model, HttpSession session,
			String methodUrl,HttpServletResponse response,String inconqxdm){	
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		String usercode = request.getRemoteUser();//CAS登录成功后传过来的登录用户代码
		
        logger.debug("执行：CAS welcome()");
        String ret = "error/casError"; // 转向路径
        if (null == usercode || "".equals(usercode))
        {
            return ret;
        }
       
        Map<String, String> map = new HashMap<String, String>();
        map.put("yhdm", usercode.trim());
        try
        {
            // CAS用户登录
            userEntity = loginService.casYhLogin(map);
            if (userEntity == null)
            {
                return ret;
            }
            userEntity.setInconqxdm(inconqxdm);
            userEntity.setCdMapList(loginService.checkCdqx(userEntity));// 访问菜单权限
            userEntity.setAnMapList(loginService.checkAnqx(userEntity));// 访问按钮权限
            session.setAttribute(WebConstants.CURRENT_USER, userEntity);
            System.out.println("CAS登录账号{"+usercode+"}");
    		if(methodUrl != null && !methodUrl.trim().equals("")){
    	        return "forward:/"+methodUrl;
    		} 
        }
        
        
        catch (Exception e)
        {
            logger.error("执行：CAS welcome() 操作失败", e);
        }
        return "forward:/main";		
	}	
    /**
     * 登录
     * 
     * @param model
     * @param session
     * @param usercode
     * @param password
     * @return
     */
	
//	@RequestMapping("/loginQian")
//	public String loginNOCAS(Model model,HttpSession session,HttpServletRequest request ,HttpServletResponse response){
//		 
//	 System.out.println("a");
//		
//		//- ------------------------ rsa 开始 ------------------------ - //
//		if(session.getAttribute("Exponent")==null || ((String)session.getAttribute("Exponent")).equals("") || session.getAttribute("Modulus")==null || ((String)session.getAttribute("Modulus")).equals("")){
//			Map<String,String> rsaMap = null;
//			String Exponent = "";
//			String Modulus = "";
//			rsaMap = RSAUserUtil.createKeyToSession(session,request,response);
//			if(rsaMap != null){
//				Exponent = rsaMap.get(RSAUserUtil.CLIENT_RSA_EXPONENT);
//				Modulus = rsaMap.get(RSAUserUtil.CLIENT_RSA_MODULUS);
//			}
//			session.setAttribute("Exponent", Exponent);
//			session.setAttribute("Modulus", Modulus);
//		}
//		 
//	
//		//- ------------------------ RSA 结束 ------------------------ - //
//		return "index";
//	}
    @RequestMapping("/login")
    public String login(Model model, HttpSession session, String jsdm,HttpServletRequest request,HttpServletResponse response,
            @RequestParam(value = "usercode", required = false) String usercode,
            @RequestParam(value = "password", required = false) String password, 
            @RequestParam(value = "code", required = false) String code, 
            @ModelAttribute(WebConstants.CURRENT_USER)
            UserEntity userEntity,String inconqxdm) throws Exception
    {
    	
        logger.debug("执行：login()");
        String ret = "index"; // 转向路径
        //session中获取验证码
        String capText = (String) session.getAttribute(WebConstants.CHECK_CODE);
        //session 中获取rsa对象
        Map<String,String> rsa = (Map)session.getAttribute(RSAUserUtil.RSA_SESSION);
        //清除验证码
        session.removeAttribute(WebConstants.CHECK_CODE);
        //清除session中rsa对象
        RSAUserUtil.removeKeyForSession(session);
        if (null == usercode || "".equals(usercode) || null == password
                || "".equals(password))
        {
        	model.addAttribute("msg","用户名或密码不允许为空");
            return ret;
        }
        
        //验证码
        if (null == jsdm || "".equals(jsdm)) {
	        
	        if(rsa==null) {
	        	model.addAttribute("msg","登陆页面已过期");
	        	return ret;
	        }	        	
	        if(code==null || code.trim().equals("")) {
	        	model.addAttribute("msg","验证码不允许为空");
	            return ret;        	
	        }
	        if(capText==null) {
	        	model.addAttribute("msg","验证码已过期");
	        	return ret;
	        }
	        
	        if(!capText.equalsIgnoreCase(code)) {	
	        	model.addAttribute("msg","输入的验证码不正确");
	            return ret;
	        }        
    	}
        Map<String, String> map = new HashMap<String, String>();
        
        if (null == jsdm || "".equals(jsdm))
        { // 正常登录
        	map.put("yhdm", RSAUserUtil.decryptToString(rsa, usercode));
            map.put("mm", IeasTool.jiami(RSAUserUtil.decryptToString(rsa, password)));
            map.put("md5",  MD5.getMD5ofStr(RSAUserUtil.decryptToString(rsa, password)));
        }
        else
        { // 切换角色登录
        	map.put("yhdm", usercode);
            map.put("mm", password);
            map.put("jsdm", jsdm);
        }
        // 登录
        userEntity = loginService.yhLogin(map);
    	/**检测密码或用户名输入错误次数 begin**/
    	Map m = RSAUserUtil.checkMmsrcw(session, request, response,userEntity);
    	//是否锁定用户登陆
    	Boolean CHECK_MMSRCWCSJL = (Boolean)m.get("CHECK_MMSRCWCSJL");
    	//密码输入错误次数
    	Integer LOGIN_TIMES = (Integer)m.get("LOGIN_TIMES");
    	//密码输入错误次数最多几次
    	Integer CHECK_MMSRCWCSS = (Integer)m.get("CHECK_MMSRCWCSS");
    	/**检测密码或用户名输入错误次数 end**/            
    	if(CHECK_MMSRCWCSJL == false) {
        	model.addAttribute("msg","用户名或密码错误"+CHECK_MMSRCWCSS+"次，请您60分钟以后再尝试!");
        	return ret;
    	}else if (userEntity == null) {
    		model.addAttribute("msg", "用户名或密码错误,您还可以尝试"+(CHECK_MMSRCWCSS-LOGIN_TIMES)+"次!");
            return ret;
        }
        userEntity.setInconqxdm(inconqxdm);
        userEntity.setCdMapList(loginService.checkCdqx(userEntity));// 访问菜单权限
        userEntity.setAnMapList(loginService.checkAnqx(userEntity));// 访问按钮权限
        session.setAttribute(WebConstants.CURRENT_USER, userEntity);
        session.setAttribute("XT_CSB_TITLE",loginService.queryCsb("SYS_TITLE"));
        //移除密码或用户名输入错误次数
        RSAUserUtil.removeMmsrcw(session, request, response, userEntity);

        return "redirect:/main";
    }

    /**
     * 跳转到主页面
     * 
     * @param session
     * @return
     */
    @RequestMapping("/main")
    public String main(HttpSession session, Model model)
    {
        logger.debug("执行：main()");
        String ret = "redirect:/"; // 转向路径
        try
        {
            UserEntity userEntity = (UserEntity) session
                    .getAttribute(WebConstants.CURRENT_USER);
            session.setAttribute("syym", userEntity.getDlzylj());
            Map<String,String> map=new HashMap<String, String>();
            Map<String,String> skin=new HashMap<String, String>();
            map.put("yhdm", userEntity.getYhdm());
            map.put("syym", userEntity.getDlzylj());
            skin=skinService.querySkin(map);
            if(skin!=null && !skin.isEmpty()){
         	   session.setAttribute("boxColorA", skin.get("BOXCOLORA"));
        		   session.setAttribute("boxColorB", skin.get("BOXCOLORB"));
        		   session.setAttribute("boxColorC", skin.get("BOXCOLORC"));
        		   session.setAttribute("boxColorD", skin.get("BOXCOLORD"));
        		   session.setAttribute("boxColorE", skin.get("BOXCOLORE"));
        		   session.setAttribute("boxColorF", skin.get("BOXCOLORF"));
        		   session.setAttribute("boxColorG", skin.get("BOXCOLORG"));
        		   session.setAttribute("boxColorDd", skin.get("BOXCOLORDD"));
        		   session.setAttribute("boxColorEe", skin.get("BOXCOLOREE"));
        		   session.setAttribute("boxColorFf", skin.get("BOXCOLORFF"));
        		   session.setAttribute("boxColorFfs", skin.get("BOXCOLORFFS"));
	         	   session.setAttribute("namKey", skin.get("NAMKEY"));
	         	   
	         	   session.setAttribute("namKeys", skin.get("NAMKEYS"));
	         	   session.setAttribute("topFontColor", skin.get("TOPFONTCOLOR"));
	         	   session.setAttribute("topFontColorR", skin.get("TOPFONTCOLORR"));
	         	   session.setAttribute("topHovR", skin.get("TOPHOVR"));
	         	   session.setAttribute("topFontLogo", skin.get("TOPFONTLOGO"));
	         	   session.setAttribute("navBtnBg", skin.get("NAVBTNBG"));
	         	   session.setAttribute("leftIconColB", skin.get("LEFTICONCOLB"));
	         	   session.setAttribute("leftIconColC", skin.get("LEFTICONCOLC"));
	         	   session.setAttribute("leftTextColA", skin.get("LEFTTEXTCOLA"));
	         	   session.setAttribute("leftTextColB", skin.get("LEFTTEXTCOLB"));
	         	   session.setAttribute("leftTextColC", skin.get("LEFTTEXTCOLC"));
	         	   session.setAttribute("leftColorHovB", skin.get("LEFTCOLORHOVB"));
	         	   session.setAttribute("leftColorHovC", skin.get("LEFTCOLORHOVC"));
	         	   session.setAttribute("mainNavCol", skin.get("MAINNAVCOL"));
	         	   session.setAttribute("navMainBg", skin.get("NAVMAINBG"));
	         	   session.setAttribute("contentBg", skin.get("CONTENTBG"));
            }


            if (userEntity != null)
            {
                ret = null == userEntity.getDlzylj()
                        || "".equals(userEntity.getDlzylj()) ? "commons/main/main_08"
                        : userEntity.getDlzylj();
                // 查询用户角色
                List<JsbEntity> jsbList = loginService.getRyjsb(userEntity);
                model.addAttribute("jsbList", jsbList);
                // 菜单 main_04
                List orderListFather = (List) loginService
                        .getFatherOrder(userEntity);
                List orderList = (List) loginService.getOrder(userEntity);
                model.addAttribute("orderListFather", orderListFather);// 上级菜单
                model.addAttribute("orderList", orderList);// 下级菜单
                // 菜单main_06
                List order1List = (List) loginService
                        .getOrder1Main06(userEntity);
                List order2List = (List) loginService
                        .getOrder2Main06(userEntity);
                model.addAttribute("order1List", order1List);
                model.addAttribute("order2List", order2List);
                // throw new Exception();
                model.addAttribute("orderkjcd",pubZjService.querykjcd(userEntity));
                
                
                //查询    mian-01的右上角消息 
                
                
                List<XxtcbEntity> listxx= xxtcService.queryXxtcMain01();
                model.addAttribute("listxx", listxx);
                session.setAttribute("syym", ret);
            }
        }
        catch (Exception e)
        {
            logger.error("执行：main() 操作失败", e);
        }
        return ret;
    }

    /**
     * 获取菜单 

     * 
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/getOrder")
    public String getOrder(Model model, HttpSession session)
    {
        logger.debug("执行：getOrder()");
        UserEntity userEntity = (UserEntity) session
                .getAttribute(WebConstants.CURRENT_USER);
        try
        {
            // 菜单
            List orderListFather = (List) loginService
                    .getFatherOrder(userEntity);
            List orderList = (List) loginService.getOrder(userEntity);
            model.addAttribute("orderListFather", orderListFather);
            model.addAttribute("orderList", orderList);
        }
        catch (Exception e)
        {
            logger.error("执行：getOrder() 操作失败", e);
        }
       
        String tzym=userEntity.getDlzylj();
        String left="";
        if(tzym.equals("commons/main/main_08")){
        	left="commons/main/left_08";
        }
        if(tzym.equals("commons/main/main_01")){
        	left="commons/main/left_01";
        }
        if(tzym.equals("commons/main/main_11")){
        	left="commons/main/left_11";
        }
        if(tzym.equals("commons/main/main_07")){
        	left="commons/main/left_07";
        }
        if(tzym.equals("commons/main/main_12")){
        	left="commons/main/left_12";
        }
        if(tzym.equals("commons/main/main_09")||tzym.equals("commons/main/main_00")){
        	left="commons/main/left_01";
        }
        return left;
        /*return "commons/main/left_01";*/
    }

    /**
     * 获取菜单 main_02
     * 
     * @param model
     * @param session
     * @param qxdm
     *            当前菜单
     * @return
     */
    @RequestMapping("/getOrder2")
    public String getOrder2(Model model, HttpSession session, String qxdm)
    {
        logger.debug("执行：getOrder2()");
        UserEntity userEntity = (UserEntity) session
                .getAttribute(WebConstants.CURRENT_USER);
        userEntity.setQxdm(qxdm);
        try
        {
            // 菜单
            List orderList = (List) loginService.getOrderMain02(userEntity);
            model.addAttribute("orderList", orderList);
        }
        catch (Exception e)
        {
            logger.error("执行：getOrder2() 操作失败", e);
        }
        return "commons/main/left_02";
    }

    /**
     * 获取菜单 main_06
     * 
     * @param model
     * @param session
     * @param qxdm
     *            当前菜单
     * @return
     */
    @RequestMapping("/getOrder6")
    public String getOrder6(Model model, HttpSession session, String qxdm)
    {
        logger.debug("执行：getOrder6()");
        UserEntity userEntity = (UserEntity) session
                .getAttribute(WebConstants.CURRENT_USER);
        userEntity.setQxdm(qxdm);
        try
        {
            // 菜单
            List order1List = (List) loginService.getOrder1Main06(userEntity);
            List order2List = (List) loginService.getOrder2Main06(userEntity);
            model.addAttribute("order1List", order1List);
            model.addAttribute("order2List", order2List);
        }
        catch (Exception e)
        {
            logger.error("执行：getOrder6() 操作失败", e);
        }
        return "commons/main/left_06";
    }

    /**
     * 返回主页
     * 
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/getReturn")
    public String getReturn(Model model, HttpSession session)
    {
        logger.debug("执行：getReturn()");
        UserEntity userEntity = (UserEntity) session
                .getAttribute(WebConstants.CURRENT_USER);
        try
        {
            // 查询用户角色
            List<JsbEntity> jsbList = loginService.getRyjsb(userEntity);
            model.addAttribute("jsbList", jsbList);
        }
        catch (Exception e)
        {
            logger.error("执行：getReturn() 操作失败", e);
        }
        return userEntity.getDlzylj();
    }

    /**
     * 注销
     * 
     * @param session
     * @param locale
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session, Locale locale)
    {
        session.removeAttribute(WebConstants.CURRENT_USER);
        session.invalidate();
        String system_url =  loader.getPropertyKey("/config/others/config.properties","system.url");
        if(system_url == null || system_url.trim().equals("")){
        	return "redirect:/";
        }
        return "redirect:"+system_url;
    }

    /**
     * 修改密码前查询密码输入是否正确
     * 
     * @param session
     * @param ysmm
     * @return
     */
    @ResponseBody
    @RequestMapping("getDlbToMm")
    public Integer getDlbToMm(HttpSession session, String ysmm)
    {
        logger.debug("执行：getDlbToMm()");
        UserEntity userEntity = (UserEntity) session
                .getAttribute(WebConstants.CURRENT_USER);
        userEntity.setMm(IeasTool.jiami(ysmm));
        Integer ret = 0;
        try
        {
            ret = loginService.getDlbToMm(userEntity);
        }
        catch (Exception e)
        {
            logger.error("执行：getDlbToMm() 操作失败", e);
        }
        return ret;
    }

    /**
     * 修改密码
     * 
     * @param session
     * @param mm
     * @return
     */
    @RequestMapping("updMm")
    public String updMm(HttpSession session, String mm)
    {
        logger.debug("执行：updMm()");
        UserEntity userEntity = (UserEntity) session
                .getAttribute(WebConstants.CURRENT_USER);
        userEntity.setMm(IeasTool.jiami(mm));
        userEntity.setSfscdl("0");
        try
        {
            loginService.updMm(userEntity);
        }
        catch (Exception e)
        {
            logger.error("执行：updMm() 操作失败", e);
        }
        session.removeAttribute(WebConstants.CURRENT_USER);
        session.setAttribute(WebConstants.CURRENT_USER, userEntity);
        return "redirect:/main";
    }



    /**
     * 确认验证码
     * 
     * @param session
     * @param code
     * @returns
     */
    @RequestMapping("/checkCode")
    @ResponseBody
    public Object checkCode(HttpSession session, String code)
    {
        String capText = (String) session.getAttribute(WebConstants.CHECK_CODE);
        if(capText==null){
        	return false;
        }
        return capText.equalsIgnoreCase(code);
    }

    /**
     * 验证登录
     * 
     * @param session
     * @param code
     * @return 
     * 0：成功
     * 1：密码错误
     * 2：无权登录
     * -1：系统错误
     */
    @RequestMapping("/checkLogin")
    @ResponseBody
    public int checkLogin(HttpSession session, String usercode,HttpServletRequest request,HttpServletResponse response,
            String password, String jsdm)
    {

        logger.debug("执行：checkLogin()");
        try
        {
            UserEntity userEntity = (UserEntity) session
                    .getAttribute(WebConstants.CURRENT_USER);
            if (userEntity != null)
            {
                return 0;
            }
            else
            {
                Map<String, String> map = new HashMap<String, String>();
                map.put("yhdm", RSAUserUtil.decryptToString(session, request, response, usercode));
                if (null == jsdm || "".equals(jsdm))
                { // 正常登录
                    String mm = IeasTool.jiami(RSAUserUtil.decryptToString(session, request, response, password));
                    map.put("mm", mm);
                    map.put("md5",  MD5.getMD5ofStr(RSAUserUtil.decryptToString(session, request, response, password)));
                }
                else
                { // 切换角色登录
                    map.put("mm", password);
                    map.put("jsdm", jsdm);
                }
                userEntity = loginService.yhLogin(map);
                if (userEntity == null) {
                    return 1;
                } else if (userEntity.getSfkdl().equals("0")) {
                	userEntity = null;
					return 2;
				} else {
                    return 0;
                }
            }
        }
        catch (Exception e)
        {
            logger.error("执行：checkLogin() 操作失败", e);
            return -1;
        }
    }

    /**
     * 创建验证码
     * 
     * @param request
     * @param response
     * @return
     * @throws IOException
     * @throws ImageFormatException
     */
    @RequestMapping("/captchaImage")
    public String captchaImage(HttpServletRequest request,
            HttpServletResponse response) throws ImageFormatException,
            IOException
    {
        response.setDateHeader("Expires", 0);
        // Set standard HTTP/1.1 no-cache headers.
        response.setHeader("Cache-Control",
                "no-store, no-cache, must-revalidate");
        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        // Set standard HTTP/1.0 no-cache header.
        response.setHeader("Pragma", "no-cache");
        // return a jpeg
        response.setContentType("image/jpeg");

        ServletOutputStream out;
        out = response.getOutputStream();
        String s = "";

        int intCount = 0;

        int width = 100;// 宽度

        int height = 33;// 高度

        char[] code = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8',
                '9', 'A', 'B', 'C', 'D', 'E', 'F'};

        Random random = new Random();// 创建一个随机数生成器类

        // 随机产生codeCount数字的验证码。
        for (int i = 0; i < 4; i++)
        {
            String strRand = String.valueOf(code[random.nextInt(code.length)]);// 得到随机产生的验证码数字
            s = s + strRand;// 将产生的四个随机数组合在一起
        }

        // 保存入session,用于与用户的输入进行比较.
        // 注意比较完之后清除session.

        request.getSession(true).setAttribute(WebConstants.CHECK_CODE, s);

        // 定义图像buffer
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);
        Graphics2D gra = image.createGraphics();

        // 将图像填充为白色
        gra.setColor(Color.WHITE);
        gra.fillRect(0, 0, width, height);

        // 创建字体，字体的大小应该根据图片的高度来定。

        // 字体对象构造方法public Font(String familyName,int style,int size)
        // familyName字体名；字体名可以分成两大类：中文字体：宋体、楷体、黑体等；英文字体：Arial、Times New Roman等等；
        // style风格。PLAIN普通字体，BOLD（加粗），ITALIC（斜体），Font.BOLD+ Font.ITALIC（粗斜体）
        // size 大小

        Font font = new Font("Times New Roman", Font.BOLD + Font.ITALIC, 26);
        // 设置字体。
        gra.setFont(font);

        // 画边框。
        gra.setColor(new Color(random.nextInt(200), random.nextInt(200), random
                .nextInt(200)));
        gra.drawRect(0, 0, width - 1, height - 1);

        // 随机产生干扰线，使图象中的认证码不易被其它程序探测到。
        gra.setColor(Color.BLACK);
        for (int i = 0; i < 25; i++)
        {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(5);
            int yl = random.nextInt(5);
            gra.setColor(new Color(random.nextInt(200), random.nextInt(200),
                    random.nextInt(200)));
            gra.drawLine(x, y, x + xl, y + yl);
        }
        // 输出数字
        char c;
        for (int i = 0; i < 4; i++)
        {
            c = s.charAt(i);
            gra.drawString(c + "", i * 22 + 4, 25); // 20为宽度，19为上下高度位置
        }
        OutputStream toClient = response.getOutputStream();
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(toClient);
        encoder.encode(image);
        toClient.close();
        out.flush();
        out.close();

        return null;
    }
    /**
     * 修改密码，根据用户代码 修改密码
     * 
     * @param session
     * @param mm
     * @return 1:成功 ； 0：未成功
     */
    @ResponseBody
    @RequestMapping("updMmByYhdm")
    public Integer updMmByYhdm(HttpSession session, String mm,UserEntity userEntity)
    {
        userEntity.setMm(IeasTool.jiami(mm));
        try
        {
            loginService.updMm(userEntity);
        }
        catch (Exception e)
        {
            logger.error("执行：updMmByYhdm() 操作失败", e);
            return 0;
        }

        return 1;
    }    
}
