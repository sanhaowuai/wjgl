package com.incon.common.pub.pubJysByYx.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;
@Service(value="pubJysByYxService")
public class PubJysByYxServiceImpl extends CommServiceImpl implements PubJysByYxService{

	//根据系查询教研室
	@Override
	public List<Map> queryJysByX(String yxdm) {
		// TODO Auto-generated method stub
		return dbDao.query("pubJysByYx.queryJysByX", yxdm);
	}

	//根据院查询教研室
	@Override
	public List<Map> queryJysByY(String yxdm) {
		// TODO Auto-generated method stub
		return dbDao.query("pubJysByYx.queryJysByY", yxdm);
	}

	//根据管理院系查询教研室
	@Override
	public List<Map> queryJysByGlyx(String yxdm) {
		return dbDao.query("pubJysByYx.queryJysByGlyx",yxdm);
	}

}
