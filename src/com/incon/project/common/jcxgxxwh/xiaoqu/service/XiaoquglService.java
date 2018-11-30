package com.incon.project.common.jcxgxxwh.xiaoqu.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.jcxgxxwh.XiaoqubEntity;

/**
 * 
 * @类名： com.incon.project.common.jcxxwh.zylb.service.ZylbglService
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：  校区接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface XiaoquglService extends CommService{

	//查询校区列表
	public List<XiaoqubEntity> queryXiaoquList();
	//添加校区
	public void addXiaoqu(XiaoqubEntity xiaoqubEntity);
	//修改校区信息
	public void updXiaoqu(XiaoqubEntity xiaoqubEntity);
	//判断校区是否被使用
	public String queryExit(String ids);
	//删除校区信息
	public void delXiaoqu(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String dm);
	//根据代码查询校区
	public XiaoqubEntity queryXiaoquByDm(String dm);
}
