package com.incon.common.pub.pubJccx.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;

import com.incon.pojo.common.ryxgxxwh.JgbEntity;
import com.incon.pojo.common.ryxgxxwh.MzbEntity;
import com.incon.pojo.common.ryxgxxwh.WhcdbEntity;
import com.incon.pojo.common.ryxgxxwh.XbbEntity;
import com.incon.pojo.common.ryxgxxwh.XlbEntity;
import com.incon.pojo.common.ryxgxxwh.XwbEntity;
import com.incon.pojo.common.ryxgxxwh.XzjbbEntity;
import com.incon.pojo.common.ryxgxxwh.ZcbEntity;
import com.incon.pojo.common.ryxgxxwh.ZzmmbEntity;

@SuppressWarnings("all")
@Service(value="PubJccxService")
public class PubJccxServiceImpl extends CommServiceImpl implements PubJccxService {

	@Override
	public List<XbbEntity> queryXb() {
		return dbDao.query("pubJccx.queryXb");
	}

	@Override
	public List<JgbEntity> queryJg() {
		return dbDao.query("pubJccx.queryJg");
	}

	@Override
	public List<MzbEntity> queryMz() {
		return dbDao.query("pubJccx.queryMz");
	}

	@Override
	public List<WhcdbEntity> queryWhcd() {
		return dbDao.query("pubJccx.queryWhcd");
	}

	@Override
	public List<XlbEntity> queryXl() {
		return dbDao.query("pubJccx.queryXl");
	}

	@Override
	public List<XwbEntity> queryXw() {
		return dbDao.query("pubJccx.queryXw");
	}

	@Override
	public List<XzjbbEntity> queryXzjb() {
		return dbDao.query("pubJccx.queryXzjb");
	}

	@Override
	public List<ZcbEntity> queryZc() {
		return dbDao.query("pubJccx.queryZc");
	}

	@Override
	public List<ZzmmbEntity> queryZzmm() {
		return dbDao.query("pubJccx.queryZzmm");
	}

}
