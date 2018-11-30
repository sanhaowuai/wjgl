package com.incon.common.pub.pubZyByGlyx.sercice;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;

@Service(value="pubZyByGlyxServive")
public class PubZyByGlyxServiceImpl extends CommServiceImpl implements PubZyByGlyxServive{

	//根据管理院系查询专业
	@Override
	public List<Map> queryZyByGlyx(String xydm) {
		return dbDao.query("pubZyByGlyx.queryZyByGlyx",xydm);
	}

}
