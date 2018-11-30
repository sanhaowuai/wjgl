package com.incon.framework.interseptor;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.incon.common.button.service.ButtonService;
import com.incon.common.login.service.LoginService;
import com.incon.pojo.common.UserEntity;

import edu.yale.its.tp.cas.client.filter.CASFilter;
/**
 * @类名： com.incon.framework.interseptor.SystemInterceptor
 * @创建人： 林乐松
 * @日期： 2012-12-27 ：下午5:48:08
 * @修改人： 丁起明
 * @日期：
 * @描述：
 * @版本号：
 */
@Repository
public class SystemInterceptor extends HandlerInterceptorAdapter {
	@Resource(name="loginService")
	private LoginService loginService;
	@Override
	public boolean preHandle(HttpServletRequest request,
	    HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	    String path=request.getContextPath();
		String[] noFilters = new String[] {""+path+"/login",""+path+"/loginQian",""+path+"/",""+path+"/captchaImage",""+path+"/checkCode",""+path+"/checkLogin",""+path+"/logout"
				,""+path+"/customImpOrExp/queryCustomImpOrExpByjs",""+path+"/customImpOrExp/customImpOrExpZdydr"
				,""+path+"/customImpOrExp/saveImport",""+path+"/customImpOrExp/impError"
				,""+path+"/customImpOrExp/downExcel" ,""+path+"/consumerExp/excel"};
		String uri = request.getRequestURI();
		boolean beFilter = true;
		for (String s : noFilters) {
 			if (uri.equals(s)) {
				beFilter = false;
				break;
			}
		}
		if (uri.indexOf("/resources") != -1 || uri.indexOf("/upload") != -1) {
			beFilter = false;
		}
		if (beFilter) {
			UserEntity userEntity =  (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
			//obj2 CAS 中已成功登录的用户名
			String casYhdm = request.getRemoteUser();//CAS登录成功后传过来的登录用户代码
			if (null == userEntity && null==casYhdm) {
				// 未登录
				String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
				PrintWriter out = response.getWriter();
				StringBuilder builder = new StringBuilder();
				builder.append("<script type=\"text/javascript\" charset=\"UTF-8\">");
				builder.append("alert(\"页面过期，请重新登录\");");
				builder.append("window.top.location.href=\"");
				builder.append(""+basePath+"logout"+"\";</script>");
				out.print(builder.toString());
				out.close();
				return false;
			}else {
				//权限拦截
				List<HashMap> maps = loginService.getAllCd(request.getServletPath());//查询一个菜单;	
				
				HashMap map = null;
				boolean isExist = false;
				for(HashMap m : maps){
					isExist = userEntity.getCdMapList().contains(m);//判断是否有访问权限
					if(isExist){
						map = m;
						break;
					}
				}
				
				if(maps.size() > 0){
					if(isExist){
						request.setAttribute("QXB", map);//给页面传递当前访问的权限信息
						List<Map> anList =userEntity.getAnMapList();
						if(anList != null && anList.size() > 0){
							HashMap<String,Map> ANB = new HashMap<String,Map>();
							for(Map temp : anList){
								if(temp.get("QXDM").equals(map.get("QXDM"))){
									//System.out.println("找到属于当前访问的权限按钮:["+temp.get("ANMC")+"-"+temp.get("ANDH")+"]");
									ANB.put(temp.get("ANDH")+"", temp);
								}
							}
							request.setAttribute("ANB", ANB);//给页面传递当前访问的权限按钮信息key val
						}
					}else {
						throw new IllegalAccessException();// 没有访问权限//http://localhost:8080/incon4.0/jcxgxxwh/main
					}
				}else {//按钮拦截
					map = loginService.getOneAn(request.getServletPath());//查询一个按钮
					if(map != null){
						boolean isExists = userEntity.getAnMapList().contains(map);//判断是否有访问权限
						if(isExists){
						}else {
							throw new IllegalAccessException();// 没有访问权限
						}
					}
				}
			}
		}
 		return super.preHandle(request, response, handler);
	}

}
