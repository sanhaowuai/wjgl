package com.incon.project.common.jcxgxxwh.jyslx.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.jcxgxxwh.JyslxbEntity;


/**
 * 
 * @类名：com.incon.project.common.jcxgxxwh.jyslx.service.JyslxglService
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述： 教研室类型接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface JyslxglService extends CommService{

	//查询教研室类型列表
	public List<JyslxbEntity> queryJyslxList();
	//添加教研室类型
	public void addJyslx(JyslxbEntity jyslxbEntity);
	//修改教研室类型信息
	public void updJyslx(JyslxbEntity jyslxbEntity);
	//判断教研室类型是否被使用
	public String queryExit(String ids);
	//删除教研室类型信息
	public void delJyslx(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String dm);
	//根据代码查询教研室类型
	public JyslxbEntity queryJyslxByDm(String dm);
}
