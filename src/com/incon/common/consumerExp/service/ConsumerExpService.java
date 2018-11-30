package com.incon.common.consumerExp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.incon.common.consumerExp.page.ConsumerExpEntity;
import com.incon.framework.service.CommService;
/**
 * 自定义导出模板
 * 赵恒
 * 2016年11月29日
 */
public interface ConsumerExpService extends CommService{
	/**
	 * 根据id获取信息
	 * @param id
	 * @return
	 */
	public List<HashMap<String,String>> queryById(String id);
	/**
	 * 根据id查询出Tab
	 * @param id
	 * @return
	 */
	public ConsumerExpEntity queryTabById(String id);
	/**
	 * 修改或者添加保存
	 * @param consumerExpEntity
	 * @return
	 */
	public String updateTabAndCol(ConsumerExpEntity consumerExpEntity,String[] arr);
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	public	String deleteConsumerExp(String[] ids);
	/**
	 * 添加弹出框
	 * @param map
	 * @return
	 */
	public List<Map<String,String>> queryTabColsByTabName(Map map);
}
