package com.incon.common.consumerExp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.incon.common.consumerExp.page.ConsumerExpEntity;
import com.incon.common.customImpOrExp.page.ImpColEntity;
import com.incon.framework.service.impl.CommServiceImpl;
/**
 * 自定义导出模板
 * 赵恒
 * 2016年11月29日
 */
@SuppressWarnings("all")
@Service(value="consumerExpService")
public class ConsumerExpServiceImpl extends CommServiceImpl implements ConsumerExpService{

	@Override
	public List<HashMap<String, String>> queryById(String id) {
		return dbDao.query("consumerExp.queryById",id);
	}

	@Override
	public ConsumerExpEntity queryTabById(String id) {
		return (ConsumerExpEntity)dbDao.queryForObject("consumerExp.queryMbxxById", id);
	}

	@Override
	public String updateTabAndCol(ConsumerExpEntity consumerExpEntity,String[] arr) {
		String res = "0";
		//查询字段表中是否存在数据，若无则添加，反之修改
		List<HashMap<String,String>> mapList = dbDao.query("consumerExp.queryByTabId", consumerExpEntity.getId());
		//修改(先删除再添加)
		String column_en = "";
		String column_zh = "";
		if(mapList.size()>0){
			dbDao.delete("consumerExp.deleteCol", consumerExpEntity.getId());
			//列或列名字
			for(int i=0;i<arr.length;i++){
				String[] temp = arr[i].split("##");
				column_en = temp[0];
				column_zh = temp[1];
				consumerExpEntity.setColumn_en(column_en);
				consumerExpEntity.setColumn_zh(column_zh);
				dbDao.insert("consumerExp.saveCol", consumerExpEntity);
			}
			dbDao.update("consumerExp.updateTab", consumerExpEntity);
			res = "1";
		//保存(直接添加)	
		}else{
			for(int i=0;i<arr.length;i++){
				String[] temp = arr[i].split("##");
				column_en = temp[0];
				column_zh = temp[1];
				consumerExpEntity.setColumn_en(column_en);
				consumerExpEntity.setColumn_zh(column_zh);
				dbDao.insert("consumerExp.saveCol", consumerExpEntity);
			}
			dbDao.update("consumerExp.updateTab", consumerExpEntity);
			res = "1";
		}
		return res;
	}

	@Override
	public String deleteConsumerExp(String[] ids) {
		String res = "0";
		try{
			for(int i=0;i<ids.length;i++){
				dbDao.delete("consumerExp.deleteConsumerExp", ids[i]);
				dbDao.delete("consumerExp.deleteConsumerExpCol", ids[i]);
			}
			res = "1";
		}catch(Exception e){
			res = "0";
			e.printStackTrace();		
		}
		return res;
	}
	@Override
	public List<Map<String,String>> queryTabColsByTabName(Map map) {
		List<Map<String,String>> tabColumns = dbDao.query("consumerExp.queryTabColsByTabName", map);  
		return tabColumns;
	}
}
