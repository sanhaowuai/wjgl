package com.incon.project.cjcx.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.cjcx.Cjszb;
import com.incon.pojo.common.cjcx.Qmcjcx;
@SuppressWarnings("unchecked")
@Service(value = "cjcxService")
public class CjcxServiceImpl extends CommServiceImpl implements CjcxService{
	
	//查询成绩开关设置表数据
	public Cjszb queryCjszb(){
		return (Cjszb)dbDao.queryForObject("cjcx.queryCjszb", null);
	}
	
	//查询成绩开关
	public int querySfKf(String xh){
		return (Integer)dbDao.queryForObject("cjcx.querySfKf", xh);
	}
	
	//查询成绩复核开始，结束时间
	public Cjszb queryCjfhsj(String xnxq){
		return (Cjszb) dbDao.queryForObject("cjcx.queryCjfhsj", xnxq);
	}
	
	@Override
	public String queryXnxq() {
		
		return dbDao.queryForObject("cjcx.queryXnxq", "").toString();
	}
	
	//成绩说明备注
	public Map<String,String> queryCjsmbz(){
		return (Map<String,String>) dbDao.queryForObject("cjcx.queryCjsmbz", null);
	}
	
	
	// 查询评价是否开放
	public int queryPjsfkf(String xnxq){
		return (Integer) dbDao.queryForObject("cjcx.queryPjsfkf", xnxq);
	}
	
	//查询期末成绩信息
	public Qmcjcx queryCjrwxx(String id){
		return (Qmcjcx) dbDao.queryForObject("cjcx.queryCjrwxx", id);
	}
	
	
	//查询任务的累加分项信息 - 医大
	public List<com.incon.pojo.common.cjcx.Rwmbxx> queryRwmbxxListRwByYd(String rwh,String jhh){
		HashMap  map = new  HashMap();
		map.put("rwh",rwh);
		map.put("jhh",jhh);
		return dbDao.query("cjcx.queryRwmbxxListRwByYd", map);
	}
	//学生成绩是否能查询判断
	public Map<String, String> querySfckcjObj(Map<String, String> map){
		dbDao.query("cjcx.jw_cj_sfckcjpd", map);
		return map;
	}
	
}
