package com.incon.framework.dao;
 
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.page.Page;
/**
 * @类名：com.incon.common.dao.DbDao
 * @作者：Linls
 * @时间：2012-8-7
 * @版本：
 * @描述：数据访问对象接口
 * @修改人员：
 * @修改时间：2012-8-7
 * @修改说明：
 */

public  interface  DbDao  {
	/**
	 * 分页查询数据返回List
	 * @param page sql 查询SQL
	 * @return
	 */
	public List<Object> queryForPage(Page page );
	/**
	 * 查询分页总数
	 * @param page sqlCount 查询总数SQL
	 * @return
	 */
	public int queryForCount(Page page);
	/**
	 * 无参数查询
	 * @param statementName 调用SQL ID
	 * @return
	 */
	public List query(String statementName);
	/**
	 * 有参数列表查询
	 * @param statementName 调用SQL ID
	 * @param parameterObject 参数
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List query(String statementName, Object parameterObject);
	/**
	 * 查询返回Object
	 * @param statementName 调用SQL ID
	 * @param parameterObject 参数
	 * @return 
	 */
	public Object queryForObject(String statementName, Object obj);
	/**
	 * 添加方法
	 * @param statementName 调用SQL ID
	 * @param parameterObject 参数
	 * @return 返回 插入后的ID   
	 * 	<selectKey resultClass="int" keyProperty="id" >
	 * 		SELECT S_SGS_REMARK.CURRVAL AS ID FROM DUAL 
	 *	</selectKey>
	 */
	public Object insert(String statementName, Object parameterObject); 
	/**
	 * 无参数修改 
	 * @param statementName 调用SQL ID
	 * @return 修改行数
	 */
	public int update(String statementName);
	/**
	 * 有参数修改 
	 * @param statementName 调用SQL ID
	 * @param parameterObject 参数
	 * @return 修改行数
	 */
	public int update(String statementName, Object parameterObject);
	/**
	 * 删除
	 * @param statementName 调用SQL ID
	 * @param parameterObject 参数
	  * @return 删除行数
	 */
	public int delete(String statementName,Object parameterObject);
	/**
	 * 实际执行批量操作的方法,代理执行插入、更新、删除等操作
	 * @param statementName 调用SQL ID
	 * @param parameterList 参数
	 * @return 批量执行数
	 */
	@SuppressWarnings("rawtypes")
	public int executeBatchOperation(final String statementName, final List parameterList, final String flag);
	/**
	 * 根据不同SQL进行批处理
	 * @param statementNameList 调用 SQL ID List
	 * @param parameterList 参数
	 * @param flagList 操作方式 List delete insert update
	 * @return 批量执行数
	 */
	@SuppressWarnings("rawtypes")
	public int executeBatchOperation(final List statementNameList,final List parameterList, final List flagList);
}
