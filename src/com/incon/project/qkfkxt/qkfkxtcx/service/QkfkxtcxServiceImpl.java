package com.incon.project.qkfkxt.qkfkxtcx.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.qkfkxt.QkfkxtFksqbEntity;
import com.incon.pojo.common.xxfbxx.XxfbEntity;



@SuppressWarnings("all")
@Service(value="qkfkxtcxService")
public class QkfkxtcxServiceImpl  extends CommServiceImpl implements QkfkxtcxService {

	@Override
	public QkfkxtFksqbEntity queryBySqdh(Map<String,String> map) {
		
		return (QkfkxtFksqbEntity) this.queryForObject("qkfkxtcx.queryBySqdh", map);
	}

	@Override
	public List<Map<String,Object>> queryBySqdhAll(Map<String,String> map) {
		
		return this.query("qkfkxtcx.queryBySqdhAll",map);
	}
	

	/***
	 * 查询附件集合
	 * 
	 * **/
	@Override
	public List<Map<String, String>> querFjlist(String sqdh) {
		// TODO Auto-generated method stub
		return  dbDao.query("qkfkxtcx.querFjlist",sqdh);
	}

	@Override
	public List<Map<String, String>> queryCybFjlist(String id) {
		// TODO Auto-generated method stub
		return  dbDao.query("qkfkxtcx.querFjlist",id);
	}
	
	
}
