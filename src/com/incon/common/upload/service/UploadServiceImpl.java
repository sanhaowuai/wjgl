package com.incon.common.upload.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;
import com.incon.framework.page.Page;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.FjbEntity;

@SuppressWarnings("all")
@Service(value="uploadService")
public class UploadServiceImpl extends CommServiceImpl implements UploadService {
 
	/**
	 * 在plupload.js中查询出的附件方法
	 * @param GLB 关联表名, GLZJ 关联主键, GLZJZ 关联主键值
	 * @return 查询出附件List
	 */
	public List<FjbEntity> queryFj(String GLB,String GLZJ,String GLZJZ) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("GLB", GLB); 		//表名
		map.put("GLZJ", GLZJ); 		//关联主键
		map.put("GLZJZ", GLZJZ); 	//关联主键值
		return dbDao.query("upload.queryFj", map);
	}
	
	/**
	 * 在plupload.js中添加附件方法
	 * @param CCLJ 附件链接, GLB 关联表名, GLZJ 关联主键, YHM 上传人, GLZJZ 关联主键值 
	 *  	  qfjs 上传前附件名称数组, hfjs 上传后附件名称数组, del_fjs 要删除的附件ID数组
 	 */
	public void addFj(String CCLJ,String GLB,String GLZJ,
			String YHM,String GLZJZ,String[] qfjs,String[] hfjs,String[] del_fjs){
		
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
 
 
	/**
	 * 在plupload.js中查询出的附件方法
	 * @param GLB 关联表名, GLZJ 关联主键, GLZJZ 关联主键值,CCLJ 附件链接
	 * @return 删除附件
	 */
	public void deleteFj(String GLB,String GLZJ,String GLZJZ,String CCLJ){
		Map<String, String> map = new HashMap<String, String>();
		map.put("GLB", GLB); 		//表名
		map.put("GLZJ", GLZJ); 		//关联主键
		map.put("GLZJZ", GLZJZ); 	//关联主键值
		map.put("CCLJ", CCLJ);
		List<FjbEntity> listFj = dbDao.query("upload.queryFj", map);
		List<String> ids=new ArrayList<String>();
		for(int i=0;i<listFj.size();i++){
			if(listFj.get(i).getFjid()!=null){
				ids.add(listFj.get(i).getFjid());
			}
		}
		dbDao.executeBatchOperation("upload.deleteFj",ids,"delete");
	}
}
