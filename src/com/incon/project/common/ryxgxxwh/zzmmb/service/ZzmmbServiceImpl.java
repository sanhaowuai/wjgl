package com.incon.project.common.ryxgxxwh.zzmmb.service;

import java.util.Arrays;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.ryxgxxwh.ZzmmbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.zzmmb.service.ZzmmbServiceImpl
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：政治面貌表管理接口实现类
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value= "zzmmbService")
public class ZzmmbServiceImpl extends CommServiceImpl implements ZzmmbService {

	//增加政治面貌
	@Override
	@MethodLog(description="增加政治面貌")
	public void addZzmm(ZzmmbEntity zzmmbEntity) {
		dbDao.insert("zzmmbgl.addZzmm", zzmmbEntity);	
	}

	//删除政治面貌
	@Override
	@Transactional
	@MethodLog(description="删除政治面貌")
	public void delZzmm(String[] ids) {
		dbDao.executeBatchOperation("zzmmbgl.delZzmm", Arrays.asList(ids), "delete");	
	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("zzmmbgl.queryByDmCount", dm)));
	}
	//查询一条政治面貌
	@Override
	public ZzmmbEntity queryZzmmByDm(String dm) {
		return (ZzmmbEntity)dbDao.queryForObject("zzmmbgl.queryZzmmByDm", dm);
	}
	//修改政治面貌
	@Override
	@MethodLog(description="修改政治面貌")
	public void updZzmmByDm(ZzmmbEntity zzmmbEntity) {
		dbDao.update("zzmmbgl.updZzmmByDm",zzmmbEntity);
	}

	
}