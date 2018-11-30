package com.incon.pojo.common.xxfbxx;
/**
 * 
 * @类名：com.incon.pojo.common.xxfbxx.XxfbhzbEntity
 * @创建人：安智博
 * @日期：2016-8-17
 * @描述：PT_XT_信息发布回执表(PT_XT_XXFBHZB)
 */
public class XxfbhzbEntity {
	private String id;		//varchar2(50)	n			
	private String yhdm;	//varchar2(50)	n			用户代码
	private String xxid;	//varchar2(50)	n			pt_xt_xxfb.id或 pt_xt_hytz.id
	private String dqsj;	//date	n			查看时间
	private String sfhz;	//varchar2(1)	y	'0'		是否回执   1是 0否(表示只是查看)
	private String bchyy;	//varchar2(1)	y			不参会理由(1 有课；2 行政事务；3其他)
	private String sfcj;	//varchar2(1)	y			是否参加会议
	
	private String yhxm;	// 用户姓名
	private String yxmc;	// 院系名称
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getYhdm() {
		return yhdm;
	}
	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}
	public String getXxid() {
		return xxid;
	}
	public void setXxid(String xxid) {
		this.xxid = xxid;
	}
	public String getDqsj() {
		return dqsj;
	}
	public void setDqsj(String dqsj) {
		this.dqsj = dqsj;
	}
	public String getSfhz() {
		return sfhz;
	}
	public void setSfhz(String sfhz) {
		this.sfhz = sfhz;
	}
	public String getBchyy() {
		return bchyy;
	}
	public void setBchyy(String bchyy) {
		this.bchyy = bchyy;
	}
	public String getSfcj() {
		return sfcj;
	}
	public void setSfcj(String sfcj) {
		this.sfcj = sfcj;
	}
	public String getYhxm() {
		return yhxm;
	}
	public void setYhxm(String yhxm) {
		this.yhxm = yhxm;
	}
	public String getYxmc() {
		return yxmc;
	}
	public void setYxmc(String yxmc) {
		this.yxmc = yxmc;
	}

}
