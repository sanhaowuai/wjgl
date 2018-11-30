package com.incon.framework.page;
/**
 * @类名：cn.com.incons.common.page.JsonPage
 * @作者：丁起明
 * @时间：2012-7-27
 * @版本：
 * @描述：抽象Json分页
 * @修改人员：
 * @修改时间：2012-7-27
 * @修改说明：
 */
@SuppressWarnings("all")
public abstract class JsonPage{
	
	/*json 分页*/
	private int page;
	private int rows;
	private int total;
	/*json 分页*/
	
	private int pageNo = 1; // 当前页
	private int pageSize = 2; // 每页显示记录数目
	private int pageCount; // 总页数
	private int rowCount; // 记录总数
	
	
	
	public int getPageNo() {
		System.out.println("getPageNo="+pageNo);
		return pageNo;
	}
	public void setPageNo(int pageNo) {
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
	
	/**
	 * 计算总页数
	 */
	public void sumPageCount() {
		if (rowCount % pageSize == 0) {
			pageCount = rowCount / pageSize;
		} else {
			pageCount = rowCount / pageSize + 1;
		}
	}
	
	/*json 分页*/
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	/*json 分页*/
}
