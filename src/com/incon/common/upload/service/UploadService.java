package com.incon.common.upload.service;

import java.util.List;
import com.incon.framework.service.CommService;
import com.incon.pojo.common.FjbEntity;
 
 
public interface UploadService extends CommService {

	/**
	 * 在plupload.js中查询出的附件方法
	 * @param GLB 关联表名, GLZJ 关联主键, GLZJZ 关联主键值
	 * @return 查询出附件List
	 */
	public List<FjbEntity> queryFj(String GLB,String GLZJ,String GLZJZ);
	
	/**
	 * 在plupload.js中添加附件方法
	 * @param CCLJ 附件链接, GLB 关联表名, GLZJ 关联主键, YHM 上传人, GLZJZ 关联主键值 
	 *  	  qfjs 上传前附件名称数组, hfjs 上传后附件名称数组, del_fjs 要删除的附件ID数组
 	 */
	public void addFj(String CCLJ,String GLB,String GLZJ,String YHM,String GLZJZ,String[] qfjs, String[] hfjs,String[] delfjs);
 

	/**
	 * 在plupload.js中查询出的附件方法
	 * @param GLB 关联表名, GLZJ 关联主键, GLZJZ 关联主键值,CCLJ 附件连接
	 * @return 删除附件
	 */
	public void deleteFj(String GLB,String GLZJ,String GLZJZ,String CCLJ);
}
