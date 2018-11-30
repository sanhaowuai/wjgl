package com.incon.project.cjcx.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.cjcx.Cjszb;
import com.incon.pojo.common.cjcx.Qmcjcx;
import com.incon.pojo.common.cjcx.Rwmbxx;

@SuppressWarnings("unchecked")
public interface CjcxService extends CommService  {
	
	//查询成绩开关设置表数据
	public Cjszb queryCjszb();	
	
	//查询成绩开关
	public int querySfKf(String xh);	
	//查询成绩复核开始，结束时间
	public Cjszb queryCjfhsj(String xnxq);
	
	public String queryXnxq();
	//成绩说明备注
	public Map<String,String> queryCjsmbz();
	
	
	// 查询评价是否开放
	public int queryPjsfkf(String xnxq);
	
	//查询期末成绩信息
	public Qmcjcx queryCjrwxx(String id);
	
	//查询任务的累加分项信息 - 医大
	public List<Rwmbxx> queryRwmbxxListRwByYd(String rwh,String jhh);
	

	//学生成绩是否能查询判断
	public Map<String, String> querySfckcjObj(Map<String, String> map);
}
