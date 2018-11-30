package com.incon.common.ExceptionTask.page;

/**
 * 异常任务 实体
 * @author Administrator
 *
 */
public class ExceptionTaskEntity {
	private String id;
	private String mc;
	private String ms;
	private String yccxsql;
	private String ycclsql;
	private String cron;
	private String zhxgrdm;
	private String zhxgsj;
	private String yxzt ;//运行状态（1：运行中；2；停止中）
	private String gnbs;//(功能标识 1：查看全部查询异常（例外）任务列表 、2：查看自己创建异常（例外）任务列表 )
	private String yccxrows;//异常查询行数
	private Integer updateCount;//影响行数
	private String sfyyc;//是否有异常
	
	private String xtdm;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getMs() {
		return ms;
	}
	public void setMs(String ms) {
		this.ms = ms;
	}
	public String getYccxsql() {
		return yccxsql;
	}
	public void setYccxsql(String yccxsql) {
		this.yccxsql = yccxsql;
	}
	public String getYcclsql() {
		return ycclsql;
	}
	public void setYcclsql(String ycclsql) {
		this.ycclsql = ycclsql;
	}
	public String getCron() {
		return cron;
	}
	public void setCron(String cron) {
		this.cron = cron;
	}

	public String getZhxgrdm() {
		return zhxgrdm;
	}
	public void setZhxgrdm(String zhxgrdm) {
		this.zhxgrdm = zhxgrdm;
	}
	public String getZhxgsj() {
		return zhxgsj;
	}
	public void setZhxgsj(String zhxgsj) {
		this.zhxgsj = zhxgsj;
	}
	public String getGnbs() {
		return gnbs;
	}
	public void setGnbs(String gnbs) {
		this.gnbs = gnbs;
	}
	public String getYxzt() {
		return yxzt;
	}
	public void setYxzt(String yxzt) {
		this.yxzt = yxzt;
	}
	public String getYccxrows() {
		return yccxrows;
	}
	public void setYccxrows(String yccxrows) {
		this.yccxrows = yccxrows;
	}
	public Integer getUpdateCount() {
		return updateCount;
	}
	public void setUpdateCount(Integer updateCount) {
		this.updateCount = updateCount;
	}
	public String getXtdm() {
		return xtdm;
	}
	public void setXtdm(String xtdm) {
		this.xtdm = xtdm;
	}
	public String getSfyyc() {
		return sfyyc;
	}
	public void setSfyyc(String sfyyc) {
		this.sfyyc = sfyyc;
	}
	
	
}
