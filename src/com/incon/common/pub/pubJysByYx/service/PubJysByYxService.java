package com.incon.common.pub.pubJysByYx.service;

import java.util.List;
import java.util.Map;

public interface PubJysByYxService {
	
	//根据学院代码查询教研室
	public List<Map> queryJysByY(String yxdm);
	//根据系代码查询教研室
	public List<Map> queryJysByX(String yxdm);
	//根据管理院系查询教研室
	public List<Map> queryJysByGlyx(String yxdm);
}
