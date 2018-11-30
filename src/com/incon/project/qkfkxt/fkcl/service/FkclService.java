package com.incon.project.qkfkxt.fkcl.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.WebService;

import com.incon.framework.service.CommService;
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
public interface FkclService extends CommService
{
	/**
	 * 查询反馈项目
	 * 
	 */
	public FkclEntity fkcx(FkclPage fkclPage);
	
	public List<Map<String,String>> queryBySqdhAll(Map<String,String> map);
	
	
	/**
	 * 添加或修改学校发布信息
	 * 在plupload.js中添加附件方法
	 * @param CCLJ 附件链接, GLB 关联表名, GLZJ 关联主键, YHM 上传人, GLZJZ 关联主键值 
	 *  	  qfjs 上传前附件名称数组, hfjs 上传后附件名称数组, del_fjs 要删除的附件ID数组
 	 */
	public void addOrUpdXxfbxx(String CCLJ, String GLB, String GLZJ,
			String YHM, String GLZJZ, String[] qfjs, String[] hfjs,
			String[] delFjs, FkclEntity entity);
	
	
	public void addFkcx(HashMap<String,String> map);
	
	public String yhxm(String yhdm);
	
	public String sqid(String sqdh);
}
