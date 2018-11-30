package com.incon.project.webservice.xxfbxx.services;

import javax.jws.WebService;

import com.incon.pojo.common.xxfbxx.XxfbEntity;
@WebService
public interface XxfbxxWebService {
	/**
	 * 添加或修改学校发布信息
	 * 在plupload.js中添加附件方法
	 * @param CCLJ 附件链接, GLB 关联表名, GLZJ 关联主键, YHM 上传人, GLZJZ 关联主键值 
	 *  	  qfjs 上传前附件名称数组, hfjs 上传后附件名称数组, del_fjs 要删除的附件ID数组,
	 *       xxbt 信息标题，xxnr 信息内容，sfyfj 是否有附件，sfhz 是否回执，kjhylx 可见用户类型，sffb 是否发布，url 访问url
	 *       xxlb  信息类别
	 *   @return 1:成功 0：失败
 	 */
	public String  addOrUpdXxfbxx(String YHM, String xxbt,String xxnr,String sfyfj,
			String kjyhlx,String sffb,String xxlb,String zxtdm);
}
