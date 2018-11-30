package com.incon.project.common.dmwh.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.project.common.dmwh.page.DmwhPage;







public interface DmwhService extends CommService {
	/**
	 * 查询表结构
	 * @param tabName 表名
	 * @return
	 */
	public List<Map<String, String>> queryTabStr(String tabName);
	/**
	 * 删除代码维护
	 * @param id 主键名
	 * @param tabName 表名
	 * @param ids 主键构成的数组
	 */
	public void deleteDmwh(String tabName, String id, String[] ids);
	/**
	 * 根据主键查询数据
	 * @param tabName 表名
	 * @param id 主键
	 * @param zhi 主键值
	 * @param tabStrList 表结构
	 * @return
	 */
	public Map<String, String> queryByID(String tabName, String id, String zhi, List<Map<String, String>> tabStrList);
	/**
	 * 冲突判断
	 * @param map
	 * @return
	 */
	public int repeatJudg(Map<String, String> map);
	/**
	 * 添加
	 * @param map
	 * @param tabName 表名
	 */
	public void addDmwh(Map<String, String> map, String tabName);
	/**
	 * 修改
	 * @param map
	 * @param zhi 主键值
	 * @param id 主键
	 * @param tabName 表名
	 */
	public void updateDmwh(Map<String, String> map, String tabName, String id, String zhi);
	/**
	 * 查询可维护表名
	 * @return
	 */
	public List<Map<String, String>> queryTabName();
	/**
	 * 根据表名查询List
	 * @param tableName 表名
	 * @return
	 */
	public List<Map> queryListTabName(String tableName);
	
	/**
	 * 基础代码类型表
	 * @param tableName
	 * @return
	 */
	public List<Map> queryJclxdmb() ;
	public void importDmwh(List<Map<String, String>> savedatalist, String object);
	public List<Map< String, String>> queryTabConstraints(String tablename);
	List<Map<String, String>> queryDmwhNotPage(DmwhPage dmwhPage);
}

