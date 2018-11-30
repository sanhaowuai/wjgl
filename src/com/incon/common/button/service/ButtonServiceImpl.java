package com.incon.common.button.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;

/**
 * @类名：com.incon.common.button.service.ButtonServiceImpl
 * @作者：于洋
 * @时间：2014-5-4
 * @版本：
 * @描述：按钮控制service实现类
 * @修改人员：
 * @修改时间：
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value="buttonService")
public class ButtonServiceImpl extends CommServiceImpl implements ButtonService{
	//根据访问路径查询菜单代码
	@Override
	public String queryCddmByFwlj(String fwlj) {
		return (String)this.dbDao.queryForObject("button.queryCddmByFwlj", fwlj);
	}
	
	//根据用户ID或者角色ID以及菜单ID查询按钮 (页面按钮显示控制)
	@Override
	public List<Map> queryAnbOrder(Map obj) {
		Integer ret = Integer.parseInt(String.valueOf(dbDao.queryForObject("button.queryRyjsanbCount", obj)));
		List<Map> list = new ArrayList<Map>(); 
		if(ret == 0){
			list = this.dbDao.query("button.queryAnbOrder2", obj);
		}else {
			list = this.dbDao.query("button.queryAnbOrder", obj);
		}
		return list;
	}
}
