package com.incon.pojo.common;

import java.io.Serializable;

/**
 * 
 * @类名： com.incon.pojo.wzgl.ZdglEntity
 * @创建人： 郭桦
 * @日期： 2013-8-26
 * @修改人：
 * @日期：
 * @描述： pt_xt_xxfb实体
 * @版本号：
 */
@SuppressWarnings("all")
public class XxfbbEntity {
	private String xxid;// 信息id 唯一索引
	private String xxbt;// 信息标题
	private String xxnr;// 信息内容
	private String fbr;// 发布人
	private String sfyfj;
	private String fbsj;// 发布时间
	private String sfhz;// 是否回执. 1.需要回执 2.不需要回执
	private String kjyhlx;// 可见用户类型 1.所有 2.教师 3.学生
	private String kjyhfw;// 可见用户范围 1.所有 2.指定学院
	private String fbsj_xs ; //发布时间 显示 (到分
	private String fbrxm ; //发布人姓名
	private String yhdm ; // 用户代码 
	private String sfyd ; //是否已读  1.已读;0.未读
	private String fbrbm ;//发布人部门 （ 学院）
	private String sffb ;//是否发布  1 发布  0  保存
	private String url;
	private String xxlb;//信息类别（1：公共信息；2：一卡通）
	private String fbrxymc;
	private String zxtdm;
	private String mxdxxsz;
	private String newxxid;
	
	
    public String getZxtdm() {
		return zxtdm;
	}

	public void setZxtdm(String zxtdm) {
		this.zxtdm = zxtdm;
	}

	public String getFbrxymc() {
		return fbrxymc;
	}

	public void setFbrxymc(String fbrxymc) {
		this.fbrxymc = fbrxymc;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	//------学生信息用--------
	private String mxdx;//面向对象
	private String xxfl;//信息分类代码
	private String xxflmc;//信息分类名称
	
	public String getXxfl() {
		return xxfl;
	}

	public void setXxfl(String xxfl) {
		this.xxfl = xxfl;
	}

	public String getXxflmc() {
		return xxflmc;
	}

	public void setXxflmc(String xxflmc) {
		this.xxflmc = xxflmc;
	}

	public String getMxdx() {
		return mxdx;
	}

	public void setMxdx(String mxdx) {
		this.mxdx = mxdx;
	}

	public String getSffb() {
		return sffb;
	}

	public void setSffb(String sffb) {
		this.sffb = sffb;
	}

	public String getXxid() {
		return xxid;
	}

	public void setXxid(String xxid) {
		this.xxid = xxid;
	}

	public String getXxbt() {
		return xxbt;
	}

	public void setXxbt(String xxbt) {
		this.xxbt = xxbt;
	}

	public String getXxnr() {
		return xxnr;
	}

	public void setXxnr(String xxnr) {
		this.xxnr = xxnr;
	}

	public String getFbr() {
		return fbr;
	}

	public void setFbr(String fbr) {
		this.fbr = fbr;
	}

	public String getSfyfj() {
		return sfyfj;
	}

	public void setSfyfj(String sfyfj) {
		this.sfyfj = sfyfj;
	}

	public String getFbsj() {
		return fbsj;
	}

	public void setFbsj(String fbsj) {
		this.fbsj = fbsj;
	}

	public String getSfhz() {
		return sfhz;
	}

	public void setSfhz(String sfhz) {
		this.sfhz = sfhz;
	}

	public String getKjyhlx() {
		return kjyhlx;
	}

	public void setKjyhlx(String kjyhlx) {
		this.kjyhlx = kjyhlx;
	}

	public String getKjyhfw() {
		return kjyhfw;
	}

	public void setKjyhfw(String kjyhfw) {
		this.kjyhfw = kjyhfw;
	}

	public String getFbsj_xs() {
		return fbsj_xs;
	}

	public void setFbsj_xs(String fbsjXs) {
		fbsj_xs = fbsjXs;
	}

	public String getFbrxm() {
		return fbrxm;
	}

	public void setFbrxm(String fbrxm) {
		this.fbrxm = fbrxm;
	}

	public String getYhdm() {
		return yhdm;
	}

	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}

	public String getSfyd() {
		return sfyd;
	}

	public void setSfyd(String sfyd) {
		this.sfyd = sfyd;
	}

	public String getFbrbm() {
		return fbrbm;
	}

	public void setFbrbm(String fbrbm) {
		this.fbrbm = fbrbm;
	}

	public String getXxlb() {
		return xxlb;
	}

	public void setXxlb(String xxlb) {
		this.xxlb = xxlb;
	}

	public String getMxdxxsz() {
		return mxdxxsz;
	}

	public void setMxdxxsz(String mxdxxsz) {
		this.mxdxxsz = mxdxxsz;
	}

	public String getNewxxid() {
		return newxxid;
	}

	public void setNewxxid(String newxxid) {
		this.newxxid = newxxid;
	}

	
}
