package com.incon.framework.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.page.Page;
 
/**
 * @类名：com.incon.common.service.CommService
 * @作者：Linls
 * @时间：2012-7-27
 * @版本：
 * @描述：抽象Service接口
 * @修改人员：
 * @修改时间：2012-7-27
 * @修改说明：
 */
@SuppressWarnings("all")
@Transactional
public interface CommService {
	/**
	 * 分页查询
	 * @param page sql 查询SQL, sqlCount 查询总数SQL
	 * @return
	 */
	public List query(Page page);
	/**
	 * 有参数列表查询
	 * @param statementName 调用SQL ID
	 * @param parameterObject 参数
	 * @return
	 */
	public List query(String statementName, Object parameterObject);
	/**
	 * 查询
	 * @param statementName 调用SQL ID
	 * @return
	 */
	public List query(String statementName);
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
	public Object insert( String statementName, Object obj);
	/**
	 * 无参数修改 
	 * @param statementName 调用SQL ID
	 * @return 修改行数
	 */
	public int update(String statementName);
	/**
	 * 修改
	 * @param statementName SQL ID
	 * @param obj 参数
	 * @return 修改行数
	 */
	public int update( String statementName, Object obj);
	/**
	 * 删除
	 * @param statementName 调用SQL ID
	 * @param parameterObject 参数
	 * @return 删除行数
	 */
	
 /**
  * ********************************************************************************************************************************
   	 *************************************************************方法*************************************************************
   	 *******************************************************************************************************************************
   	 *  
   	 * @param 
   	 * @return
  */
	public int delete(String statementName,Object parameterObject);
	/**
	 * 批量操作
	 * @param statementName SQL ID
	 * @param list 参数
	 * @param flag 操作方式 delete insert update
	 * @return 批量执行数
	 */
	public int executeBatchOperation( String statementName, List list, String flag);
	/**
	 * 根据不同SQL进行批处理
	 * @param statementNameList 调用 SQL ID List
	 * @param parameterList 参数
	 * @param flagList 操作方式 List delete insert update
	 * @return 批量执行数
	 */
	@SuppressWarnings("rawtypes")
	public int executeBatchOperation(final List statementNameList,final List parameterList, final List flagList);
	
	/**
	 *  根据表名查询
	 * @param statementNameList 调用 SQL ID List
	 * @param parameterList 参数
	 * @param flagList 操作方式 List delete insert update
	 * @return 批量执行数
	 */
	 public List queryDaiMaByTableName(String TableName );
		
		/**
		 *  根据SQl查询
		 * @param statementNameList 调用 SQL ID List
		 * @param parameterList 参数
		 * @param flagList 操作方式 List delete insert update
		 * @return 批量执行数
		 */
     public List queryDaiMaBySql(String SqlStr );
     
  
}
