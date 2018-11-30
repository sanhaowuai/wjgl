package com.incon.project.webservice.dbsx.services;

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
import com.incon.pojo.common.dbsx.DbsxEntity;
import com.incon.project.dbsx.service.DbsxService;
/* @author 赵玥
 * date 2016-08-10
 */
@SuppressWarnings("all")
@Component 
@WebService(serviceName="DbsxWebService",endpointInterface="com.incon.project.webservice.dbsx.services.DbsxWebServiceImpl")
public class DbsxWebServiceImpl implements DbsxWebService{
	 private final static Logger log = Logger.getLogger(DbsxWebServiceImpl.class);
	@Resource(name="dbsxService")
	private DbsxService dbsxService;
	@Override
	
	//crate("发送人","收信人","角色代码","标题","内容","是否有连接","打开方式","提醒开始时间","结束时间","是否完成","业务表","业务表id","系统代码","完成时间","收件人sql","连接地址")
	public Integer create(String fsr,String sxr,String jsdm,String bt,String nr,String sfylj,String dkfs,
			String txkssj,String sxzzsj,String sfwc,String yw_b,String yw_b_id,String xtdm
			,String wcsj,String sxrfwsq,String ljdz) {
		Integer falg=0;
		try {
			DbsxEntity dbsxEntity = new DbsxEntity();
			//发送人姓名
			dbsxEntity.setFsr(fsr);
			//收信人代码
			dbsxEntity.setSxr(sxr);
			//角色代码
			dbsxEntity.setJsdm(jsdm);
			//标题
			dbsxEntity.setBt(bt);
			//内容
			dbsxEntity.setNr(nr);
			//是否有连接{1：是；0：否；}
			dbsxEntity.setSfylj(sfylj);
			//浏览器打开方式,例如：{_blank} 等等
			dbsxEntity.setDkfs(dkfs);
			//提醒开始时间 格式 {yyyy-MM-dd HH:mm:ss}
			dbsxEntity.setTxkssj(txkssj);
			//提醒截至时间 格式 {yyyy-MM-dd HH:mm:ss}
			dbsxEntity.setSxzzsj(sxzzsj);
			//代办事项是否完成｛1：是；0：否；｝
			dbsxEntity.setSfwc(sfwc);
			//代办事项完成时间 格式｛yyyy-MM-dd HH:mm:ss｝
			dbsxEntity.setWcsj(wcsj);
			//业务表名
			dbsxEntity.setYw_b(yw_b);
			//业务表数据ID
			dbsxEntity.setYw_b_id(yw_b_id);
			//系统代码
			dbsxEntity.setXtdm(xtdm);
			//收信人查询范围SQL，替换变量为 {#yhdm#}
			dbsxEntity.setSxrfwsq(sxrfwsq);
			//路径地址
			dbsxEntity.setLjdz(ljdz);
			dbsxService.addDbsx(dbsxEntity);
			falg=1;
		} catch (Exception e) {
			log.error("(webScrivce)DbsxWebService.create 错误", e);
			falg=0;
		}
		return falg;
	}
	
	@Override
	//app专用
	//crate("发送人","收信人","角色代码","标题","内容","是否有连接","打开方式","提醒开始时间","结束时间","是否完成","业务表","业务表id","系统代码","完成时间","收件人sql","连接地址","子系统代码","app详细地址")
	public Integer create(String fsr,String sxr,String jsdm,String bt,String nr,String sfylj,String dkfs,
			String txkssj,String sxzzsj,String sfwc,String yw_b,String yw_b_id,String xtdm
			,String wcsj,String sxrfwsq,String ljdz,String zxtdm,String appxxdz) {
		Integer falg=0;
		try {
			DbsxEntity dbsxEntity = new DbsxEntity();
			//发送人姓名
			dbsxEntity.setFsr(fsr);
			//收信人代码
			dbsxEntity.setSxr(sxr);
			//角色代码
			dbsxEntity.setJsdm(jsdm);
			//标题
			dbsxEntity.setBt(bt);
			//内容
			dbsxEntity.setNr(nr);
			//是否有连接{1：是；0：否；}
			dbsxEntity.setSfylj(sfylj);
			//浏览器打开方式,例如：{_blank} 等等
			dbsxEntity.setDkfs(dkfs);
			//提醒开始时间 格式 {yyyy-MM-dd HH:mm:ss}
			dbsxEntity.setTxkssj(txkssj);
			//提醒截至时间 格式 {yyyy-MM-dd HH:mm:ss}
			dbsxEntity.setSxzzsj(sxzzsj);
			//代办事项是否完成｛1：是；0：否；｝
			dbsxEntity.setSfwc(sfwc);
			//代办事项完成时间 格式｛yyyy-MM-dd HH:mm:ss｝
			dbsxEntity.setWcsj(wcsj);
			//业务表名
			dbsxEntity.setYw_b(yw_b);
			//业务表数据ID
			dbsxEntity.setYw_b_id(yw_b_id);
			//系统代码
			dbsxEntity.setXtdm(xtdm);
			//收信人查询范围SQL，替换变量为 {#yhdm#}
			dbsxEntity.setSxrfwsq(sxrfwsq);
			//路径地址
			dbsxEntity.setLjdz(ljdz);
			//子系统代码
			dbsxEntity.setZxtdm(zxtdm);
			//app详细路径
			dbsxEntity.setAppxxdz(appxxdz);
			dbsxService.addDbsx(dbsxEntity);
			falg=1;
		} catch (Exception e) {
			log.error("(webScrivce)DbsxWebService.create 错误[手机端]", e);
			falg=0;
		}
		return falg;
	}	
	
	//destroy("业务表","业务表id","系统代码");
	@Override
	public Integer destroy(String yw_b, String yw_b_id, String xtdm) {
		// TODO Auto-generated method stub
		Integer falg=0;
		try {

			DbsxEntity dbsxEntity = new DbsxEntity();		
			//业务表名
			dbsxEntity.setYw_b(yw_b);
			//业务表数据ID
			dbsxEntity.setYw_b_id(yw_b_id);
			//系统代码
			dbsxEntity.setXtdm(xtdm);
			dbsxService.delDbsx(dbsxEntity);
			falg=1;
		} catch (Exception e) {
			// TODO: handle exception
			log.error("(webScrivce)DbsxWebService.destroy 错误", e);
			falg=0;
		}
		return falg;
	}
	//status("业务表","业务表id","系统代码","是否完成","完成时间");
	@Override
	public Integer status(String yw_b, String yw_b_id, String xtdm,String sfwc,String wcsj) {
		Integer falg=0;
		try {

			DbsxEntity dbsxEntity = new DbsxEntity();		
			//业务表名
			dbsxEntity.setYw_b(yw_b);
			//业务表数据ID
			dbsxEntity.setYw_b_id(yw_b_id);
			//系统代码
			dbsxEntity.setXtdm(xtdm);
			//代办事项是否完成｛1：是；0：否；｝
			dbsxEntity.setSfwc(sfwc);
			//代办事项完成时间 格式｛yyyy-MM-dd HH:mm:ss｝
			dbsxEntity.setWcsj(wcsj);
			dbsxService.updDbsx(dbsxEntity);
			falg=1;
		} catch (Exception e) {
			log.error("(webScrivce)DbsxWebService.status 错误", e);
			falg=0;
		}
		return falg;
	}

	public static void main(String[] args) throws Exception {

		Client client;
		try {
			//crate("发送人","收信人","角色代码","标题","内容","是否有连接","打开方式","提醒开始时间","结束时间","是否完成","业务表","业务表id","系统代码","完成时间","收件人sql","连接地址")
			client = new Client(
					new URL(
							"http://192.168.0.126:8080/incon3.2/services/DbsxWebService?wsdl"));
			if (client == null) {
				System.out.println("null");
			}
			Object[] results = client.invoke("create", new Object[] {"丁起明","admin","1","你有新的代办事项0902","内容我是内容。。。。",
					"1","_blank","2016-02-09 20:20:20","2019-02-09 20:20:20","0",
					"业务表","业务表id","系统代码","","收件人sql","连接地址"});
			
			Object[] results_2 = client.invoke("create1", new Object[] {"丁起明","admin","1","你有新的代办事项0902","内容我是内容。。。。",
					"1","_blank","2016-02-09 20:20:20","2019-02-09 20:20:20","1",
					"业务表","业务表id","系统代码","2019-01-09 20:20:20","收件人sql","连接地址","zxtdm","www.baidu.com"});
			
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
	
