package com.incon.project.dbsx.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.WebService;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
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
 * @日期： 2016-08-09
 * @版本号：
 * @说明：代办事项(更多)
 */
@SuppressWarnings("all")
public interface DbsxService extends CommService
{
	public void updByidDbsx(String id,String yhdm);
	public DbsxEntity queryByidDbsx(String id);
	public List<DbsxEntity> queryDbsxTop5(DbsxPage dbsxPage);
	public Integer querySfkck(String id);
	//WebService bgein
	/**
	 * 新增代办事项接口
	 * @param dbsxEntity
	 */
	public void addDbsx(DbsxEntity dbsxEntity);
	
	/**
	 * 删除代办事项接口
	 * @param dbsxEntity
	 */
	public void delDbsx(DbsxEntity dbsxEntity);
	
	/**
	 * 更新代办事项接口（主要更新 [sfwc：是否完成｛1：是；0：否；｝] [完成时间：格式 ｛yyyy-mm-dd HH24:mi:ss｝]）
	 * @param dbsxEntity
	 */
	public void updDbsx(DbsxEntity dbsxEntity);
	//WebService end
}
