package com.incon.project.common.grb.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.QxbEntity;
import com.incon.pojo.common.grb.GrbEntity;

public interface GrbService extends CommService {

	

	public List<GrbEntity> queryGrbcd(String yhdm);

	public List<QxbEntity> queryQxb();

	public List<Map<String, String>> queryQx(Map xxMap);

	public void addGrbCd(String id, String idd, String fid, String yhdm,
			Integer jsdm);

	public void delGrb(String[] ids);

	public void adBcsx(List<GrbEntity> list);

}
