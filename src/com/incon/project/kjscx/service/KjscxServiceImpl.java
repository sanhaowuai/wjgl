package com.incon.project.kjscx.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.project.kjscx.page.KjscxPage;
@SuppressWarnings("unchecked")
@Service(value = "kjscxService")
public class KjscxServiceImpl extends CommServiceImpl implements KjscxService{
	
	//查询节次总数
	@Override
	public List queryPkjc(KjscxPage kjscxPage) {
		return dbDao.query("kjscx.queryPkjc",kjscxPage);
	}
	//根据学年学期查询周次
	@Override
	public List<Map<String, String>> queryzklistbyxnxq(Map<String, String> map) {
		return dbDao.query("kjscx.queryzclistByxnxq",map);
	}
	//根据校区查询楼号
	@Override
	public List<Map<String, String>> queryJxlListBySjid(String id) {
		return dbDao.query("kjscx.queryJxlListBySjid",id);
	}
	//根据楼号查询场地
	@Override
	public List<Map<String, String>> queryJxcdListBySjid(String id) {
		return dbDao.query("kjscx.queryJxcdListBySjid",id);
	}


}
