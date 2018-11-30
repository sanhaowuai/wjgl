package com.incon.project.webservice.bmxxgl.services;

import javax.jws.WebMethod;
import javax.jws.WebService;


/**
 * @author zjn
 * date 2016-08-18
 */
@WebService
public interface BmxxglWebService {

	
	/**
		接口名称: yxxxbc
		说明：学院发布信息保存
		参数： xxbt 信息标题，xxnr 信息内容，fbr 发布人(登陆人用户代码), sfyfj 是否有附件 1是0否，sfhz是否回执， kjyhlx可见用户类型   0.所有  1.教师  2.学生，
			kjyhfw可见用户范围   0所有 ;逗号隔开多个学院(支持多选)，
			sffb是否发布   1.发布   0.保存，xxlb信息类别代码表（PT_XT_XXLBDMB）  
		业务表:pt_xt_xxfb
		返回：1成功 0失败
	*/
	@WebMethod
	public String yxxxbc(String xxbt,String xxnr,String fbr,String sfyfj,String sfhz,String kjyhlx,String kjyhfw,
			String sffb,String xxlb,String zxtdm);
	
	
	/**
		接口名称: yxxxfb
		说明：发布学院信息(更新sffb字段)
		参数：xxid(主键)
		业务表:pt_xt_xxfb
		返回：1成功 0失败
	 */
	@WebMethod
	public String yxxxfb(String xxid);
	
}
