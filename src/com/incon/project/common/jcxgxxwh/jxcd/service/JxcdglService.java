package com.incon.project.common.jcxgxxwh.jxcd.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.jcxgxxwh.CdlbbEntity;
import com.incon.pojo.common.jcxgxxwh.JxcdbEntity;
import com.incon.pojo.common.jcxgxxwh.JxlbEntity;
import com.incon.pojo.common.jcxgxxwh.XiaoqubEntity;


/**
 * 
 * @类名： com.incon.project.common.jcxxwh.jxcd.service.JxcdglService
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：  教学场地接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface JxcdglService extends CommService{

	//查询教学场地列表
	public List<JxcdbEntity> queryJxcdList();
	//查询场地类别列表
	public List<CdlbbEntity> queryCdlb();
	//添加教学场地
	public void addJxcd(JxcdbEntity jxcdbEntity);
	//修改教学场地信息
	public void updJxcd(JxcdbEntity jxcdbEntity);
	//删除教学场地信息
	public void delJxcd(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String dm);
	//根据代码查询教学场地
	public JxcdbEntity queryJxcdByDm(String dm);
	//查询校区列表
	public List<XiaoqubEntity> queryXiaoquList();
	//查询教学楼列表
	public List<JxlbEntity> queryJxlList(String yxdm);
	//查询院系
	public List<YxdmbEntity> queryYx(JxcdbEntity jxcdbEntity);
	//修改教学场地的使用部门
	public void updSybm(String dm,String obj);
}
