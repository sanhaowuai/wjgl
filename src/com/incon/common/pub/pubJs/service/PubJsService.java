package com.incon.common.pub.pubJs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("all")
public interface PubJsService {

	//查询教师列表
	public List<Map> queryPubJs(HashMap map);

	//查询教研室数据权限表中是否有数据
	public int queryJyssjqxCount(Map map);
	
	
	
}
