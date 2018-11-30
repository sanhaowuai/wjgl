package com.incon.pojo.common.zjwh;

/**
 * 
 * @类名： com.incon.pojo.common.zjwh.JszjbEntity
 * @创建人： 高阳
 * @日期： 2016-08-9 
 * @修改人：
 * @日期：
 * @描述： DM_ZJ_角色组件表(dm_zj_jszjb)
 * @版本号：
 */
public class JszjbEntity {

	private String jsdm;//	varchar2(50)			角色代码
	private String zjdm;//	varchar2(50)			组件代码
	private String xtdm;//	varchar2(50)			系统代码
	public String getJsdm() {
		return jsdm;
	}
	public void setJsdm(String jsdm) {
		this.jsdm = jsdm;
	}
	public String getZjdm() {
		return zjdm;
	}
	public void setZjdm(String zjdm) {
		this.zjdm = zjdm;
	}
	public String getXtdm() {
		return xtdm;
	}
	public void setXtdm(String xtdm) {
		this.xtdm = xtdm;
	}

}
