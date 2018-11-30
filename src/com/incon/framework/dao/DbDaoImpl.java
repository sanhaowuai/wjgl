package com.incon.framework.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.page.Page;

import com.ibatis.sqlmap.client.SqlMapExecutor;
/**
 * @类名：com.incon.common.dao.DbDaoImpl
 * @作者：Linls
 * @时间：2012-8-7
 * @版本：
 * @描述：数据访问对象实现类
 * @修改人员：
 * @修改时间：2012-8-7
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value="dbDao")
@Repository
public class DbDaoImpl extends SqlMapClientDaoSupport implements DbDao {

	/**
	 * 分页查询数据返回List
	 * @param page sql 查询SQL
	 * @return
	 */
	public List queryForPage(Page page) {
		return this.getSqlMapClientTemplate().queryForList(page.getSql(), page);
	}
	/**
	 * 查询分页总数
	 * @param page sqlCount 查询总数SQL
	 * @return
	 */
	public int queryForCount(Page page) {
		List list = this.getSqlMapClientTemplate().queryForList( page.getSqlCount(), page);
		return ((Integer) list.get(0)).intValue();
	}
	/**
	 * 无参数查询
	 * @param statementName 调用SQL ID
	 * @return
	 */
	public List query(String statementName) {
		return this.getSqlMapClientTemplate().queryForList(statementName);
	}
	/**
	 * 有参数查询
	 * @param statementName 调用SQL ID
	 * @param parameterObject 参数
	 * @return
	 */
	public List query(String statementName, Object obj) {
		return this.getSqlMapClientTemplate().queryForList(statementName, obj);
	}
	/**
	 * 查询返回Object
	 * @param statementName 调用SQL ID
	 * @param parameterObject 参数
	 * @return 
	 */
	public Object queryForObject(String statementName, Object obj) throws RuntimeException {
		return (Object) this.getSqlMapClientTemplate().queryForObject(statementName, obj);
	}
	/**
	 * 添加方法
	 * @param statementName 调用SQL ID
	 * @param parameterObject 参数
	 * @return 返回 插入后的ID   
	 * 	<selectKey resultClass="int" keyProperty="id" >
	 * 		SELECT S_SGS_REMARK.CURRVAL AS ID FROM DUAL 
	 *	</selectKey>
	 */
	public Object insert(String statementName, Object parameterObject) {
		return this.getSqlMapClientTemplate().insert(statementName, parameterObject);
	}
	/**
	 * 无参数修改 
	 * @param statementName 调用SQL ID
	 * @return 修改行数
	 */
	public int update(String statementName) {
		return this.getSqlMapClientTemplate().update(statementName);
	}
	/**
	 * 有参数修改 
	 * @param statementName 调用SQL ID
	 * @param parameterObject 参数
	 * @return 修改行数
	 */
	public int update(String statementName, Object parameterObject) {
		return this.getSqlMapClientTemplate().update(statementName, parameterObject);
	}
	/**
	 * 删除
	 * @param statementName 调用SQL ID
	 * @param parameterObject 参数
	 * @return 删除行数
	 */
	public int delete(String statementName, Object parameterObject) {
		return this.getSqlMapClientTemplate().delete(statementName, parameterObject);
	}
	/**
	 * 实际执行批量操作的方法,代理执行插入、更新、删除等操作
	 * @param statementName 调用SQL ID
	 * @param parameterList 参数
	 * @return 批量执行数
	 */
	@SuppressWarnings({ "unchecked" })
	public int executeBatchOperation(final String statementName, final List parameterList, final String flag) {
		Long exectuteSucValue = null;
		exectuteSucValue = (Long) getSqlMapClientTemplate().execute(
				new SqlMapClientCallback() {
					public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
						Long states = Long.valueOf(0);
						try {
							executor.startBatch();
							for (int i = 0; i < parameterList.size(); i++) {
								if (flag.equals("update")) {
									executor.update(statementName,
											parameterList.get(i));
								} else if (flag.equals("insert")) {
									executor.insert(statementName,
											parameterList.get(i));
								} else if (flag.equals("delete")) {

									try {
										executor.delete(statementName,
												parameterList.get(i));
									} catch (Exception e) {
									 
										System.out.println(e);
									}
								}
							}
							executor.executeBatch();
						} catch (Exception e) {
					 
							states = Long.valueOf(-1);
							System.out.println(e);
							throw new RuntimeException("异常"); 
						}
						return states;
					}
				});
		if (exectuteSucValue.intValue() == -1) {
			System.out.print("sql3 异常");
			throw new RuntimeException("sql异常");
		}
		return parameterList.size();
	}
	/**
	 * 根据不同SQL进行批处理
	 * @param statementNameList 调用 SQL ID List
	 * @param parameterList 参数
	 * @param flagList 操作方式 List delete insert update
	 * @return 批量执行数
	 */
	public int executeBatchOperation(final List statementNameList, final List parameterList, final List flagList) {
		Long exectuteSucValue = null;
		exectuteSucValue = (Long) getSqlMapClientTemplate().execute(
				new SqlMapClientCallback() {
					public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
						Long states = Long.valueOf(0);
						try {
							executor.startBatch();
							for (int i = 0; i < parameterList.size(); i++) {
								if (flagList.get(i).equals("update")) {
									executor.update(statementNameList.get(0)
											.toString(), parameterList.get(i));
								} else if (flagList.get(i).equals("insert")) {
									executor.insert(statementNameList.get(0)
											.toString(), parameterList.get(i));
								} else if (flagList.get(i).equals("delete")) {
									executor.delete(statementNameList.get(0)
											.toString(), parameterList.get(i));
								}
							}
							executor.executeBatch();
						} catch (Exception e) {
							states = Long.valueOf(-1);
							System.out.println(e);
							throw new RuntimeException("sql异常");
						}
						return states;
					}
				});
		if (exectuteSucValue.intValue() == -1) {
			throw new RuntimeException();
		}
		return parameterList.size();
	}
}
