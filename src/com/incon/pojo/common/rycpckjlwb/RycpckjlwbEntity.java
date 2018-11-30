package com.incon.pojo.common.rycpckjlwb;

/**
 * 
 * @类名： com.incon.pojo.common.rycpckjlwb.Rycpckjlwb
 * @创建人： 高阳
 * @日期： 2016-09-01 
 * @修改人：
 * @日期：
 * @描述： PT_人员磁盘空间例外表（PT_RYCPCKJLWB）
 * @版本号：
 */
@SuppressWarnings("all")
public class RycpckjlwbEntity {
	private String yhdm;//	varchar2(50)	n			用户代码
	private String cckj;//	number	y	0		存储空间[单位:kb]
    private String yylx;//	char(2)	n			应用类型[1:邮箱;2:文件中心]
    private String bz;//	varchar2(4000)	y			备注
    
    private String xm;	//姓名
    
    
	public String getYhdm() {
		return yhdm;
	}
	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}
	public String getCckj() {
		return cckj;
	}
	public void setCckj(String cckj) {
		this.cckj = cckj;
	}
	public String getYylx() {
		return yylx;
	}
	public void setYylx(String yylx) {
		this.yylx = yylx;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
    
    
}
