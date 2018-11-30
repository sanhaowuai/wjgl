package com.incon.project.common.helpgl.service;

import java.util.HashMap;
import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.HelpbEntity;
import com.incon.pojo.common.QxbEntity;

public interface HelpglService extends CommService{
	public List<HelpbEntity> queryHelpglList(String qxdm);
	public HelpbEntity queryHelpglOne(String bzid);
	public void addHelpgl(HelpbEntity helpbEntity);
	public void updHelpgl(HelpbEntity helpbEntity);
	public void delHelpgl(String bzid);
	public QxbEntity queryQxglOne(String qxdm);
	List<HelpbEntity> LookHelpglList(String qxdm,String jsdm);
	public List<HashMap<String,String>> queryJsList();
	

}
