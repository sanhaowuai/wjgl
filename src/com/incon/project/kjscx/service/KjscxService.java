package com.incon.project.kjscx.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.project.kjscx.page.KjscxPage;

@SuppressWarnings("unchecked")
public interface KjscxService extends CommService  {
	
	//查询节次总数
	public List queryPkjc(KjscxPage kjscxPage);
	
	//根据学年学期查询周次
	public List<Map<String, String>> queryzklistbyxnxq(Map<String, String> map);
	
	//根据校区查询楼号
	public List<Map<String, String>>  queryJxlListBySjid(String id);
	
	//通过楼号查询场地
	public List<Map<String, String>> queryJxcdListBySjid(String id);
}
