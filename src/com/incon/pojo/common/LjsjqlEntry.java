package com.incon.pojo.common;

import java.util.Date;

public class LjsjqlEntry {
 
     private  String  id ; // XT_LJSJQLB  null.ID   datatype[VARCHAR2]  length[100]
     private  String  tablename ; // XT_LJSJQLB  null.表名   datatype[VARCHAR2]  length[100]
     private  String  wheresql ; // XT_LJSJQLB  null.where语句   datatype[VARCHAR2]  length[4000]
     private  Integer  zxcs ; // XT_LJSJQLB  null.执行次数   datatype[NUMBER]  length[22]
     private  String  whr ; // XT_LJSJQLB  null.维护人   datatype[VARCHAR2]  length[100]
     private  String  zhzxr ; // XT_LJSJQLB  null.最后执行人   datatype[VARCHAR2]  length[100]
     private  String  zhzxsj ; // XT_LJSJQLB  null.追后执行时间   datatype[DATE]  length[7]
	 // ID   datatype[VARCHAR2]
     public  String  getId() {
		        return id ;
	 }
     // ID  datatype[VARCHAR2]
     public void setId( String  id) {
		        this.id = id;
	 }
	 // 表名   datatype[VARCHAR2]
     public  String  getTablename() {
		        return tablename ;
	 }
     // 表名  datatype[VARCHAR2]
     public void setTablename( String  tablename) {
		        this.tablename = tablename;
	 }
	 // where语句   datatype[VARCHAR2]
     public  String  getWheresql() {
		        return wheresql ;
	 }
     // where语句  datatype[VARCHAR2]
     public void setWheresql( String  wheresql) {
		        this.wheresql = wheresql;
	 }
	 // 执行次数   datatype[NUMBER]
     public  Integer  getZxcs() {
		        return zxcs ;
	 }
     // 执行次数  datatype[NUMBER]
     public void setZxcs( Integer  zxcs) {
		        this.zxcs = zxcs;
	 }
	 // 维护人   datatype[VARCHAR2]
     public  String  getWhr() {
		        return whr ;
	 }
     // 维护人  datatype[VARCHAR2]
     public void setWhr( String  whr) {
		        this.whr = whr;
	 }
	 // 最后执行人   datatype[VARCHAR2]
     public  String  getZhzxr() {
		        return zhzxr ;
	 }
     // 最后执行人  datatype[VARCHAR2]
     public void setZhzxr( String  zhzxr) {
		        this.zhzxr = zhzxr;
	 }
	public String getZhzxsj() {
		return zhzxsj;
	}
	public void setZhzxsj(String zhzxsj) {
		this.zhzxsj = zhzxsj;
	}
 
	
}
	
	
