package com.incon.project.common.jcxgxxwh.jxl.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.jcxgxxwh.JxlbEntity;
import com.incon.pojo.common.jcxgxxwh.XiaoqubEntity;


/**
 * 
 * @类名： com.incon.project.common.jcxxwh.jxl.service.JxlglService
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述： 教学楼接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface JxlglService extends CommService{

	//查询教学楼列表
	public List<JxlbEntity> queryJxlList();
	//添加教学楼
	public void addJxl(JxlbEntity jxlbEntity);
	//修改教学楼信息
	public void updJxl(JxlbEntity jxlbEntity);
	//判断教学楼是否被使用
	public String queryExit(String ids);
	//删除教学楼信息
	public void delJxl(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String dm);
	//根据代码查询教学楼
	public JxlbEntity queryJxlByDm(String dm);
	//查询校区列表
	public List<XiaoqubEntity> queryXiaoquList();
}
