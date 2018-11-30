package com.incon.project.qkfkxt.fkcl.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.JsxxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
import com.incon.pojo.common.dbsx.DbsxEntity;
import com.incon.pojo.common.lwgl.KxkzybEntity;
import com.incon.pojo.common.lwgl.LwsbbEntity;
import com.incon.pojo.common.lwgl.XsxtbEntity;
import com.incon.pojo.common.lwgl.XtczbEntity;
import com.incon.pojo.common.qkfkxt.FkclEntity;
import com.incon.pojo.common.xxfbxx.XxfbEntity;
import com.incon.project.dbsx.page.DbsxPage;
import com.incon.project.qkfkxt.fkcl.page.FkclPage;


@SuppressWarnings("all")
@Service(value = "fkclService")
public class FkclServiceImpl extends CommServiceImpl implements FkclService
{

	
	    @Override
		@Transactional
		public FkclEntity fkcx(FkclPage fkclPage) {
	    	
	    	return (FkclEntity) dbDao.queryForObject("fkcl.queryFkclts",fkclPage);
			
		}
	    
	    
	    @Override
		public List<Map<String,String>> queryBySqdhAll(Map<String,String> map) {
			
			return this.query("fkcl.queryBySqdhAll",map);
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
				String[] del_fjs, FkclEntity entity) {
			String sqdh = entity.getSqdh();		
			GLZJZ=(String)dbDao.queryForObject("fkcl.sqid", sqdh);
//			JsxxbEntity jsxx = (JsxxbEntity) dbDao.queryForObject("xxfbxx.queryJsxxByZgh", YHM);
//			entity.setFbr(jsxx.getZgh());
//			entity.setFbrxm(jsxx.getJsxm());
//			entity.setFbrxydm(jsxx.getXydm());
//			entity.setFbrxymc(jsxx.getYxmc());
//			if(GLZJZ == null || "".equals(GLZJZ)){//新增
//				GLZJZ = (String) dbDao.insert("xxfbxx.addXxfbxx", entity);
//			}else{//修改
//				dbDao.update("xxfbxx.updXxfbxx", entity);
//			}
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
			
		}
		
		@Transactional
		 
		public void addFkcx(HashMap<String,String> map){
			
			 dbDao.update("fkcl.bhxsxk", map);
		}
		

	    @Override
		public String yhxm(String yhdm) {
			
			return (String) this.queryForObject("fkcl.yhxm", yhdm);
		}
	    
	    @Override
	  		public String sqid(String sqdh) {
	  			
	  			return (String) this.queryForObject("fkcl.sqid", sqdh);
	  		}
		
}
