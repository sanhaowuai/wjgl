package com.incon.common.pub.pubYx.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.incon.common.pub.pubYx.page.PubYxPage;
 

public interface PubYxService {
	//查询院系(搜索)
	public List<Map> queryPubYx(PubYxPage pubYxPage);
	//查询院系(添加)
	public List<Map> queryPubYxList(PubYxPage pubYxPage);
	//查询系
	public List<Map>  queryPubX(String yxdm);
	
	public  List<Map<String,String>>  queryPubYxAll(String bj,String yxmc);
}
