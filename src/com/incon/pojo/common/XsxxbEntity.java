package com.incon.pojo.common;

import java.io.Serializable;
import java.util.Date;
/**
 * 
 * @类名：  com.incon.pojo.common.XsxxbEntity
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  学生信息表(XJ_XSXXB)
 * @版本号：
 */
public class XsxxbEntity implements Serializable{

	private String xh; //学号
	private String xm; //姓名
	private String xydm; //所属院代码
	private String xdm; //所属系代码
	private String zydm; //专业代码
	private String xb; //性别
	private Date csrq; //出生日期
	private String zzmm; //政治面貌
	private String mzdm; //民族代码
	private String jgdm; //籍贯代码
	private String sfzx; //是否在校
	private String yxmc; //院系名称
	private String zymc; //专业名称
	private String mm; //密码
	private String xmc;		//系名称
	private String xbmc; //性别名称
	private String jgmc; //籍贯名称
	private String mzmc; //民族名称
	private String whcdmc; //文化程度名称
	private String xlmc; //学历名称
	private String xwmc; //学位名称
	private String xzjbmc; //行政级别名称
	private String zcmc; //职称名称
	private String zzmmmc; //政治面貌名称
	private String jg;//籍贯
	private String cjr;//创建人
	private String jsm; //角色名称
	private String sjlj;//照片用  （赵玥）
	private String nj;//年级
	private String njmc;
	public String getSjlj() {
		return sjlj;
	}
	public void setSjlj(String sjlj) {
		this.sjlj = sjlj;
	}
	private String mz;//民族
	private String glyx;//管理院系
	private String bjdm;	//班级代码
	private String bjmc;	//班级名称
	
	private String bszplj;
	
	public String getGlyx() {
		return glyx;
	}
	public void setGlyx(String glyx) {
		this.glyx = glyx;
	}
	public String getJg() {
		return jg;
	}
	public void setJg(String jg) {
		this.jg = jg;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getJgmc() {
		return jgmc;
	}
	public void setJgmc(String jgmc) {
		this.jgmc = jgmc;
	}
	public String getMzmc() {
		return mzmc;
	}
	public void setMzmc(String mzmc) {
		this.mzmc = mzmc;
	}
	public String getWhcdmc() {
		return whcdmc;
	}
	public void setWhcdmc(String whcdmc) {
		this.whcdmc = whcdmc;
	}
	public String getXlmc() {
		return xlmc;
	}
	public void setXlmc(String xlmc) {
		this.xlmc = xlmc;
	}
	public String getXwmc() {
		return xwmc;
	}
	public void setXwmc(String xwmc) {
		this.xwmc = xwmc;
	}
	public String getXzjbmc() {
		return xzjbmc;
	}
	public void setXzjbmc(String xzjbmc) {
		this.xzjbmc = xzjbmc;
	}
	public String getZcmc() {
		return zcmc;
	}
	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}
	public String getZzmmmc() {
		return zzmmmc;
	}
	public void setZzmmmc(String zzmmmc) {
		this.zzmmmc = zzmmmc;
	}
	public String getYxmc() {
		return yxmc;
	}
	public void setYxmc(String yxmc) {
		this.yxmc = yxmc;
	}
	public String getZymc() {
		return zymc;
	}
	public void setZymc(String zymc) {
		this.zymc = zymc;
	}
	public String getZp1() {
		return zp1;
	}
	public void setZp1(String zp1) {
		this.zp1 = zp1;
	}
	private String sfzc; //是否注册
	private String zp1; //照片1
	public String getXh() {
		return xh;
	}
	public void setXh(String xh) {
		this.xh = xh;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	
	public String getXydm() {
		return xydm;
	}
	public void setXydm(String xydm) {
		this.xydm = xydm;
	}
	public String getXdm() {
		return xdm;
	}
	public void setXdm(String xdm) {
		this.xdm = xdm;
	}
	
	public String getZydm() {
		return zydm;
	}
	public void setZydm(String zydm) {
		this.zydm = zydm;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public Date getCsrq() {
		return csrq;
	}
	public void setCsrq(Date csrq) {
		this.csrq = csrq;
	}
	public String getZzmm() {
		return zzmm;
	}
	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}
	public String getMzdm() {
		return mzdm;
	}
	public void setMzdm(String mzdm) {
		this.mzdm = mzdm;
	}
	public String getJgdm() {
		return jgdm;
	}
	public void setJgdm(String jgdm) {
		this.jgdm = jgdm;
	}
	public String getSfzx() {
		return sfzx;
	}
	public void setSfzx(String sfzx) {
		this.sfzx = sfzx;
	}
	public String getSfzc() {
		return sfzc;
	}
	public void setSfzc(String sfzc) {
		this.sfzc = sfzc;
	}
	public String getMm() {
		return mm;
	}
	public void setMm(String mm) {
		this.mm = mm;
	}
	public String getXmc() {
		return xmc;
	}
	public void setXmc(String xmc) {
		this.xmc = xmc;
	}
	public String getXbmc() {
		return xbmc;
	}
	public void setXbmc(String xbmc) {
		this.xbmc = xbmc;
	}
	public String getBjdm() {
		return bjdm;
	}
	public void setBjdm(String bjdm) {
		this.bjdm = bjdm;
	}
	public String getBjmc() {
		return bjmc;
	}
	public void setBjmc(String bjmc) {
		this.bjmc = bjmc;
	}
	public String getCjr() {
		return cjr;
	}
	public void setCjr(String cjr) {
		this.cjr = cjr;
	}
	public String getJsm() {
		return jsm;
	}
	public void setJsm(String jsm) {
		this.jsm = jsm;
	}
	public String getBszplj() {
		return bszplj;
	}
	public void setBszplj(String bszplj) {
		this.bszplj = bszplj;
	}
	public String getNj() {
		return nj;
	}
	public void setNj(String nj) {
		this.nj = nj;
	}
	//赵玥平台学生  tree用
	private String dm,mc,fdm,zymcordm,yxmcordm;
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
	public String getFdm() {
		return fdm;
	}
	public void setFdm(String fdm) {
		this.fdm = fdm;
	}
	public String getZymcordm() {
		return zymcordm;
	}
	public void setZymcordm(String zymcordm) {
		this.zymcordm = zymcordm;
	}
	public String getYxmcordm() {
		return yxmcordm;
	}
	public void setYxmcordm(String yxmcordm) {
		this.yxmcordm = yxmcordm;
	}
	public String getNjmc() {
		return njmc;
	}
	public void setNjmc(String njmc) {
		this.njmc = njmc;
	}
}
