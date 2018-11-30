package com.incon.project.webservice.swtx.services;

import java.io.ByteArrayOutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.jws.WebService;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.apache.log4j.Logger;
import org.codehaus.xfire.client.Client;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import com.incon.framework.dao.DbDaoImpl;
import com.incon.framework.util.SpringContextHolder;
import com.incon.framework.util.XmlConverUtil;
import com.incon.pojo.common.swtx.SwtxEntity;
import com.incon.project.dbsx.service.DbsxService;
import com.incon.project.swtx.service.SwtxService;
import com.incon.project.webservice.dbsx.services.DbsxWebServiceImpl;

/* @author 赵玥
 * date 2016-08-10
 */
@SuppressWarnings("all")
@Component
@WebService(serviceName = "SwtxWebService", endpointInterface = "com.incon.project.webservice.swtx.services.SwtxWebService")
public class SwtxWebServiceImpl implements SwtxWebService {
	private final static Logger log = Logger.getLogger(SwtxWebServiceImpl.class);
	@Resource(name = "swtxService")
	private SwtxService swtxService;

	// crate("发送人","收信人","角色代码","标题","内容","是否有连接","打开方式","提醒开始时间","结束时间","业务表","业务表id","系统代码","收件人sql","是否失效","连接地址")
	@Override
	public Integer create(String fsr, String sxr, String jsdm, String bt,
			String nr, String sfylj, String dkfs, String txkssj, String sxzzsj,
			String yw_b, String yw_b_id, String xtdm, String sxrfwsq,
			String sfsx, String ljdz) {
		Integer falg = 0;
		try {
			
			SwtxEntity swtxEntity = new SwtxEntity();
			//发信人姓名
			swtxEntity.setFsr(fsr);
			//收信人代码
			swtxEntity.setSxr(sxr);
			//角色代码
			swtxEntity.setJsdm(jsdm);
			//标题
			swtxEntity.setBt(bt);
			//内容
			swtxEntity.setNr(nr);
			//是否有连接{1：是；0：否；}
			swtxEntity.setSfylj(sfylj);
			//浏览器打开方式,例如：{_blank} 等等
			swtxEntity.setDkfs(dkfs);
			//提醒开始时间 格式 {yyyy-MM-dd HH:mm:ss}
			swtxEntity.setTxkssj(txkssj);
			//提醒截至时间 格式 {yyyy-MM-dd HH:mm:ss}
			swtxEntity.setSxzzsj(sxzzsj);
			//业务表名
			swtxEntity.setYw_b(yw_b);
			//业务表数据ID
			swtxEntity.setYw_b_id(yw_b_id);
			//系统代码
			swtxEntity.setXtdm(xtdm);
			//收信人查询范围SQL，替换变量为 {#yhdm#}
			swtxEntity.setSxrfwsq(sxrfwsq);
			//是否失效{1：是；0：否；}
			swtxEntity.setSfsx(sfsx);
			//路径地址
			swtxEntity.setLjdz(ljdz);
			swtxService.addSwtx(swtxEntity);
			falg = 1;
		} catch (Exception e) {
			e.printStackTrace();
			log.error("(webScrivce)SwtxWebServiceImpl.create 错误", e);
			falg = 0;
		}
		return falg;
	}
	
	//app专用
	// crate("发送人","收信人","角色代码","标题","内容","是否有连接","打开方式","提醒开始时间","结束时间","业务表","业务表id","系统代码","收件人sql","是否失效","连接地址","子系统代码","app详细地址")
	@Override
	public Integer create(String fsr, String sxr, String jsdm, String bt,
			String nr, String sfylj, String dkfs, String txkssj, String sxzzsj,
			String yw_b, String yw_b_id, String xtdm, String sxrfwsq,
			String sfsx, String ljdz,String zxtdm,String appxxdz) {
		Integer falg = 0;
		try {
			
			SwtxEntity swtxEntity = new SwtxEntity();
			//发信人姓名
			swtxEntity.setFsr(fsr);
			//收信人代码
			swtxEntity.setSxr(sxr);
			//角色代码
			swtxEntity.setJsdm(jsdm);
			//标题
			swtxEntity.setBt(bt);
			//内容
			swtxEntity.setNr(nr);
			//是否有连接{1：是；0：否；}
			swtxEntity.setSfylj(sfylj);
			//浏览器打开方式,例如：{_blank} 等等
			swtxEntity.setDkfs(dkfs);
			//提醒开始时间 格式 {yyyy-MM-dd HH:mm:ss}
			swtxEntity.setTxkssj(txkssj);
			//提醒截至时间 格式 {yyyy-MM-dd HH:mm:ss}
			swtxEntity.setSxzzsj(sxzzsj);
			//业务表名
			swtxEntity.setYw_b(yw_b);
			//业务表数据ID
			swtxEntity.setYw_b_id(yw_b_id);
			//系统代码
			swtxEntity.setXtdm(xtdm);
			//收信人查询范围SQL，替换变量为 {#yhdm#}
			swtxEntity.setSxrfwsq(sxrfwsq);
			//是否失效{1：是；0：否；}
			swtxEntity.setSfsx(sfsx);
			//路径地址
			swtxEntity.setLjdz(ljdz);
			//子系统代码
			swtxEntity.setZxtdm(zxtdm);
			//app详细地址
			swtxEntity.setAppxxdz(appxxdz);
			swtxService.addSwtx(swtxEntity);
			falg = 1;
		} catch (Exception e) {
			e.printStackTrace();
			log.error("(webScrivce)SwtxWebServiceImpl.create 错误【手机专用】", e);
			falg = 0;
		}
		return falg;
	}
	// destroy("业务表","业务表id","系统代码");
	@Override
	public Integer destroy(String yw_b, String yw_b_id, String xtdm) {
		// TODO Auto-generated method stub
		Integer falg = 0;
		try {			
			SwtxEntity swtxEntity = new SwtxEntity();
			//业务表名
			swtxEntity.setYw_b(yw_b);
			//业务表数据ID
			swtxEntity.setYw_b_id(yw_b_id);
			//系统代码
			swtxEntity.setXtdm(xtdm);
			swtxService.delSwtx(swtxEntity);
			falg = 1;
		} catch (Exception e) {
			log.error("(webScrivce)SwtxWebServiceImpl.destroy 错误", e);
			falg = 0;
		}
		return falg;
	}

	// status("业务表","业务表id","系统代码");
	@Override
	public Integer status(String yw_b, String yw_b_id, String xtdm, String sfsx) {
		Integer falg = 0;
		try {
			SwtxEntity swtxEntity = new SwtxEntity();
			//业务表名
			swtxEntity.setYw_b(yw_b);
			//业务表数据ID
			swtxEntity.setYw_b_id(yw_b_id);
			//系统代码
			swtxEntity.setXtdm(xtdm);		
			//是否失效{1：是；0：否；}
			swtxEntity.setSfsx(sfsx);
			swtxService.updSwtx(swtxEntity);
			falg = 1;
		} catch (Exception e) {
			log.error("(webScrivce)SwtxWebServiceImpl.status 错误", e);
			falg = 0;
		}
		return falg;
	}
	


	
	public static void main(String[] args) throws Exception {
		//
		// WebServiceClientTest test = new WebServiceClientTest();
		//
		// test.testClient();
		Client client;
		try {
			// crate("发送人","收信人","角色代码","标题","内容","是否有连接","打开方式","提醒开始时间","结束时间","业务表","业务表id","系统代码","收件人sql","是否失效","连接地址")
			client = new Client(
					new URL(
							"http://192.168.0.126:8080/incon3.2/services/SwtxWebService?wsdl"));
			if (client == null) {
				System.out.println("null");
			}
			Object[] results = client.invoke("create", new Object[] {"丁起明","admin","1","标题","内容",
					"1","_blank","2016-02-09 20:20:20","2019-04-05 20:20:20",
					"业务表","业务表id","incon","","0","http://www.baidu.com/"});
			
			Object[] results_2 = client.invoke("create1", new Object[] {"丁起明","admin","1","标题","内容",
					"1","_blank","2016-02-09 20:20:20","2019-04-05 20:20:20",
					"业务表","业务表id","incon","","0","http://www.baidu.com/","zxtdm","www.baidu.com"});
			
			//client.invoke("getInt",new Object[]{"222222222222222222222222222222"});
			//System.out.println(results[0]);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


}
