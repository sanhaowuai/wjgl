package com.incon.pojo.common;

import java.io.Serializable;
import java.sql.Date;

/**
 * 
 * @类名：  com.incon.pojo.common.FjbEntity
 * @创建人： 于洋
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  附件表
 * @版本号：
 */
@SuppressWarnings("all")
public class FjbEntity implements Serializable{
	private String fjid;	//附件主键
	private String cclj;	//附件链接
	private String xsmc;	//文件名
	private String ccm;		//保存名
	private String glzj;	//关联主键
	private String scsj;	//上传时间
	private String scr;		//上传人
	private String glb;		//表名
	private String glzjz;	//关联主键值
	
	/** get set */
	public String getFjid() {
		return fjid;
	}
	
	public void setFjid(String fjid) {
		this.fjid = fjid;
	}
	
	public String getCclj() {
		return cclj;
	}
	
	public void setCclj(String cclj) {
		this.cclj = cclj;
	}
	
	public String getXsmc() {
		return xsmc;
	}
	
	public void setXsmc(String xsmc) {
		this.xsmc = xsmc;
	}
	
	public String getCcm() {
		return ccm;
	}
	
	public void setCcm(String ccm) {
		this.ccm = ccm;
	}
	
	public String getGlzj() {
		return glzj;
	}
	
	public void setGlzj(String glzj) {
		this.glzj = glzj;
	}
	
	public String getScsj() {
		return scsj;
	}
	
	public void setScsj(String scsj) {
		this.scsj = scsj;
	}
	
	public String getScr() {
		return scr;
	}
	
	public void setScr(String scr) {
		this.scr = scr;
	}
	
	public String getGlb() {
		return glb;
	}
	
	public void setGlb(String glb) {
		this.glb = glb;
	}
	
	public String getGlzjz() {
		return glzjz;
	}
	
	public void setGlzjz(String glzjz) {
		this.glzjz = glzjz;
	}
}
