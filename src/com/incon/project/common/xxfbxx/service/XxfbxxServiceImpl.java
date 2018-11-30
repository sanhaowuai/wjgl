package com.incon.project.common.xxfbxx.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.JsxxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.xxfbxx.XxfbEntity;
/**
 * 
 * @类名：com.incon.project.common.xxfbxx.service.XxfbxxServiceImpl
 * @创建人：安智博
 * @日期：2016-8-17
 * @描述：学校发布信息实现类
 */
@SuppressWarnings("all")
@Service(value= "xxfbxxService")
public class XxfbxxServiceImpl extends CommServiceImpl implements XxfbxxService{
/***
 * 查询部门集合
 * 
 * 
 * */
	@Override
	public List<Map<String, String>> queryFbbmlist() {
		// TODO Auto-generated method stub
		return dbDao.query("xxfbxx.queryFbbmlist");
	}

	@Override
	public List<Map<String, String>> queryXxlblist() {
		System.out.println("========");
		// TODO Auto-generated method stub
		return dbDao.query("xxfbxx.queryXxlblist");
	}

	@MethodLog(description = "添加学校发布信息")
	@Override
	public String addXxfbxx(XxfbEntity xxfbEntity) {
		return (String) dbDao.insert("xxfbxx.addXxfbxx", xxfbEntity);
	}

	@Override
	public XxfbEntity queryXxfbxxByXxid(String xxid) {
		return (XxfbEntity) dbDao.queryForObject("xxfbxx.queryXxfbxxByXxid", xxid);
	}

	@MethodLog(description = "修改学校发布信息")
	@Override
	public void updXxfbxx(XxfbEntity xxfbEntity) {
		dbDao.update("xxfbxx.updXxfbxx", xxfbEntity);
	}

	@MethodLog(description = "删除学校发布信息")
	@Override
	public void delXxfbxx(String[] xxids) {
		dbDao.executeBatchOperation("xxfbxx.delXxfbxx", Arrays.asList(xxids), "delete");
	}

	@Override
	@MethodLog(description = "查询学校信息")
	@Transactional
	public XxfbEntity queryXxByXxid(XxfbEntity xxfby) {
		// TODO Auto-generated method stub
		dbDao.insert("xxfbxx.addXxfbckjl", xxfby);
		return (XxfbEntity) dbDao.queryForObject("xxfbxx.queryXxByXxid",xxfby);
	}
	/***
	 * 查询附件集合
	 * 
	 * **/
	@Override
	public List<Map<String, String>> querFjlist(XxfbEntity xxfby) {
		// TODO Auto-generated method stub
		return  dbDao.query("xxfbxx.querFjlist",xxfby);
	}
	/**
	 * 添加或修改学校发布信息
	 * 在plupload.js中添加附件方法
	 * @param CCLJ 附件链接, GLB 关联表名, GLZJ 关联主键, YHM 上传人, GLZJZ 关联主键值 
	 *  	  qfjs 上传前附件名称数组, hfjs 上传后附件名称数组, del_fjs 要删除的附件ID数组
 	 */
	//@MethodLog(description = "添加或修改学校发布信息")
	@Transactional
	@Override
	public void addOrUpdXxfbxx(String CCLJ, String GLB, String GLZJ,
			String YHM, String GLZJZ, String[] qfjs, String[] hfjs,
			String[] del_fjs, XxfbEntity entity) {
		GLZJZ = entity.getXxid();			//新闻 ID
		JsxxbEntity jsxx = (JsxxbEntity) dbDao.queryForObject("xxfbxx.queryJsxxByZgh", YHM);
		entity.setFbr(jsxx.getZgh());
		entity.setFbrxm(jsxx.getJsxm());
		entity.setFbrxydm(jsxx.getXydm());
		entity.setFbrxymc(jsxx.getYxmc());
		if(GLZJZ == null || "".equals(GLZJZ)){//新增
			GLZJZ = (String) dbDao.insert("xxfbxx.addXxfbxx", entity);
		}else{//修改
			dbDao.update("xxfbxx.updXxfbxx", entity);
		}
		if (del_fjs != null && del_fjs.length != 0) {
			dbDao.executeBatchOperation("upload.deleteFj", Arrays.asList(del_fjs), "delete");
		}
		if (qfjs != null && qfjs.length != 0) {
			for (int i = 0; i < qfjs.length; i++) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("CCLJ", CCLJ); 		//附件链接
				map.put("GLB", GLB); 		//表名
				map.put("GLZJ", GLZJ); 		//关联主键
				map.put("GLZJZ", GLZJZ); 	//关联主键值
				map.put("SCR", YHM ); 		//上传人
				map.put("XSMC", qfjs[i]); 	//文件名
				map.put("CCM", hfjs[i]); 	//文件存储名
				dbDao.insert("upload.addFj", map);
			}
	 	}
		// 查询附件表  更新 '是否有附件' 标志位
		dbDao.update("xxfbxx.updateSfyfj", GLZJZ);
	}

	@Override
	public void addOrUpdXxfbxx(String YHM, XxfbEntity entity) {
		// TODO Auto-generated method stub
		JsxxbEntity jsxx = (JsxxbEntity) dbDao.queryForObject("xxfbxx.queryJsxxByZgh", YHM);
		entity.setFbr(jsxx.getZgh());
		entity.setFbrxm(jsxx.getJsxm());
		entity.setFbrxydm(jsxx.getXydm());
		entity.setFbrxymc(jsxx.getYxmc());
		if(entity.getXxid() == null || "".equals(entity.getXxid())){//新增
			 dbDao.insert("xxfbxx.addXxfbxx", entity);
		}else{//修改
			dbDao.update("xxfbxx.updXxfbxx", entity);
		}
	}

	@MethodLog(description = "学校信息发布")
	@Override
	public void updXxfb(XxfbEntity entity, UserEntity userEntity) {
		JsxxbEntity jsxx = (JsxxbEntity) dbDao.queryForObject("xxfbxx.queryJsxxByZgh", userEntity.getYhdm());
		entity.setFbr(jsxx.getZgh());
		entity.setFbrxm(jsxx.getJsxm());
		entity.setFbrxydm(jsxx.getXydm());
		entity.setFbrxymc(jsxx.getYxmc());
		entity.setSffb("1");
		dbDao.update("xxfbxx.updXxfb", entity);
	}

}
