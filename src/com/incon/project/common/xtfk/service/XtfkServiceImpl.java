package com.incon.project.common.xtfk.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.XtfkbEntity;

/**
 * 
 * @类名：  com.incon.project.common.xtfk.service.XtfkServiceImpl
 * @创建人： 于洋	
 * @日期： 2013-5-6
 * @修改人：
 * @日期：
 * @描述：  系统反馈接口的实现类
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value= "xtfkService")
public class XtfkServiceImpl extends CommServiceImpl implements XtfkService{
	//删除反馈信息
	@Override@Transactional
	@MethodLog(description="删除反馈信息")
	public void delFk(String[] ids){
		dbDao.executeBatchOperation("xtfk.delFk", Arrays.asList(ids), "delete");
	}
	
	//修改是否置顶
	@Override
	@Transactional
	@MethodLog(description="修改处理标志")
	public void updClbz(XtfkbEntity xtfkEntity){
		dbDao.update("xtfk.updClbz", xtfkEntity);
	}
	//修改反馈
	@Override
	@Transactional
	@MethodLog(description="修改反馈")
	public void updFk(XtfkbEntity xtfkEntity){
		dbDao.update("xtfk.updFk", xtfkEntity);
	}	

	//修改反馈
	@Override
	@Transactional
	@MethodLog(description="修改反馈")
	public void updFk_user(XtfkbEntity xtfkEntity){
		dbDao.update("xtfk.updFk_user", xtfkEntity);
	}	
	
	//修改处理标志
	@Override
	@Transactional
	@MethodLog(description="修改是否置顶")
	public void updSfzd(XtfkbEntity xtfkEntity){
		dbDao.update("xtfk.updSfzd", xtfkEntity);
	}	
	
	//查询反馈详细信息
	@Override
	public XtfkbEntity queryFknrByDm(String dm){
		return (XtfkbEntity)dbDao.queryForObject("xtfk.queryFknrByDm", dm);
	}
	@Override
	public List qeuryXtfklbb(){
		return dbDao.query("xtfk.qeuryXtfklbb");
	}
	
    // 增加系统反馈信息
    @Override
    public void addFk(XtfkbEntity xtfkbEntity)
    {
        dbDao.insert("xtfk.addFk", xtfkbEntity);
    }	
    // 增加系统反馈信息
    @Override
    public void addFk_user(XtfkbEntity xtfkbEntity)
    {
        dbDao.insert("xtfk.addFk_user", xtfkbEntity);
    }    
}
