package com.incon.project.common.jcxgxxwh.bj.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XyzybEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.jcxgxxwh.BjbEntity;
import com.incon.pojo.common.jcxgxxwh.NjbEntity;
import com.incon.pojo.common.jcxgxxwh.XiaoqubEntity;



/**
 * 
 * @类名： com.incon.project.common.jcxxwh.zylb.service.ZylbglService
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述： 班级接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface BjglService extends CommService{

	//查询班级列表
	public List<BjbEntity> queryBjList();
	//查询所有院系
	public List<YxdmbEntity> queryYxLists();
	//添加班级
	public void addBj(BjbEntity bjbEntity);
	//修改班级信息
	public void updBj(BjbEntity bjbEntity);
	//删除班级信息
	public void delBj(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String bjdm);
	//根据代码查询班级
	public BjbEntity queryBjByDm(String bjdm);
	//查询院系列表
	public List<YxdmbEntity> queryYxList();
	//查询专业列表
	public List<ZybEntity> queryZyList(String xydm);
	//查询系列表
	public List<YxdmbEntity> queryXList(String yxdm);
	//查询年级列表
	public List<NjbEntity> queryNjList();
	//查询校区列表
	public List<XiaoqubEntity> queryXiaoquList();
	//查询院是否为管理院系
	public YxdmbEntity querySfglbm(YxdmbEntity yxdmbEntity);
	//根据系查询专业
	public List<ZybEntity> queryZyListByX(String xydm);
	public UserEntity queryUser(UserEntity userEntity);
}
