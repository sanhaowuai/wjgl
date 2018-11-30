package com.incon.common.pub.pubXnxq.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@SuppressWarnings("all")
public interface PubXnxqService {
	
	// 查询学生入学以来再多两学期的学年学期
	public List<Map<String, String>> queryXsXnxqDxq(String xh);
	//查询学年学期
	public List<Map> queryPubXnxq(HashMap map);
	/**
	 * @描述： 查询当前学年学期及以后的学年学期
	 */
	public List<Map<String, String>> queryAfterDqXnxq(String xh);
	/**
	 * @描述：查询指定学年学期 
	 */
	public Map<String, String> queryXnxqByOne(String xnxq);
	
	/**
	 * @描述：查询当前学年学期
	 */
	public Map<String, String> queryDqXnxq();
	
	/**
	 * @描述：查询校区
	 */
	public List<Map<String, String>> queryXiaoquList();
	

	/**
	 * @描述：查询全部正常学年学期
	 */
	public List<Map<String, String>> queryXnxqList();
	
	
	//查询系统参数表
	public Map<String, String>  queryXtcsb(String cs) ;
}
