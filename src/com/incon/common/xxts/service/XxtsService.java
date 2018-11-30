package com.incon.common.xxts.service;

import com.incon.framework.service.CommService;

/**
 * 消息推送
 * @author 丁起明
 *
 */
public interface XxtsService extends CommService{
	/**
	 * POST发送消息
	 * @param xxbt 消息标题
	 * @param url 消息访问路径
	 * @param xxjsrdm 消息接收人代码
	 * @param zxtdm 子系统代码
	 */
	Integer postMessage(String xxbt, String url, String xxjsrdm, String zxtdm)throws Exception;
	/**
	 * GET发送消息
	 * @param xxbt 消息标题
	 * @param url 消息访问路径
	 * @param xxjsrdm 消息接收人代码
	 * @param zxtdm 子系统代码
	 */
	Integer getMessage(String xxbt, String url, String xxjsrdm, String zxtdm)throws Exception;

}
