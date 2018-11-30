package com.incon.framework.interseptor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.incon.common.button.service.ButtonService;
import com.incon.pojo.common.UserEntity;

/**
 * @类名： com.incon.framework.interseptor.WebPowerInterceptor
 * @创建人： 
 * @日期： 2014-5-4 
 * @修改人：
 * @日期：
 * @描述：页面按钮显示控制
 * @版本号：
 */
@Repository
public class WebPowerInterceptor extends HandlerInterceptorAdapter{
	@Resource(name="buttonService")
	private ButtonService buttonService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
		    HttpServletResponse response, Object handler) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	    String path=request.getContextPath();
		String[] noFilters = new String[] {""+path+"/login"};//lmnr/queryById
		String uri = request.getRequestURI();
		boolean beFilter = true;
		for (String s : noFilters) {
 			if (uri.equals(s)) {
				beFilter = false;
				break;
			}
		}
		
		if (uri.indexOf("/resources") != -1) {
			beFilter = false;
		}
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		UserEntity userEntity = (UserEntity)request.getSession().getAttribute(WebConstants.CURRENT_USER);
		if(userEntity != null){
			String url = request.getServletPath();
			String newurl = url.substring(1);
			
			Map<String,String> obj = new HashMap<String,String>();
			String qxdm = "";
			if(null != buttonService.queryCddmByFwlj(newurl)&& !"".equals(buttonService.queryCddmByFwlj(newurl))){
				qxdm = buttonService.queryCddmByFwlj(newurl);
				obj.put("yhdm", userEntity.getYhdm());
				obj.put("jsdm", String.valueOf(userEntity.getJsdm()));
				obj.put("qxdm", qxdm);
				List pageAnList = this.buttonService.queryAnbOrder(obj);
//				for(int i=0;i<pageAnList.size();i++){
//					Map map = (HashMap)pageAnList.get(i);
//					System.out.println("当前可以操作的按钮"+i +":"+map.get("ANDH"));
//				}
				modelAndView.addObject("pageAnList", pageAnList);
			}
		}
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
