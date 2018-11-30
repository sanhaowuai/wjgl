package com.incon.pojo.common.xxfbxx;
/**
 * 
 * @类名：com.incon.pojo.common.xxfbxx.XxfbEntity
 * @创建人：安智博
 * @日期：2016-8-17
 * @描述：PT_XT_信息发布(PT_XT_XXFB)
 */
public class XxfbEntity {
	private String xxid;	//varchar2(50)	n			信息id  唯一索引
	private String xxbt;	//varchar2(200)	n			信息标题
	private String xxnr;	//clob	y			信息内容
	private String fbr;		//varchar2(50)	y			发布人
	private String sfyfj;	//varchar2(1)	y			是否有附件
	private String fbsj;	//date	y	sysdate		发布时间
	private String sfhz;	//varchar2(1)	y			是否回执.  1.需要回执   0.不需要回执
	private String kjyhlx;	//varchar2(1)	y			可见用户类型   0.所有  1.教师  2.学生
	private String kjyhfw;	//varchar2(200)	y	'0'		可见用户范围   0所有 ;逗号隔开多个学院(支持多选)
	private String sffb;	//varchar2(1)	y			是否发布   1.发布   0.保存
	private String url;		//varchar2(200)	y			访问url
	private String fbrxm;	//varchar2(200)	y			发布人姓名
	private String fbrxydm;	//varchar2(200)	y			发布人院系代码
	private String fbrxymc;	//varchar2(200)	y			发布人院系名称
	private String xxlb;	//varchar2(50)	y			信息类别代码表（pt_xt_xxlbdmb）
	
	private String qxdm;
	private String fqxdm;
	private String yhdm;
	private String sfczfj;
	private String sfyd;
	private String zxtdm;
	private String mxdxxsz;
	private String newxxid;
	
	
	public String getZxtdm() {
		return zxtdm;
	}
	public void setZxtdm(String zxtdm) {
		this.zxtdm = zxtdm;
	}
	public String getSfczfj() {
		return sfczfj;
	}
	public String getSfyd() {
		return sfyd;
	}
	public void setSfczfj(String sfczfj) {
		this.sfczfj = sfczfj;
	}
	public void setSfyd(String sfyd) {
		this.sfyd = sfyd;
	}
	public String getYhdm() {
		return yhdm;
	}
	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}
	public String getQxdm() {
		return qxdm;
	}
	public String getFqxdm() {
		return fqxdm;
	}
	public void setQxdm(String qxdm) {
		this.qxdm = qxdm;
	}
	public void setFqxdm(String fqxdm) {
		this.fqxdm = fqxdm;
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
	public String getSffb() {
		return sffb;
	}
	public void setSffb(String sffb) {
		this.sffb = sffb;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getFbrxm() {
		return fbrxm;
	}
	public void setFbrxm(String fbrxm) {
		this.fbrxm = fbrxm;
	}
	public String getFbrxydm() {
		return fbrxydm;
	}
	public void setFbrxydm(String fbrxydm) {
		this.fbrxydm = fbrxydm;
	}
	public String getFbrxymc() {
		return fbrxymc;
	}
	public void setFbrxymc(String fbrxymc) {
		this.fbrxymc = fbrxymc;
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
