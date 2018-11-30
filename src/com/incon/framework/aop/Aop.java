package com.incon.framework.aop;
import java.lang.reflect.Method;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.RzEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.project.common.rzgl.service.RzService;


/**
 * @类名： com.incon.framework.aop.Aop
 * @创建人： 樊旭  于洋
 * @日期： 2014-03-12
 * @修改人：于洋
 * @日期：2014-3-21 
 * @修改说明：1.将记录日志方法从环绕通知转移到最后通知  并且将add upd del定义切面分离
 * 			  2.add upd不使用ProceedingJoinPoint对象  用反射记录方法参数（解决传入实体类参数不好辨认问题）
 * 			  3.解决插入日志每次插入相同两条数据bug
 * @描述：切面记录日志
 * @版本号：
 */
@Aspect
@Component
public class Aop{
	@Resource(name="rzService")
	private RzService rzService;
	
	/**
	 * 添加业务逻辑方法切入点
	 */
	//@Pointcut("execution(* com.incon.project.*.*.service..*.add*(..)) || execution(* com.incon.project.*.*.*.service..*.add*(..))")
	@Pointcut("execution(* com.incon.project.*..*.service..*.add*(..)) || execution(* com.incon.project.*.*.*.service..*.add*(..))")
	public void addServiceCall(){ }
	       
	/**
	 * 修改业务逻辑方法切入点
	 */
	//@Pointcut("execution(* com.incon.project.*.*.service..*.upd*(..)) || execution(* com.incon.project.*.*.*.service..*.upd*(..))")
	@Pointcut("execution(* com.incon.project.*..*.service..*.upd*(..)) || execution(* com.incon.project.*.*.*.service..*.upd*(..))")
	public void updServiceCall(){ }
	 
	/**
	 * 删除业务逻辑方法切入点
	 */
	//@Pointcut("execution(* com.incon.project.*.*.service..*.del*(..)) || execution(* com.incon.project.*.*.*.service..*.del*(..))")
	@Pointcut("execution(* com.incon.project.*..*.service..*.del*(..)) || execution(* com.incon.project.*.*.*.service..*.del*(..))")
	public void delServiceCall(){ }

	/**
	 * 添加业务逻辑方法切入点（后置通知）
	 * @param joinPoint
	 * @param methodLog
	 */
	@AfterReturning("addServiceCall() && @annotation(methodLog)")
	public void addServiceCallCalls(JoinPoint joinPoint,MethodLog methodLog){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		UserEntity userEntity = (UserEntity)request.getSession().getAttribute(WebConstants.CURRENT_USER);
		try {
			//获取方法名   
			String methodName = joinPoint.getSignature().getName();
			//获取操作内容   
			String opContent = adminOptionContent(joinPoint.getArgs(), methodName);   
			RzEntity rzEntity = new RzEntity();
			rzEntity.setCzr(null == userEntity.getYhdm() ? "" : userEntity.getYhdm());    //操作人
			rzEntity.setCzff(methodName);    //操作方法
			rzEntity.setCzffms(methodLog.description());   //操作方法描述
			rzEntity.setCs(opContent);     //操作方法参数
			rzEntity.setCzrjs(null == userEntity.getJsmc() ? "" : userEntity.getJsmc());         //操作人角色
			rzService.save(rzEntity);
		} catch (Exception e) {
			System.err.println("增加记录日志操作失败!!");
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改业务逻辑方法切入点（后置通知）
	 * @param joinPoint
	 * @param methodLog
	 */
	@AfterReturning("updServiceCall() && @annotation(methodLog)")
	public void updServiceCallCalls(JoinPoint joinPoint,MethodLog methodLog){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		UserEntity userEntity = (UserEntity)request.getSession().getAttribute(WebConstants.CURRENT_USER);
		try {
			//获取方法名   
			String methodName = joinPoint.getSignature().getName();
			//获取操作内容   
			String opContent = adminOptionContent(joinPoint.getArgs(), methodName);   
			RzEntity rzEntity = new RzEntity();
			rzEntity.setCzr(null == userEntity.getYhdm() ? "" : userEntity.getYhdm());    //操作人
			rzEntity.setCzff(methodName);    //操作方法
			rzEntity.setCzffms(methodLog.description());   //操作方法描述
			rzEntity.setCs(opContent);     //操作方法参数
			rzEntity.setCzrjs(null == userEntity.getJsmc() ? "" : userEntity.getJsmc());         //操作人角色
			rzService.save(rzEntity);
		} catch (Exception e) {
			System.err.println("修改记录日志操作失败!!");
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除业务逻辑方法切入点（环绕通知）
	 * @param joinPoint
	 * @param methodLog
	 * @return object
	 */
	@Around("delServiceCall() && @annotation(methodLog)")
	public Object delServiceCalls(ProceedingJoinPoint point,MethodLog methodLog){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		UserEntity userEntity = (UserEntity)request.getSession().getAttribute(WebConstants.CURRENT_USER);
		Object object = null;
		try {
			String monthName = point.getSignature().getName();  //获取方法名
	        String cs = "参数：[";
	        //String opContent = optionContent(point.getArgs(),monthName);   //获取方法内容
	        if (point.getArgs() != null && point.getArgs().length > 0) {
	            for (int i = 0; i < point.getArgs().length; i++) {
	                if(point.getArgs()[i]!=null){
	                	if(point.getArgs()[i].getClass().getSimpleName().equals("String[]")){
	                		String[] s = (String[]) point.getArgs()[i];
	                		cs += point.getArgs()[i].getClass().getSimpleName()+"{";
	                		StringBuffer sb = new StringBuffer();
	                		if(s != null && s.length>0){
		                		for(int j=0;j<s.length;j++){
		                			sb.append(s[j]);
		                		}
		                		cs +=sb.toString()+"},";	                			
	                		}
	                	}else {
	                		cs += point.getArgs()[i].toString()+",";
	                	}
	                }else{
	                    cs +="null"+",";
	                }
	            }  
	        } 
	        cs = cs.substring(0,cs.length()-1)+"]";
			object = point.proceed();
	        RzEntity rzEntity = new RzEntity();
	        rzEntity.setCzr(null == userEntity.getYhdm() ? "" : userEntity.getYhdm());    //操作人
	        rzEntity.setCzff(monthName);    //操作方法
	        rzEntity.setCzffms(methodLog.description());   //操作方法描述
	        rzEntity.setCs(cs);     //操作方法参数
	        rzEntity.setCzrjs(null == userEntity.getJsmc() ? "" : userEntity.getJsmc());         //操作人角色
	        rzService.save(rzEntity);
		} catch (Throwable e) {
			System.err.println("删除记录日志操作失败!!");
			e.printStackTrace();
		}
		return object;
	}
	
	/** 
     * 使用Java反射来获取被拦截方法(insert、update)的参数值， 
     * 将参数值拼接为操作内容 
     * @param args
     * @param mName
     * @return rs
     */
	public String adminOptionContent(Object[] args,String mName){
        if(args == null){
            return null;
        }
        StringBuffer rs = new StringBuffer();
        rs.append(mName);
        String className = null;
        int index = 1;
        //遍历参数对象
        for(Object info : args){
            //获取对象类型
            className = info.getClass().getName();
            className = className.substring(className.lastIndexOf(".") + 1);
            rs.append("[参数" + index + "，类型：" + className + "，值：");
            //获取对象的所有方法
            Method[] methods = info.getClass().getDeclaredMethods();
            //遍历方法，判断get方法
            for(Method method : methods){
                String methodName = method.getName();
                //判断是不是get方法
                if(methodName.indexOf("get") == -1){	//不是get方法  
                    continue;	//不处理
                }
                Object rsValue = null;
                try{
                	//调用get方法，获取返回值
                    rsValue = method.invoke(info);
                    if(rsValue == null){	//没有返回值 
                        continue;
                    }
                }catch(Exception e){
                    continue;
                }
                //将值加入内容中
                rs.append("(" + methodName + " : " + rsValue + ")");
            }
            rs.append("]");
            index++;
        }
        return rs.toString();
    }  
}
