package com.incon.project.swtx.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
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
 * @类名： com.incon.project.dbsx.service.SwtxServiceImpl
 * @创建人： 赵玥(zhaoyue)
 * @日期： 2016-08-09
 * @版本号：
 * @说明：代办事项(更多)
 */
@SuppressWarnings("all")
@Service(value = "swtxService")
public class SwtxServiceImpl extends CommServiceImpl implements SwtxService
{

	@Override
	public SwtxEntity queryByidSwtx(String id) {
		// 根据id查询具体数据
		return (SwtxEntity) dbDao.queryForObject("swtx.queryByidSwtx", id);
	}

	@Override
	public void updByidSwtx(String id,String yhdm) {
		// T修改 是否已读  状态
		Map< String, String> map=new HashMap<String, String>();
		map.put("id",id);
		map.put("yhdm",yhdm);
		dbDao.update("swtx.updByidSwtx", map);
	}

	
	@Override
	public List<SwtxEntity> querySwtxTop5(SwtxPage swtxPage) {
		// 查询    未读  前5条数据
		return dbDao.query("swtx.querySwtxTop5",swtxPage);
	}


	@Override
	public void addSwtx(SwtxEntity swtxEntity) {
		
		// TODO Auto-generated method stub
		dbDao.insert("swtx.addSwtx", swtxEntity);
	}

	@Override
	public void delSwtx(SwtxEntity swtxEntity) {
		// TODO Auto-generated method stub
		dbDao.delete("swtx.delSwtx", swtxEntity);
	}

	@Override
	public void updSwtx(SwtxEntity swtxEntity) {
		// TODO Auto-generated method stub
		dbDao.update("swtx.updSwtx", swtxEntity);
	}

	@Override
	public Integer querySfkck(String id) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("swtx.querySfkck", id);
	}

}
