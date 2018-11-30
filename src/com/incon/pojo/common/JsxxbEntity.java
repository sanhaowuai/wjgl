package com.incon.pojo.common;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @类名：  com.incon.pojo.common.JsxxbEntity
 * @创建人： 杨文龙
 * @日期： 2014-3-10
 * @修改人：
 * @日期：
 * @描述：  教师表(SZ_JSXXB)
 * @版本号：
 */
@SuppressWarnings("all")
public class JsxxbEntity implements Serializable{

	private String zgh; //教师号
	private String jsxm; //教师名称
	private String jsjc; //教师简称 
	private Date csrq; //出生日期
	private String xb; //性别
	private String zw; //职务
	private String zc; //职称
	private String xl; //学历
	private String xw; //学位
	private String xydm; //学院代码
	private String xdm; //系代码
	private String ssjys; //所属教研室
	private String sfrkjs; //是否任课教师
	private String sfwp; //是否外聘
	private String sfzg; //是否在岗
	private String lxdh; //联系电话
	private String dzyx; //电子邮箱
	private String byxx; //毕业学校
	private String jsjj; //教师简介
	private String yjfx; //研究方向
	private String mz; //民族
	private String zzmm; //政治面貌
	private String jg; //籍贯
	private String sfzh; //身份证号
	private String zgzh; //教师资格证号
	private String zp; //照片
	private String yxmc; //院系名称
	private String jsm; //角色名称
	private String mm; //密码
	private String whcd;//文化程度
	private String xzjb;//行政级别
	private String glyx;//管理院系
	private String cjr;//创建人

	private String xmc;		//系名称
	private String xbmc; //性别名称
	private String jgmc; //籍贯名称
	private String mzmc; //民族名称
	private String whcdmc;//文化程度名称
	private String jysdm;	//教研室代码
	private String jysmc;	//教研室名称
	private String kyf;	//可用否
	public String getXzjb() {
		return xzjb;
	}
	public void setXzjb(String xzjb) {
		this.xzjb = xzjb;
	}
	private String xlmc; //学历名称
	private String xwmc; //学位名称
	private String xzjbmc;//行政级别名称
	private String zcmc; //职称名称
	private String zzmmmc; //政治面貌名称
	private String bszplj;//BS照片路径
	
	public String getWhcd() {
		return whcd;
	}
	public String getBszplj() {
		return bszplj;
	}
	public void setBszplj(String bszplj) {
		this.bszplj = bszplj;
	}
	public void setWhcd(String whcd) {
		this.whcd = whcd;
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
	public String getZgh() {
		return zgh;
	}
	public void setZgh(String zgh) {
		this.zgh = zgh;
	}
	public String getJsxm() {
		return jsxm;
	}
	public void setJsxm(String jsxm) {
		this.jsxm = jsxm;
	}
	public String getJsjc() {
		return jsjc;
	}
	public void setJsjc(String jsjc) {
		this.jsjc = jsjc;
	}
	public Date getCsrq() {
		return csrq;
	}
	public void setCsrq(Date csrq) {
		this.csrq = csrq;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getZw() {
		return zw;
	}
	public void setZw(String zw) {
		this.zw = zw;
	}
	public String getZc() {
		return zc;
	}
	public void setZc(String zc) {
		this.zc = zc;
	}
	public String getXl() {
		return xl;
	}
	public void setXl(String xl) {
		this.xl = xl;
	}
	public String getXw() {
		return xw;
	}
	public void setXw(String xw) {
		this.xw = xw;
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
	public String getSsjys() {
		return ssjys;
	}
	public void setSsjys(String ssjys) {
		this.ssjys = ssjys;
	}
	public String getSfrkjs() {
		return sfrkjs;
	}
	public void setSfrkjs(String sfrkjs) {
		this.sfrkjs = sfrkjs;
	}
	public String getSfwp() {
		return sfwp;
	}
	public void setSfwp(String sfwp) {
		this.sfwp = sfwp;
	}
	public String getSfzg() {
		return sfzg;
	}
	public void setSfzg(String sfzg) {
		this.sfzg = sfzg;
	}
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	public String getDzyx() {
		return dzyx;
	}
	public void setDzyx(String dzyx) {
		this.dzyx = dzyx;
	}
	public String getByxx() {
		return byxx;
	}
	public void setByxx(String byxx) {
		this.byxx = byxx;
	}
	public String getJsjj() {
		return jsjj;
	}
	public void setJsjj(String jsjj) {
		this.jsjj = jsjj;
	}
	public String getYjfx() {
		return yjfx;
	}
	public void setYjfx(String yjfx) {
		this.yjfx = yjfx;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getZzmm() {
		return zzmm;
	}
	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}
	public String getJg() {
		return jg;
	}
	public void setJg(String jg) {
		this.jg = jg;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getZgzh() {
		return zgzh;
	}
	public void setZgzh(String zgzh) {
		this.zgzh = zgzh;
	}
	public String getZp() {
		return zp;
	}
	public void setZp(String zp) {
		this.zp = zp;
	}
	public String getJsm() {
		return jsm;
	}
	public void setJsm(String jsm) {
		this.jsm = jsm;
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
	public String getJysmc() {
		return jysmc;
	}
	public void setJysmc(String jysmc) {
		this.jysmc = jysmc;
	}
	public String getJysdm() {
		return jysdm;
	}
	public void setJysdm(String jysdm) {
		this.jysdm = jysdm;
	}
	public String getGlyx() {
		return glyx;
	}
	public void setGlyx(String glyx) {
		this.glyx = glyx;
	}
	public String getCjr() {
		return cjr;
	}
	public void setCjr(String cjr) {
		this.cjr = cjr;
	}
	public String getKyf() {
		return kyf;
	}
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
	
	
	//赵玥平台教师  tree用
	private String dm,mc,fdm,jysmcordm,yxmcordm;
	public String getJysmcordm() {
		return jysmcordm;
	}
	public void setJysmcordm(String jysmcordm) {
		this.jysmcordm = jysmcordm;
	}
	public String getYxmcordm() {
		return yxmcordm;
	}
	public void setYxmcordm(String yxmcordm) {
		this.yxmcordm = yxmcordm;
	}
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
}
