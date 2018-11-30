package com.incon.project.common.jcxgxxwh.cdlb.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.jcxgxxwh.CdlbbEntity;


/**
 * 
 * @类名： com.incon.project.common.jcxgxxwh.cdlb.service.CdlbglService
 * @创建人： 杨文龙
 * @日期： 2014-4-2
 * @修改人：
 * @日期：
 * @描述： 场地类别接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface CdlbglService extends CommService{

	//查询场地类别列表
	public List<CdlbbEntity> queryCdlbList();
	//添加场地类别
	public void addCdlb(CdlbbEntity cdlbbEntity);
	//修改场地类别信息
	public void updCdlb(CdlbbEntity cdlbbEntity);
	//判断岗位类型是否被使用
	public String queryExit(String ids);
	//删除场地类别信息
	public void delCdlb(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String dm);
	//根据代码查询场地类别
	public CdlbbEntity queryCdlbByDm(String dm);
}
