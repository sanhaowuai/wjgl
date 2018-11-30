package com.incon.project.common.xxfbxx.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.xxfbxx.XxfbEntity;
/**
 * 
 * @类名：com.incon.project.common.xxfbxx.service.XxfbxxService
 * @创建人：安智博
 * @日期：2016-8-17
 * @描述：学校发布信息接口
 */
@SuppressWarnings("all")
public interface XxfbxxService extends CommService{
	//查询信息类别
	public List<Map<String, String>> queryXxlblist();
	//查询部门集合
	public List<Map<String, String>> queryFbbmlist();

	// 添加学校发布信息
	public String addXxfbxx(XxfbEntity xxfbEntity);
	
	// 修改学校发布信息
	public void updXxfbxx(XxfbEntity xxfbEntity);
	
	// 删除学校发布信息
	public void delXxfbxx(String[] xxids);

	// 根据信息 ID 查询学校发布信息
	public XxfbEntity queryXxfbxxByXxid(String xxid);
	// 根据信息 ID 查询学校发布信息
	public XxfbEntity queryXxByXxid(XxfbEntity xxfby);
	//查询附件集合
	public List<Map<String, String>> querFjlist(XxfbEntity xxfby);
	 
	
	/**
	 * 添加或修改学校发布信息
	 * 在plupload.js中添加附件方法
	 * @param CCLJ 附件链接, GLB 关联表名, GLZJ 关联主键, YHM 上传人, GLZJZ 关联主键值 
	 *  	  qfjs 上传前附件名称数组, hfjs 上传后附件名称数组, del_fjs 要删除的附件ID数组
 	 */
	public void addOrUpdXxfbxx(String CCLJ, String GLB, String GLZJ,
			String YHM, String GLZJZ, String[] qfjs, String[] hfjs,
			String[] delFjs, XxfbEntity entity);
	
	public void addOrUpdXxfbxx(String YHM,XxfbEntity entity);
	// 信息发布
	public void updXxfb(XxfbEntity entity, UserEntity userEntity);
}
