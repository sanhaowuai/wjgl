package com.incon.project.qkfkxt.qkfkycl.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.qkfkxt.FkclEntity;
import com.incon.pojo.common.qkfkxt.QkfkxtFksqbEntity;
import com.incon.pojo.common.xxfbxx.XxfbEntity;
import com.incon.project.qkfkxt.fkcl.page.FkclPage;

@SuppressWarnings("all")
public interface QkfkyclService extends CommService {
//查询项目列表
public List<Map<String, String>> queryxmmc();

//查询紧急程度列表
public List<Map<String, String>> queryjjcd();

//查询变更类型
public List<Map<String, String>> queryqkfklx();

//批量删除反馈情况
public void delqkfk(String []ids);

//查询教师列表
public List<Map<String, String>> queryjs();

//批量提交反馈情况
public boolean tjqkfk(String[] sqdh);

public FkclEntity fkcx(FkclPage fkclPage);

//查看单条情况反馈
public QkfkxtFksqbEntity queryqkfkByone(String sqdh);

public String addqkfk(QkfkxtFksqbEntity qkfkxtFksqbEntity);

public void updqkfk(QkfkxtFksqbEntity qkfkxtFksqbEntity);

public void addOrUpdqkfk(String YHM,QkfkxtFksqbEntity entity);

public boolean tjfk(Map<String, String> map);

public boolean qurwc(Map<String, String> map);
/**
 * 添加或修改学校发布信息
 * 在plupload.js中添加附件方法
 * @param CCLJ 附件链接, GLB 关联表名, GLZJ 关联主键, YHM 上传人, GLZJZ 关联主键值 
 *  	  qfjs 上传前附件名称数组, hfjs 上传后附件名称数组, del_fjs 要删除的附件ID数组
	 */
public void addOrUpdXxfbxx(String CCLJ, String GLB, String GLZJ,
		String YHM, String GLZJZ, String[] qfjs, String[] hfjs,
		String[] delFjs, QkfkxtFksqbEntity entity,String xz,HashMap mapz);
}
