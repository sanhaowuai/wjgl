package com.incon.project.qkfkxt.qkfkxtcx.service;



import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.qkfkxt.QkfkxtFksqbEntity;



public interface QkfkxtcxService extends CommService {
	
	public QkfkxtFksqbEntity  queryBySqdh(Map<String,String> map);
	
	
	public List<Map<String,Object>> queryBySqdhAll(Map<String,String> map);
	
	
	//查询附件集合
		public List<Map<String, String>> querFjlist(String sqdh);
		
	//	
		public List<Map<String, String>> queryCybFjlist(String id);	
		
}
