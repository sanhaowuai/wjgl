package com.incon.pojo.common.jcxgxxwh;

import java.io.Serializable;


/**
 * 
 * @类名： com.incon.pojo.common.jcxgxxwh.GwbEntity
 * @创建人： 杨文龙
 * @日期： 2014-3-12
 * @修改人：
 * @日期：
 * @描述： 岗位(DM_GWB)
 * @版本号：
 */
@SuppressWarnings("all")
public class GwbEntity implements Serializable{

	private String dm; //代码
	private String mc; //名称
	private String gwlx; //岗位类型
	private String kyf; //可用否
	public String getDm() {
		return dm;
	}
	public void setDm(String dm) {
		this.dm = dm;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getGwlx() {
		return gwlx;
	}
	public void setGwlx(String gwlx) {
		this.gwlx = gwlx;
	}
	public String getKyf() {
		return kyf;
	}
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
	
}
