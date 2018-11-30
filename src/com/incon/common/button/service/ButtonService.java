package com.incon.common.button.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;

/**
 * @类名：com.incon.common.button.service.ButtonService
 * @作者：于洋
 * @时间：2014-5-4
 * @版本：
 * @描述：按钮控制service
 * @修改人员：
 * @修改时间：
 * @修改说明：
 */
public interface ButtonService extends CommService{
	//根据访问路径查询菜单代码
	public String queryCddmByFwlj(String fwlj);
	
	//根据用户ID或者角色ID以及菜单ID查询按钮 (页面按钮显示控制)
	public List<Map> queryAnbOrder(Map obj);
}
