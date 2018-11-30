package com.incon.framework.page;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @类名：com.incon.common.page.Page
 * @作者：Linls
 * @时间：2012-7-27
 * @版本：
 * @描述：抽象分页
 * @修改人员：
 * @修改时间：2012-7-27
 * @修改说明：
 */
@SuppressWarnings("all")
public abstract class Page {

	private String sql = ""; // 基础SQL查询语句
	private String sqlCount = ""; // SQL查询记录数语句
	private int pageNo = 1; // 当前页
	private int pageSize = 10; // 每页显示记录数目
	private int pageCount; // 总页数
	private int rowCount; // 记录总数

	/**
	 * 计算总页数
	 */
	public void sumPageCount() {
		if(rowCount != 0){
			if(pageSize < 1){
				pageSize = 10;
			}
			if(pageSize > rowCount){
				pageSize = rowCount;
			}
			
			if (rowCount % pageSize == 0) {
				pageCount = rowCount / pageSize;
			} else {
				pageCount = rowCount / pageSize + 1;
			}
		}else{
			pageCount = 0;
		}
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public String getSqlCount() {
		return sqlCount;
	}

	public void setSqlCount(String sqlCount) {
		this.sqlCount = sqlCount;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		if (pageNo > pageCount) {
			pageNo = pageCount;
		} else if(pageNo == 0) {
			pageNo = 1;
		}
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	@Override
	public String toString() {
		return "Page [sql=" + sql + ", sqlCount=" + sqlCount + ", pageNo="
				+ pageNo + ", pageSize=" + pageSize + ", pageCount="
				+ pageCount + ", rowCount=" + rowCount + "]";
	}

}
