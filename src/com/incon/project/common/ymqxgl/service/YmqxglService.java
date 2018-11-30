package com.incon.project.common.ymqxgl.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.AnbEntity;
import com.incon.pojo.common.AnbEntity;
import com.incon.pojo.common.QxbEntity;
/**
 * 
 * @类名：  com.incon.project.common.ymqxgl.service.YmqxglService
 * @创建人： 杨文龙
 * @日期： 2014-3-12
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
public interface YmqxglService extends CommService{

	   
	   //查询权限列表
	   public List<AnbEntity> queryQxbToList(AnbEntity anbEntity);

	   //新增按钮
	   public void addAn(AnbEntity anbEntity);
	   
	   //查询一个按钮
	   public AnbEntity queryOneAn(String andm);
	   
	   //修改按钮信息
	   public void updAn(AnbEntity anbEntity);
	   
	   //删除按钮
	   public void delAn(String[] ids);
		//查询Andh是否重复
	   public Integer queryByAndhCount(AnbEntity anbEntity);

	void delAngnb(String andm);

	List<AnbEntity> queryAngnbList();

	List<AnbEntity> queryAngnbListOnQy();

	void updOrAddAngnb(Map m1);
}
