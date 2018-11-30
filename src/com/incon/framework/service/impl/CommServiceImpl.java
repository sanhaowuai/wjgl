package com.incon.framework.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.incon.framework.dao.DbDao;
import com.incon.framework.page.Page;
import com.incon.framework.service.CommService;


/**
 * @类名：com.incon.common.service.CommServiceImpl
 * @作者：Linls
 * @时间：2012-7-27
 * @版本：
 * @描述：抽象Service
 * @修改人员：
 * @修改时间：2012-7-27
 * @修改说明：
 */
public abstract class CommServiceImpl implements CommService {

	@Resource(name = "dbDao")
	protected DbDao dbDao;

	/**
	 * 分页查询
	 * 
	 * @param page
	 *            sql 查询SQL, sqlCount 查询总数SQL
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List query(Page page) {
		// 1.查询记录总数
		int rowCount = dbDao.queryForCount(page);
		page.setRowCount(rowCount);
		// 2.计算总页数
		page.sumPageCount();
		// 3.查询列表集合
		return dbDao.queryForPage(page);
	}

	/**
	 * 查询
	 * 
	 * @param statementName
	 *            调用SQL ID
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List query(String statementName) {
		return this.dbDao.query(statementName);
	}

	/**
	 * 有参数列表查询
	 * 
	 * @param statementName
	 *            调用SQL ID
	 * @param parameterObject
	 *            参数
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List query(String statementName, Object parameterObject) {
		return this.dbDao.query(statementName, parameterObject);
	}

	/**
	 * 根据ID查询一条
	 * 
	 * @param statementName
	 *            SQL ID
	 * @param obj
	 *            实体或Map
	 * @return
	 */
	public Object queryForObject(String statementName, Object obj) {
		return this.dbDao.queryForObject(statementName, obj);
	}

	/**
	 * 添加方法
	 * 
	 * @param statementName
	 *            调用SQL ID
	 * @param parameterObject
	 *            参数
	 * @return 返回 插入后的ID <selectKey resultClass="int" keyProperty="id" > SELECT
	 *         S_SGS_REMARK.CURRVAL AS ID FROM DUAL </selectKey>
	 */
	public Object insert(String statementName, Object obj) {
		return this.dbDao.insert(statementName, obj);
	}

	/**
	 * 无参数修改
	 * 
	 * @param statementName
	 *            调用SQL ID
	 * @return
	 */
	public int update(String statementName) {
		return this.dbDao.update(statementName);
	}

	/**
	 * 修改
	 * 
	 * @param statementName
	 *            SQL ID
	 * @param obj
	 *            实体或Map
	 * @return
	 */
	public int update(String statementName, Object obj) {
		return this.dbDao.update(statementName, obj);
	}

	/**
	 * 删除
	 * 
	 * @param statementName
	 *            调用SQL ID
	 * @param parameterObject
	 *            参数
	 * @return 删除行数
	 */
	public int delete(String statementName, Object parameterObject) {
		return this.dbDao.delete(statementName, parameterObject);
	}

	/**
	 * 批量操作
	 * 
	 * @param statementName
	 *            SQL ID
	 * @param list
	 *            参数
	 * @param flag
	 *            操作方式 delete insert update
	 * @return 批量执行数
	 */
	@SuppressWarnings("rawtypes")
	public int executeBatchOperation(String statementName, List list, String flag) {
		return this.dbDao.executeBatchOperation(statementName, list, flag);
	}

	/**
	 * 根据不同SQL进行批处理
	 * 
	 * @param statementNameList
	 *            调用 SQL ID List
	 * @param parameterList
	 *            参数
	 * @param flagList
	 *            操作方式 List delete insert update
	 * @return 批量执行数
	 */
	@SuppressWarnings("rawtypes")
	public int executeBatchOperation(List statementNameList, List parameterList, List flagList) {
		return this.dbDao.executeBatchOperation(statementNameList, parameterList, flagList);
	}

	/**
	 * 根据表名查询
	 * 
	 * @param statementNameList
	 *            调用 SQL ID List
	 * @param parameterList
	 *            参数
	 * @param flagList
	 *            操作方式 List delete insert update
	 * @return 批量执行数
	 */
	public List queryDaiMaByTableName(String TableName) {
		return this.dbDao.query("ajaxComm.queryByTable", TableName);
	}

	/**
	 * 根据SQl查询
	 * 
	 * @param statementNameList
	 *            调用 SQL ID List
	 * @param parameterList
	 *            参数
	 * @param flagList
	 *            操作方式 List delete insert update
	 * @return 批量执行数
	 */
	public List queryDaiMaBySql(String SqlStr) {
		return this.dbDao.query("ajaxComm.queryBySqlStr", SqlStr);

	}

	 
}
