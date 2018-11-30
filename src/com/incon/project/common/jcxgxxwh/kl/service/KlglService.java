package com.incon.project.common.jcxgxxwh.kl.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.jcxgxxwh.KlbEntity;

/**
 * 
 * @类名： com.incon.project.common.jcxxwh.zylb.service.ZylbglService
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：  科类接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface KlglService extends CommService{

	//查询科类列表
	public List<KlbEntity> queryKlList();
	//添加科类
	public void addKl(KlbEntity klbEntity);
	//修改科类信息
	public void updKl(KlbEntity klbEntity);
	//删除科类信息
	public void delKl(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String dm);
	//根据代码查询科类
	public KlbEntity queryKlByDm(String dm);
}
