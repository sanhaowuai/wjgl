package com.incon.project.common.demo.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.HelpbEntity;
import com.incon.pojo.common.QxbEntity;
import com.incon.project.common.demo.page.DemoJsonPage;

public interface DemoService extends CommService{

	public Integer addTest_dmwh_1(HashMap mappar);
	public Integer addTest_dmwh_2(HashMap mappar);
	List<Map> queryNjList(DemoJsonPage demoJsonPage);
	Integer queryNjListCount(DemoJsonPage demoJsonPage);

}
