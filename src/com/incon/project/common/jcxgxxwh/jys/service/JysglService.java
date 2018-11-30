package com.incon.project.common.jcxgxxwh.jys.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.jcxgxxwh.JysbEntity;
import com.incon.pojo.common.jcxgxxwh.JyslxbEntity;

/**
 * 
 * @类名： com.incon.project.common.jcxxwh.zylb.service.ZylbglService
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述： 教研室接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface JysglService extends CommService{
	//查询教研室类型
	public List<JyslxbEntity> queryJyslx();
	//查询学院
	public List<YxdmbEntity> queryXy();
	//查询教研室列表
	public List<JysbEntity> queryJysList();
	//查询系列表
	public List<YxdmbEntity> queryXList(String yxdm);
	//查询院是否为管理院系
	public YxdmbEntity querySfglbm(YxdmbEntity yxdmbEntity);
	//添加教研室
	public void addJys(JysbEntity jysbEntity);
	//修改教研室信息
	public void updJys(JysbEntity jysbEntity);
	//删除教研室信息
	public void delJys(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String jysdm);
	//根据代码查询教研室
	public JysbEntity queryJysByDm(String jysdm);
	//查询教研室数据权限表中是否有数据
	public int queryJyssjqxCount(Map map);
	public UserEntity queryUser(UserEntity userEntity);
}
