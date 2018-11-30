package com.incon.common.dmbwh.service;

import java.util.Map;

import com.incon.framework.service.CommService;

/**
 * 代码表维护
 * 赵恒
 * 2016年12月2日
 */
public interface DmbwhService extends CommService{

	/**
	 * 是凑存在tablename
	 * @param tablename
	 * @return
	 */
	public int queryByTableName(String tablename);
	/**
	 * 是否存在于系统表中
	 * @param tablename
	 * @return
	 */
	public int queryTabExist(String tablename);
	/**
	 * 此表是否存在字段及字段名
	 * @param tablename
	 * @return
	 */
	public int queryColExist(Map<String,String> map);
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	public	String delDmbwh(String[] ids);
}
