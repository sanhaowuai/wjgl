package com.incon.project.common.bmxxgl.service;

 
import java.util.Arrays;

import java.util.HashMap;
import java.util.List;

import com.incon.framework.aop.MethodLog;
 
import java.util.List;
import java.util.Map;

 
import com.incon.framework.service.CommService;
 
import com.incon.pojo.common.XxfbbEntity;
 
 
import com.incon.pojo.common.FjbEntity;
import com.incon.pojo.common.XxfbbEntity;
 

public interface BmxxglService extends CommService{
	
	//新增
	 
	public void addGg(XxfbbEntity xxfbbEntity,String yhdm,String [] qfjs,String[]   hfjs,String [] del_fjs);
	//修改
	 
	//@MethodLog(description="修改通知公告")
	public void updGg(XxfbbEntity xxfbbEntity,String yhdm,String [] qfjs,String[]   hfjs,String [] del_fjs);
	 
	 
	public void delGg(String[] ids);
	//  查询附件表  更新 '是否有附件' 标志位
 
	public void updSfyfj(String xxid);
	//查询id
	public String queryXwid();
	
	public XxfbbEntity queryOneXxfb(String xxid);
	
	public void updateGgSffb(String xxid);
	public List<HashMap<String,String>> queryLb();


	public void addXxfbHzb(Map<String, String> map);

	public FjbEntity queryFjByFjbh(String fjbh);

	public List<FjbEntity> queryFj(String string, String string2, String xxid);

	public void yxxxbc(XxfbbEntity xxfbbEntity);

}
