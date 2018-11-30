package com.incon.project.common.zygl.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;

/**
 * 
 * @类名：  com.incon.project.common.zygl.service.ZyglService
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
public interface ZyglService extends CommService{

	   //新增专业
	   public void addZy(ZybEntity zybEntity);
	   
	   //查询一个专业
	   public Map<String,String> queryOneZy(String zydm);
	   
		//修改专业
		public void updZy(ZybEntity zybEntity);
	   
		//删除专业
		public void delZy(String[] ids);
		
		//查询zydm是否重复
		public Integer queryByZydmCount(String zydm);
		
		//查询所属院系
		public List<Map> querySsyxList();
		
		//查询所属系
		public List<Map> querySsxList(String ssy);
		
		//查询所属专业
		public List<Map> querySszyList(String ssy);
}
