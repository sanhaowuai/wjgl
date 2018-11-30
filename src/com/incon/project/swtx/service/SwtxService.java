package com.incon.project.swtx.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
import com.incon.pojo.common.dbsx.DbsxEntity;
import com.incon.pojo.common.lwgl.KxkzybEntity;
import com.incon.pojo.common.lwgl.LwsbbEntity;
import com.incon.pojo.common.lwgl.XsxtbEntity;
import com.incon.pojo.common.lwgl.XtczbEntity;
import com.incon.pojo.common.swtx.SwtxEntity;
import com.incon.project.dbsx.page.DbsxPage;
import com.incon.project.swtx.page.SwtxPage;

/**
 * 
 * @类名： com.incon.project.dbsx.service.SwtxService
 * @创建人： 赵玥(zhaoyue)
 * @日期： 2016-08-09
 * @版本号：
 * @说明：事务提醒(更多)
 */
@SuppressWarnings("all")
public interface SwtxService extends CommService
{
	public void updByidSwtx(String id,String yhdm);
	public SwtxEntity queryByidSwtx(String id);
	public List<SwtxEntity> querySwtxTop5(SwtxPage swtxPage);
	
	public Integer querySfkck(String id);
	
	/**
	 * 新增事务提醒数据接口
	 * @param swtxEntity
	 */
	public void addSwtx(SwtxEntity swtxEntity);
	
	/**
	 * 删除事务提醒接口
	 * @param swtxEntity
	 */
	public void delSwtx(SwtxEntity swtxEntity);
	/**
	 * 更新事务提醒数据｛主要更新sfsx：是否失效字段｛1：是；0：否；｝｝
	 * @param swtxEntity
	 */
	public void updSwtx(SwtxEntity swtxEntity);
	//WebService end
}
