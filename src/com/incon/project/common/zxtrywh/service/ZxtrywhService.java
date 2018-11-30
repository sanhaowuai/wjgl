package com.incon.project.common.zxtrywh.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.WebService;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
import com.incon.pojo.common.zxtrywhEntity;
import com.incon.pojo.common.dbsx.DbsxEntity;
import com.incon.pojo.common.lwgl.KxkzybEntity;
import com.incon.pojo.common.lwgl.LwsbbEntity;
import com.incon.pojo.common.lwgl.XsxtbEntity;
import com.incon.pojo.common.lwgl.XtczbEntity;
import com.incon.project.dbsx.page.DbsxPage;

/**
 * 
 * @类名： com.incon.project.dbsx.service.DbsxService
 * @创建人： 赵玥(zhaoyue)
 * @日期： 2016-10-22
 * @版本号：
 * @说明：子系统人员维护
 */
@SuppressWarnings("all")
public interface ZxtrywhService extends CommService
{
	//根据id查询
	 public zxtrywhEntity queryByidzxt(String ids);
	 //增加
	 public void addzxt(zxtrywhEntity entity);
	 //修改
	 public void updzxt(zxtrywhEntity entity);
	 
	 //删除
	 public void delzxt(String [] ids);
	 
	 //查询重复
	 public Integer  querybyoneCount(String ids);
	 
	 public List<Map<String,String>> queryAllxy();
	 public List<Map<String,String>> queryAllzxt();
}
