/**
 * 
 */
package com.incon.project.webservice.swtx.services;


import java.util.List;
import java.util.Map;

import javax.jws.WebMethod;
import javax.jws.WebService;




/**
 * @author 赵玥
 * date 2016-08-11
 */
@WebService
public interface SwtxWebService  {
	
/*1
	接口名称: create()
	说明：添加事务提醒
	参数：发送人、收信人、角色、标题、内容	,是否有链接1：是；0：否,打开方式,发送时间,提醒开始时间,失效终止时间,ID删除用,是否完成;1：是；0：否,
	业务_表,业务_表_主键,系统代码,完成时间,收信人范围SQL，（如果收信人为null则，使用此SQL，默认替换#yhdm#为当前登陆人代码）；只要有一个人查看就将当前登录人用户代码写入到“收件人”字段,
	已读时间,是否已读;1：是；0：否
	返回：
*/
	@WebMethod
	public Integer create(String fsr,String sxr,String jsdm,String bt,String nr,String sfylj,String dkfs,
			String txkssj,String sxzzsj,String yw_b,String yw_b_id,String xtdm
			,String sxrfwsq,String sfsx,String ljdz);
/*2
	 接口名称: destroy()
	 参数说明：yw_b 业务表  yw_b_id 业务表id   xtdm  系统代码
	 说明：销毁消息（删除记录）
	 返回：唯一标识
	 
*/
	@WebMethod
	public Integer destroy(String yw_b,String yw_b_id,String xtdm);
	
/*3 
	 接口名称: status(page, pageSize)
	 参数说明：yw_b 业务表  yw_b_id 业务表id   xtdm  系统代码
	 说明：修改状态（修改SFSX）
	 返回：唯一标识、标题、描述
*/
	@WebMethod
	public Integer status(String yw_b,String yw_b_id,String xtdm,String sfsx);
	
	/**
	 * 接口名称: create()
	 * 说明：添加事务提醒,手机专用
	 * @param fsr 发送人
	 * @param sxr 收信人
	 * @param jsdm 角色代码
	 * @param bt 标题
	 * @param nr 内容
	 * @param sfylj 是否有链接1：是；0：否
	 * @param dkfs 打开方式
	 * @param txkssj 提醒开始时间
	 * @param sxzzsj 失效终止时间
	 * @param yw_b 业务表（ID删除用）
	 * @param yw_b_id 业务表ID （ID删除用）
	 * @param xtdm 系统代码
	 * @param sxrfwsq 收信人范围SQL，（如果收信人为null则，使用此SQL，默认替换#yhdm#为当前登陆人代码）；只要有一个人查看就将当前登录人用户代码写入到“收件人”字段
	 * @param sfsx 是否失效
	 * @param ljdz 连接地址
	 * @param zxtdm 子系统代码
	 * @param appxxdz app详细地址
	 * @return
	 */
	@WebMethod
	public Integer create(String fsr, String sxr, String jsdm, String bt, String nr,
			String sfylj, String dkfs, String txkssj, String sxzzsj,
			String yw_b, String yw_b_id, String xtdm, String sxrfwsq,
			String sfsx, String ljdz, String zxtdm, String appxxdz);
}
