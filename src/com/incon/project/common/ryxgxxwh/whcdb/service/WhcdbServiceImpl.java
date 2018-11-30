package com.incon.project.common.ryxgxxwh.whcdb.service;

import java.util.Arrays;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.ryxgxxwh.WhcdbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.whcdb.service.WhcdServiceImpl
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：文化程度表管理接口实现类
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value= "whcdbService")
public class WhcdbServiceImpl extends CommServiceImpl implements WhcdbService {

	//增加文化程度
	@Override
	@MethodLog(description="增加文化程度")
	public void addWhcd(WhcdbEntity whcdbEntity) {
		dbDao.insert("whcdbgl.addWhcd", whcdbEntity);
	}

	//删除文化程度
	@Transactional
	@Override
	@MethodLog(description="删除文化程度")
	public void delWhcd(String[] ids) {
		dbDao.executeBatchOperation("whcdbgl.delWhcd", Arrays.asList(ids), "delete");	
	}

	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("whcdbgl.queryByDmCount", dm)));
	}
	//查询一条文化程度
	@Override
	public WhcdbEntity queryWhcdByDm(String dm) {
		return (WhcdbEntity)dbDao.queryForObject("whcdbgl.queryWhcdByDm", dm);
	}

	//修改文化程度
	@Override
	@MethodLog(description="修改文化程度")
	public void updWhcdByDm(WhcdbEntity whcdbEntity) {
		dbDao.update("whcdbgl.updWhcdByDm",whcdbEntity);
	}

}
