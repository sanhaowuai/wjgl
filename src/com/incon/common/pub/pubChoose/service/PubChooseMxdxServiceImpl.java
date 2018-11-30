package com.incon.common.pub.pubChoose.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;
@SuppressWarnings("all")
@Service(value="pubChooseMxdxService")
public class PubChooseMxdxServiceImpl extends CommServiceImpl implements PubChooseMxdxService{

	@Override
	public List<Map<String, Object>> queryXsxxbList(Map<String, Object> xxMap) {
		// TODO Auto-generated method stub
		return dbDao.query("pubChooseMxdx.queryXsxxbList", xxMap);
	}

	@Override
	public List<Map<String, Object>> queryJsxxbList(Map<String, Object> xxMap) {
		// TODO Auto-generated method stub
		return dbDao.query("pubChooseMxdx.queryJsxxbList", xxMap);
	}

	@Override
	public List<Map<String, Object>> queryJuesxxbList(Map<String, Object> xxMap) {
		// TODO Auto-generated method stub
		return dbDao.query("pubChooseMxdx.queryJuesxxbList", xxMap);
	}

	@Override
	public List<Map<String, Object>> queryQzxxbList(Map<String, Object> xxMap) {
		// TODO Auto-generated method stub
		return dbDao.query("pubChooseMxdx.queryQzxxbList", xxMap);
	}

	@Override
	public List<Map<String, Object>> queryYxxxbList(Map<String, Object> xxMap) {
		// TODO Auto-generated method stub
		return dbDao.query("pubChooseMxdx.queryYxxxbList", xxMap);
	}

	@Override
	public List<Map<String, Object>> queryZyxxbList(Map<String, Object> xxMap) {
		// TODO Auto-generated method stub
		return dbDao.query("pubChooseMxdx.queryZyxxbList", xxMap);
	}

	@Override
	public List<Map<String, Object>> queryNjxxbList(Map<String, Object> xxMap) {
		// TODO Auto-generated method stub
		return dbDao.query("pubChooseMxdx.queryNjxxbList", xxMap);
	}

	@Override
	public List<Map<String, Object>> queryBjxxbList(Map<String, Object> xxMap) {
		// TODO Auto-generated method stub
		return dbDao.query("pubChooseMxdx.queryBjxxbList", xxMap);
	}

	@Override
	public void saveToMxdxxxb(Map<String, Object> xxMap) {
		// TODO Auto-generated method stub
		dbDao.insert("pubChooseMxdx.saveToMxdxxxb", xxMap);
	}
	
	@Override
	public List<Map<String, Object>> queryJysxxbList(Map<String, Object> xxMap) {
		return dbDao.query("pubChooseMxdx.queryJysxxbList", xxMap);
	}
	@Override
	public String queryMxdxlxToString(Map<String, Object> xxMap){
		return (String)dbDao.queryForObject("pubChooseMxdx.queryMxdxlxToString", xxMap);
	}
}
