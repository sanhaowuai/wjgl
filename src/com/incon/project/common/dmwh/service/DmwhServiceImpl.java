package com.incon.project.common.dmwh.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.project.common.dmwh.page.DmwhPage;


@SuppressWarnings("all")
@Service(value="dmwhService")
public class DmwhServiceImpl extends CommServiceImpl implements DmwhService   {

	/**
	 * 查询表结构
	 * @param tabName 表名
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, String>> queryTabStr(String tabName) {
	
		return this.dbDao.query("dmwh.queryTabStr", tabName);
	}
	@Override
	public List<Map<String, String>> queryDmwhNotPage(DmwhPage dmwhPage) {
		
		return this.dbDao.query("dmwh.queryDmwhNotPage", dmwhPage);
	}	
	/**
	 * 删除代码维护
	 * @param id 主键名
	 * @param tabName 表名
	 * @param ids 主键构成的数组
	 */
	public void deleteDmwh(String tabName, String id, String[] ids) {
		List< Map< String, String>> list = new ArrayList<Map<String,String>>();
		for (int i = 0; i < ids.length; i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("idVal", ids[i]);
			map.put("id", id);
			map.put("tabName", tabName);
			list.add(map);
		}
		this.dbDao.executeBatchOperation("dmwh.deleteDmwh", list, "delete");
	}
	/**
	 * 根据主键查询数据
	 * @param tabName 表名
	 * @param id 主键
	 * @param zhi 主键值
	 * @param tabStrList 表结构
	 * @return
	 */
	public Map<String, String> queryByID(String tabName, String id, String zhi, List<Map<String, String>> tabStrList) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idVal", zhi);
		map.put("id", id);
		map.put("tabName", tabName);
		map.put("list", tabStrList);
		return (Map<String, String>) this.dbDao.queryForObject("dmwh.queryByID", map);
	}
	/**
	 * 冲突判断
	 * @param map
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public int repeatJudg(Map<String, String> map) {
		return (Integer) this.dbDao.queryForObject("dmwh.repeatJudg", map);
	}
	/**
	 * 添加
	 * @param map
	 * @param tabName 表名
	 */
	public void addDmwh(Map<String, String> map, String tabName) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		List<String> listKey = new ArrayList<String>();  
		List<String> listValue = new ArrayList<String>();  
		Iterator<String> it = map.keySet().iterator();  
		while (it.hasNext()) {  
			String key = it.next();  
			listKey.add(key);  
			listValue.add(map.get(key));  
		}
		parameterMap.put("listKey", listKey);
		parameterMap.put("listValue", listValue);
		parameterMap.put("tabName", tabName);
		this.dbDao.update("dmwh.addDmwh", parameterMap);
	}
	/**
	 * 修改
	 * @param map
	 * @param zhi 主键值
	 * @param id 主键
	 * @param tabName 表名
	 */
	public void updateDmwh(Map<String, String> map, String tabName, String id, String zhi) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();  
		Iterator<String> it = map.keySet().iterator();  
		while (it.hasNext()) {  
			String key = it.next();  
			list.add(key + "='" +map.get(key)+"'");  
		}
		parameterMap.put("list", list);
		parameterMap.put("id", id);
		parameterMap.put("idVal", zhi);
		parameterMap.put("tabName", tabName);
		this.dbDao.update("dmwh.updateDmwh", parameterMap);
	}
	/**
	 * 查询可维护表名
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, String>> queryTabName() {
		return this.dbDao.query("dmwh.queryTabName");
	}
	/**
	 * 根据表名查询List
	 * @param tableName 表名
	 * @return
	 */
	public List<Map> queryListTabName(String tableName) {
		return this.dbDao.query("dmwh.queryListTabName", tableName);
	}

	public List<Map> queryJclxdmb() {
		return this.dbDao.query("dmwh.queryJclxdmb");
	}
	@Override
	public void importDmwh(List<Map<String, String>> savedatalist, String tablename) {
		// TODO Auto-generated method stub
		List list =new ArrayList();
		
		List<Map> DM_DMFKB_List=(List<Map>) this.dbDao.query("dmwh.queryDM_DMFKB", tablename);
		Map<String,Map> DM_DMFKB_Map = new HashMap();
		for(Map mmm:DM_DMFKB_List){
			
			DM_DMFKB_Map.put(mmm.get("ZZD")+"", mmm);
		}
		
		for (Map m:savedatalist) {
	    Map<String, Object> parameterMap = new HashMap<String, Object>();
			List<String> listKey = new ArrayList<String>();  
			List<String> listValue = new ArrayList<String>();  
			 
		Iterator<String> it = m.keySet().iterator();  
		
		while (it.hasNext()) {  
			String key = it.next();  
			Map mm=new HashMap();
			if (DM_DMFKB_Map!=null && !DM_DMFKB_Map.isEmpty()){
				  Map ckey = DM_DMFKB_Map.get(key);
				if(ckey!=null && !ckey.isEmpty()){
					if ("1".equals(ckey.get("GLFS"))){
					 List<Map>  l=(List<Map>) this.dbDao.query("dmwh.queryTableFK",ckey);
					 for(Map m1:l){
						 mm.put(m1.get("MC"), m1.get("DM"));
					 }
					}else{
						  String GDZ = (String) ckey.get("GDZ");
						  String[] GDZS = GDZ.split(",");
						  for(String gs:GDZS){
							  mm.put(gs.split(":")[1], gs.split(":")[0]);
						  }
					}
				}
			}
			listKey.add(key);  
			if (mm.get(m.get(key)+"")!=null && !"".equals(mm.get(m.get(key)+""))){
				listValue.add(mm.get(m.get(key)+"")+"");
			}else{
				listValue.add(m.get(key)+"");  
			}  
		}
		parameterMap.put("listKey", listKey);
		parameterMap.put("listValue", listValue);
		parameterMap.put("tabName", tablename);
		list.add(parameterMap);
		}
		this.dbDao.executeBatchOperation("dmwh.addDmwh", list,"insert");
	}

	
	/**
	 * <p>查询表 的约束条件 丁起明 20161207</p>
	 * @param tablename 表明
	 * @return 返回 List<HashMap> 
	 */
	@Override
	public List< Map< String, String>> queryTabConstraints(String tablename){
		return dbDao.query("dmwh.queryTabConstraints", tablename);
	}
}
