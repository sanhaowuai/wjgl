package com.incon.pojo.common.cjcx;

public class Qmcjcx {
	//======================期末==成绩==================================
	private String id;			//
 	private String rwh; 		//任务号
	private String xh; 			//学号
	private String xm; 			//姓名
 	private String kcdm;		//课程代码
 	private String kcmc;		//课程名称
 	private String kcxz;		//课程性质
 	private String kcxzmc;		//课程性质
 	private String kclb;		//课程类别
 	private String kclbmc;		//课程类别
 	private Double xf;			//学分
 	private String sfksk;		//是否考试课
 	private String sfcyxfjjs;	//是否参与学分绩计算
 	private String zpcj; 		//总评成绩
 	private String cjbz; 		//成绩备注
	private String cjbzmc; 		//成绩备注名称
	private String bkcxbj; 		//补考重修标记 0正考 1补考 2重修 3毕业补考
	private String xnxqmc; 		//学年学期名称
 	
	private String ljfxjfz; 		//累加分项记分制
	private String ljfxjfzmc; 		//累加分项记分制名称
	private String zpcjjfz; 		//总评成绩记分制
	private String zpcjjfzmc; 		//总评成绩记分制名称
	private Double bfzmf; 			//百分制满分(计分制满分)
	private String sfjg; 			//是否及格
	
	private String kkyx; 			//开课院系
	private String kkyxmc; 			//开课院系名称
	private String pm; 			//开课院系名称

	private String cjtjsj;//成绩提交时间
	
	private String ljfx01;
	private String ljfx02;
	private String ljfx03;
	private String ljfx04;
	private String ljfx05;
	private String ljfx06;
	private String ljfx07;
	private String ljfx08;
	private String ljfx09;
	private String ljfx10;
	private String jf1;
	private String jf2;
	private String jhh;
	private String sfkck;//是否可查看
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRwh() {
		return rwh;
	}
	public void setRwh(String rwh) {
		this.rwh = rwh;
	}
	public String getXh() {
		return xh;
	}
	public void setXh(String xh) {
		this.xh = xh;
	}
	public String getKcdm() {
		return kcdm;
	}
	public void setKcdm(String kcdm) {
		this.kcdm = kcdm;
	}
	public String getKcmc() {
		return kcmc;
	}
	public void setKcmc(String kcmc) {
		this.kcmc = kcmc;
	}
	public String getKcxz() {
		return kcxz;
	}
	public void setKcxz(String kcxz) {
		this.kcxz = kcxz;
	}
	public String getKcxzmc() {
		return kcxzmc;
	}
	public void setKcxzmc(String kcxzmc) {
		this.kcxzmc = kcxzmc;
	}
	public String getKclb() {
		return kclb;
	}
	public void setKclb(String kclb) {
		this.kclb = kclb;
	}
	public String getKclbmc() {
		return kclbmc;
	}
	public void setKclbmc(String kclbmc) {
		this.kclbmc = kclbmc;
	}
	
	public Double getXf() {
		return xf;
	}
	public void setXf(Double xf) {
		this.xf = xf;
	}
	public String getSfksk() {
		return sfksk;
	}
	public void setSfksk(String sfksk) {
		this.sfksk = sfksk;
	}
	public String getSfcyxfjjs() {
		return sfcyxfjjs;
	}
	public void setSfcyxfjjs(String sfcyxfjjs) {
		this.sfcyxfjjs = sfcyxfjjs;
	}
	public String getZpcj() {
		return zpcj;
	}
	public void setZpcj(String zpcj) {
		this.zpcj = zpcj;
	}
	public String getCjbz() {
		return cjbz;
	}
	public void setCjbz(String cjbz) {
		this.cjbz = cjbz;
	}
	public String getCjbzmc() {
		return cjbzmc;
	}
	public void setCjbzmc(String cjbzmc) {
		this.cjbzmc = cjbzmc;
	}
	public String getBkcxbj() {
		return bkcxbj;
	}
	public void setBkcxbj(String bkcxbj) {
		this.bkcxbj = bkcxbj;
	}
	public String getXnxqmc() {
		return xnxqmc;
	}
	public void setXnxqmc(String xnxqmc) {
		this.xnxqmc = xnxqmc;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getLjfxjfz() {
		return ljfxjfz;
	}
	public void setLjfxjfz(String ljfxjfz) {
		this.ljfxjfz = ljfxjfz;
	}
	public String getLjfxjfzmc() {
		return ljfxjfzmc;
	}
	public void setLjfxjfzmc(String ljfxjfzmc) {
		this.ljfxjfzmc = ljfxjfzmc;
	}
	public String getZpcjjfz() {
		return zpcjjfz;
	}
	public void setZpcjjfz(String zpcjjfz) {
		this.zpcjjfz = zpcjjfz;
	}
	public String getZpcjjfzmc() {
		return zpcjjfzmc;
	}
	public void setZpcjjfzmc(String zpcjjfzmc) {
		this.zpcjjfzmc = zpcjjfzmc;
	}
	public Double getBfzmf() {
		return bfzmf;
	}
	public void setBfzmf(Double bfzmf) {
		this.bfzmf = bfzmf;
	}
	public String getLjfx01() {
		return ljfx01;
	}
	public void setLjfx01(String ljfx01) {
		this.ljfx01 = ljfx01;
	}
	public String getLjfx02() {
		return ljfx02;
	}
	public void setLjfx02(String ljfx02) {
		this.ljfx02 = ljfx02;
	}
	public String getLjfx03() {
		return ljfx03;
	}
	public void setLjfx03(String ljfx03) {
		this.ljfx03 = ljfx03;
	}
	public String getLjfx04() {
		return ljfx04;
	}
	public void setLjfx04(String ljfx04) {
		this.ljfx04 = ljfx04;
	}
	public String getLjfx05() {
		return ljfx05;
	}
	public void setLjfx05(String ljfx05) {
		this.ljfx05 = ljfx05;
	}
	public String getLjfx06() {
		return ljfx06;
	}
	public void setLjfx06(String ljfx06) {
		this.ljfx06 = ljfx06;
	}
	public String getLjfx07() {
		return ljfx07;
	}
	public void setLjfx07(String ljfx07) {
		this.ljfx07 = ljfx07;
	}
	public String getLjfx08() {
		return ljfx08;
	}
	public void setLjfx08(String ljfx08) {
		this.ljfx08 = ljfx08;
	}
	public String getLjfx09() {
		return ljfx09;
	}
	public void setLjfx09(String ljfx09) {
		this.ljfx09 = ljfx09;
	}
	public String getLjfx10() {
		return ljfx10;
	}
	public void setLjfx10(String ljfx10) {
		this.ljfx10 = ljfx10;
	}
	public String getJf1() {
		return jf1;
	}
	public void setJf1(String jf1) {
		this.jf1 = jf1;
	}
	public String getJf2() {
		return jf2;
	}
	public void setJf2(String jf2) {
		this.jf2 = jf2;
	}
	public String getSfjg() {
		return sfjg;
	}
	public void setSfjg(String sfjg) {
		this.sfjg = sfjg;
	}
	public String getKkyx() {
		return kkyx;
	}
	public void setKkyx(String kkyx) {
		this.kkyx = kkyx;
	}
	public String getKkyxmc() {
		return kkyxmc;
	}
	public void setKkyxmc(String kkyxmc) {
		this.kkyxmc = kkyxmc;
	}
	public String getJhh() {
		return jhh;
	}
	public void setJhh(String jhh) {
		this.jhh = jhh;
	}
	public String getPm() {
		return pm;
	}
	public void setPm(String pm) {
		this.pm = pm;
	}
	public String getSfkck() {
		return sfkck;
	}
	public void setSfkck(String sfkck) {
		this.sfkck = sfkck;
	}
	public String getCjtjsj() {
		return cjtjsj;
	}
	public void setCjtjsj(String cjtjsj) {
		this.cjtjsj = cjtjsj;
	}
	
	
	
}
