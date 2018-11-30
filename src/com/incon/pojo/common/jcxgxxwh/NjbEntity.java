package com.incon.pojo.common.jcxgxxwh;

import java.io.Serializable;


/**
 * 
 * @类名： com.incon.pojo.common.jcxgxxwh.NjbEntity
 * @创建人： 杨文龙
 * @日期： 2014-3-12
 * @修改人：
 * @日期：
 * @描述： 专业类别(DM_ZYLB)
 * @版本号：
 */
@SuppressWarnings("all")
public class NjbEntity implements Serializable{

	private Integer nj; //年级
	private String njmc; //年级名称
	private String kyf; //可用否
	public Integer getNj() {
		return nj;
	}
	public void setNj(Integer nj) {
		this.nj = nj;
	}
	public String getNjmc() {
		return njmc;
	}
	public void setNjmc(String njmc) {
		this.njmc = njmc;
	}
	public String getKyf() {
		return kyf;
	}
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
	
	
}
