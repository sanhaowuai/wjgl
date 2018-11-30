package com.incon.pojo.common.zjwh;

/**
 * 
 * @类名： com.incon.pojo.common.zjwh.ZjwhEntity
 * @创建人： 高阳
 * @日期： 2016-08-9 
 * @修改人：
 * @日期：
 * @描述： DM_ZJ_组件表(dm_zj_zjb)
 * @版本号：
 */
public class ZjwhEntity {
	private String zjdm;//	varchar2(50)			组件代码
	private String qxdm;//	varchar2(50)	y		权限代码(点击更多时通过菜单表，反查菜单地址)
	private String xtdm;//	varchar2(50)			系统代码
	private String zjxxmc;//	varchar2(200)	y		组件显示名称
	private String width;//	number	y		宽度
	private String height;//	number	y		高度
	private String src;//	varchar2(500)	y		iframe链接地址
	private String zjlx;//	varchar2(50)	y	'iframe'	组件类型
	private String mbnr;//	varchar2(4000)	y		模板内容
	private String mbdz;//	varchar2(50)	y		模板地址
	private String mbsjy;//	varchar2(50)	y		模板数据源
	private String href;//	varchar2(50)	y		更多链接地址 
	private String qxlb;//  VARCHAR2(50)    		权限类别（0：框架组件；1：平台组件；2：报表）
	
	private String sfxz; //是否选中
	
	public String getZjdm() {
		return zjdm;
	}
	public void setZjdm(String zjdm) {
		this.zjdm = zjdm;
	}
	public String getQxdm() {
		return qxdm;
	}
	public void setQxdm(String qxdm) {
		this.qxdm = qxdm;
	}
	public String getXtdm() {
		return xtdm;
	}
	public void setXtdm(String xtdm) {
		this.xtdm = xtdm;
	}
	public String getZjxxmc() {
		return zjxxmc;
	}
	public void setZjxxmc(String zjxxmc) {
		this.zjxxmc = zjxxmc;
	}
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getZjlx() {
		return zjlx;
	}
	public void setZjlx(String zjlx) {
		this.zjlx = zjlx;
	}
	public String getMbnr() {
		return mbnr;
	}
	public void setMbnr(String mbnr) {
		this.mbnr = mbnr;
	}
	public String getMbdz() {
		return mbdz;
	}
	public void setMbdz(String mbdz) {
		this.mbdz = mbdz;
	}
	public String getMbsjy() {
		return mbsjy;
	}
	public void setMbsjy(String mbsjy) {
		this.mbsjy = mbsjy;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public String getSfxz() {
		return sfxz;
	}
	public void setSfxz(String sfxz) {
		this.sfxz = sfxz;
	}
	public String getQxlb() {
		return qxlb;
	}
	public void setQxlb(String qxlb) {
		this.qxlb = qxlb;
	}

	
}
