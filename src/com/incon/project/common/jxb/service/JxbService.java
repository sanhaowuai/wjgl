package com.incon.project.common.jxb.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.JxbEntity;

public interface JxbService extends CommService{
	//添加教学班
	public void addJxb(JxbEntity jxbEntity);
	//修改教学班
	public void updJxb(JxbEntity jxbEntity);
	//根据CMCODE查询教学班
	public JxbEntity queryJxbByCMCODE(String CMCODE);
	

	//批量添加学生
	public void addJxbs(List<Map<String, String>> listObj);
}
