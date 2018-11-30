package com.incon.project.common.jcxgxxwh.zylb.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.jcxgxxwh.ZylbbEntity;
/**
 * 
 * @类名： com.incon.project.common.jcxxwh.zylb.service.ZylbglService
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：  专业类别接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface ZylbglService extends CommService{

	//查询专业类别列表
	public List<ZylbbEntity> queryZylbList();
	//添加专业类别
	public void addZylb(ZylbbEntity zylbbEntity);
	//修改专业类别信息
	public void updZylb(ZylbbEntity zylbbEntity);
	//删除专业类别信息
	public void delZylb(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String dm);
	//根据代码查询专业类别
	public ZylbbEntity queryZylbByDm(String dm);
}
