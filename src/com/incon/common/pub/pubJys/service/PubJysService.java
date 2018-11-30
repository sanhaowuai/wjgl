package com.incon.common.pub.pubJys.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.incon.common.pub.pubJys.page.PubJysPage;
import com.incon.pojo.common.YxdmbEntity;
@SuppressWarnings("all")
public interface PubJysService {
	//查询教研室
	public List<Map> queryPubJys(PubJysPage pubJysPage);
	

	//查询教研室数据权限表中是否有数据
	public int queryJyssjqxCount(Map map);
}
