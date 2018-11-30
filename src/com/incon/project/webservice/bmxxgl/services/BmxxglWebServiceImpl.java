package com.incon.project.webservice.bmxxgl.services;

import java.net.MalformedURLException;
import java.net.URL;

import javax.annotation.Resource;
import javax.jws.WebService;

import org.apache.log4j.Logger;
import org.codehaus.xfire.client.Client;
import org.springframework.stereotype.Component;

import com.incon.pojo.common.XxfbbEntity;
import com.incon.project.common.bmxxgl.service.BmxxglService;


/* @author zjn
 * date 2016-08-18
 */
@SuppressWarnings("all")
@Component
@WebService(serviceName = "BmxxglWebService", endpointInterface = "com.incon.project.webservice.bmxxgl.services.BmxxglWebService")
public class BmxxglWebServiceImpl implements BmxxglWebService{

	private final static Logger log = Logger.getLogger(BmxxglWebServiceImpl.class);
	
	@Resource(name="bmxxglService")
	private BmxxglService bmxxService;
	
	
	/**
		接口名称: yxxxbc
		说明：学院发布信息保存
		参数：xxbt 信息标题，xxnr 信息内容，fbr 发布人(登陆人用户代码), sfyfj 是否有附件 1是0否，sfhz是否回执， kjyhlx可见用户类型   0.所有  1.教师  2.学生，
			kjyhfw可见用户范围   0所有 ;逗号隔开多个学院(支持多选)，
			sffb是否发布   1.发布   0.保存，xxlb信息类别代码表（PT_XT_XXLBDMB）   
		业务表:pt_xt_xxfb
		返回：1成功 0失败
	*/
	@Override
	public String yxxxbc(String xxbt, String xxnr, String fbr, String sfyfj,
			String sfhz, String kjyhlx, String kjyhfw, String sffb,
			String xxlb,String zxtdm) {
		String flg = "1";
		try{
			XxfbbEntity xxfbbEntity = new XxfbbEntity();
			
			xxfbbEntity.setFbr(fbr);
			xxfbbEntity.setXxbt(xxbt);
			xxfbbEntity.setXxnr(xxnr);
			xxfbbEntity.setSfyfj(sfyfj);
			xxfbbEntity.setSfhz(sfhz);
			xxfbbEntity.setKjyhlx(kjyhlx);
			xxfbbEntity.setKjyhfw(kjyhfw);
			xxfbbEntity.setSffb(sffb);
			xxfbbEntity.setXxlb(xxlb);
			xxfbbEntity.setZxtdm(zxtdm);
			bmxxService.yxxxbc(xxfbbEntity);
			
		}catch(Exception e){
			flg = "0";
			e.printStackTrace();
		}
		return flg;
	}

	/**
		接口名称: yxxxfb
		说明：发布学院信息(更新sffb字段)
		参数：xxid(主键)
		业务表:pt_xt_xxfb
		返回：1成功 0失败
	 */
	@Override
	public String yxxxfb(String xxid) {
		String flg = "1";
		try{
			bmxxService.updateGgSffb(xxid);
		}catch(Exception e){
			flg = "0";
			e.printStackTrace();
		}
		return flg;
	}
	
}
