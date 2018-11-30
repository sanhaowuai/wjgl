package com.incon.project.webservice.xxfbxx.services;

import javax.annotation.Resource;
import javax.jws.WebService;

import org.springframework.stereotype.Component;

import com.incon.pojo.common.xxfbxx.XxfbEntity;
import com.incon.project.common.xxfbxx.service.XxfbxxService;
@SuppressWarnings("all")
@Component
@WebService(serviceName = "XxfbxxWebService", endpointInterface = "com.incon.project.webservice.xxfbxx.services.XxfbxxWebService")
public class XxfbxxWebServiceImpl implements XxfbxxWebService{
	
	
	@Resource(name = "xxfbxxService")
	private  XxfbxxService xxfbxxService;
	

	/**
	 * 添加或修改学校发布信息
	 * 在plupload.js中添加附件方法
	 * @param  YHM 上传人, 
	 *  	
	 *       xxbt 信息标题，xxnr 信息内容，sfyfj 是否有附件，kjhylx 可见用户类型，sffb 是否发布
	 *       xxlb  信息类别
	 *          @return 1:成功 0：失败
 	 */
	@Override
	public String addOrUpdXxfbxx(
			String YHM, String xxbt,String xxnr,String sfyfj,
			String kjyhlx,String sffb,String xxlb,String zxtdm) {
		String flg = "1";
		try {
			XxfbEntity xxfbEntity = new XxfbEntity();
			xxfbEntity.setXxbt(xxbt);
			xxfbEntity.setXxnr(xxnr);
			xxfbEntity.setSfyfj(sfyfj);
			xxfbEntity.setKjyhfw(kjyhlx);
			xxfbEntity.setSffb(sffb);
			xxfbEntity.setXxlb(xxlb);
			xxfbEntity.setZxtdm(zxtdm);
			xxfbxxService.addOrUpdXxfbxx( YHM,  xxfbEntity);
		} catch (Exception e) {
			// TODO: handle exception
			flg="0";
		}
		return flg;
		
	}
	
	 

}
