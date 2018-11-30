package com.incon.project.common.xxtc.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.xxtc.XxtcbEntity;
/**
 * 赵玥
 * 2016-11-10
 * 消息弹出表
 */
@SuppressWarnings("all")
public interface XxtcService extends CommService{

	   
	
	//查询一个
	public XxtcbEntity queryOneXxtc(String id);
	
	//添加
	public void addXxtc(XxtcbEntity entity);
	
	//修改
	public void updXxtc(XxtcbEntity entity);
	
	//删除
	public void delXxtc(String []ids);
	
	//查询平台
	public String queryOnePt(String dldm);
	
	//修改平台
	public void updPtid(Map<String, String> map);
	
	//查询是否已读为1 的id
	public String querySfyd();
	//更新id
	public void updNotInId(String id);
	
	//查询  main  --01用
	public List<XxtcbEntity> queryXxtcMain01();
	
	//根据id查询内容
	public XxtcbEntity queryByIdNr(String id);
}
