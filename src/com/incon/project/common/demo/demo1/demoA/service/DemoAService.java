package com.incon.project.common.demo.demo1.demoA.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.HelpbEntity;
import com.incon.pojo.common.QxbEntity;

public interface DemoAService extends CommService{

	public Integer addTest_dmwh_1(HashMap mappar);
	public Integer addTest_dmwh_2(HashMap mappar);
	
	public Integer updTest_dmwh_1(HashMap mappar);
	public Integer updTest_dmwh_2(HashMap mappar);
	
	public Integer delTest_dmwh_1(HashMap mappar);
	public Integer delTest_dmwh_2(HashMap mappar);

}
