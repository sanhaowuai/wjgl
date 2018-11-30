package com.incon.common.pub.pubChoose.service;
import java.util.List;
import java.util.Map;
public interface PubChooseMxdxService {
	/**
	 * 查询学生信息表
	 * @param xxMap
	 * @return
	 */
	public List<Map<String,Object>> queryXsxxbList(Map<String,Object> xxMap);
	
	/**
	 * 查询教师信息表
	 * @param xxMap
	 * @return
	 */	
	public List<Map<String,Object>> queryJsxxbList(Map<String,Object> xxMap);
	
	/**
	 * 查询角色信息表
	 * @param xxMap
	 * @return
	 */
	public List<Map<String,Object>> queryJuesxxbList(Map<String,Object> xxMap);
	
	/**
	 * 查询群组信息表
	 * @param xxMap
	 * @return
	 */	
	public List<Map<String,Object>> queryQzxxbList(Map<String,Object> xxMap);
	
	/**
	 * 查询院系信息表
	 * @param xxMap
	 * @return
	 */
	public List<Map<String,Object>> queryYxxxbList(Map<String,Object> xxMap);
	
	/**
	 * 查询专业信息表
	 * @param xxMap
	 * @return
	 */		
	public List<Map<String,Object>> queryZyxxbList(Map<String,Object> xxMap);
	
	/**
	 * 查询年级信息表
	 * @param xxMap
	 * @return
	 */		
	public List<Map<String,Object>> queryNjxxbList(Map<String,Object> xxMap);	
	
	/**
	 * 查询班级信息表
	 * @param xxMap
	 * @return
	 */		
	public List<Map<String,Object>> queryBjxxbList(Map<String,Object> xxMap);
	
	/**
	 * 保存到面向对象表中
	 * @param xxMap
	 * @return
	 */
	public void saveToMxdxxxb(Map<String,Object> xxMap);
	
	/**
	 * 查询教研室信息表
	 * @param xxMap
	 * @return
	 */	
	public List<Map<String, Object>> queryJysxxbList(Map<String, Object> xxMap);

	String queryMxdxlxToString(Map<String, Object> xxMap);
	
	
}
