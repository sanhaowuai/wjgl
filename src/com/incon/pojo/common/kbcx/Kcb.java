package com.incon.pojo.common.kbcx;

import java.io.Serializable;
/**
 * @描述： 课程表实体
 */
@SuppressWarnings("serial")
public class Kcb implements Serializable {
	private String SXW_CN;
	private String BZ;
	private String MON;
	private String TUES;
	private String WED;
	private String THUR;
	private String FRI;
	private String SAT;
	private String SUN;
	
	public String getSXW_CN() {
		return SXW_CN;
	}
	public void setSXW_CN(String sXWCN) {
		SXW_CN = sXWCN;
	}
	public String getBZ() {
		return BZ;
	}
	public void setBZ(String bZ) {
		BZ = bZ;
	}
	public String getMON() {
		return MON;
	}
	public void setMON(String mON) {
		MON = mON;
	}
	public String getTUES() {
		return TUES;
	}
	public void setTUES(String tUES) {
		TUES = tUES;
	}
	public String getWED() {
		return WED;
	}
	public void setWED(String wED) {
		WED = wED;
	}
	public String getTHUR() {
		return THUR;
	}
	public void setTHUR(String tHUR) {
		THUR = tHUR;
	}
	public String getFRI() {
		return FRI;
	}
	public void setFRI(String fRI) {
		FRI = fRI;
	}
	public String getSAT() {
		return SAT;
	}
	public void setSAT(String sAT) {
		SAT = sAT;
	}
	public String getSUN() {
		return SUN;
	}
	public void setSUN(String sUN) {
		SUN = sUN;
	}
	
}