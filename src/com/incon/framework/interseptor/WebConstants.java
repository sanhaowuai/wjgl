package com.incon.framework.interseptor;

 /**
  * 
  * @类名：com.incon.framework.interseptor.WebConstants
  * @创建人：林乐松
  * @日期： 2013-8-10  : 上午9:08:18
  * @修改人：
  * @日期：
  * @描述：  
  * @版本号：
  */
public interface WebConstants {
	/** 超时提醒 */
	public static final String TIME_OUT = "{\"error\":true,\"msg\":\"登录超时,请重新登录！\"}";
	/** 保存session中的admin用户key */
	public static final String CURRENT_USER = "CURRENT_USER";
	/** Session 验证码 */
	public static final String CHECK_CODE = "CheckCode";
}
