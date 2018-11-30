package com.incon.project.common.xsgl.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.JsxxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.jcxgxxwh.BjbEntity;
import com.incon.pojo.common.ryxgxxwh.JgbEntity;
import com.incon.pojo.common.ryxgxxwh.MzbEntity;
import com.incon.pojo.common.ryxgxxwh.XbbEntity;
import com.incon.pojo.common.ryxgxxwh.ZzmmbEntity;
/**
 * 
 * @类名：  com.incon.project.common.xsgl.service.XsglService
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
public interface XsglService extends CommService{
	//查询学生列表
	public List<XsxxbEntity> queryXsList();
	//查询院系列表
	public List<YxdmbEntity> queryYxList(UserEntity userEntity);
	//查询院系列表
	public List<YxdmbEntity> queryYxList2();
	//查询专业列表
	public List<ZybEntity> queryZyList(String yxdm);
	//添加学生
	public void addXs(XsxxbEntity xsxxbEntity);
	//添加学生
	public void addXzxs(List<XsxxbEntity> list);
	//添加学生
	public void addXzxs1(XsxxbEntity list);
	//根据角色代码查询角色
	public XsxxbEntity queryXsByXh(String xh);
	//根据学号修改学生
	public void updXsByXh(XsxxbEntity xsxxbEntity);
	//删除学生
	public void delXs(String[] ids);
	//查询xh是否重复
	public Integer queryByXhCount(String xh);
	//查询xh在登录表中是否存在
	public Integer queryByXhCount2(String xh);
	//查询性别
	public List<XbbEntity> queryXb();
	//查询籍贯
	public List<JgbEntity> queryJg();
	//查询民族
	public List<MzbEntity> queryMz();
	//查询政治面貌
	public List<ZzmmbEntity> queryZzmm();
	//查询班级
	public List<BjbEntity> queryBjList(String zydm);
	//根据学院查询系
	public List<YxdmbEntity> queryXList(String yxdm);
	//查询院是否为管理院系
	public YxdmbEntity querySfglbm(YxdmbEntity yxdmbEntity);
	//查询专业列表
	public List<ZybEntity> queryZyListByY(String xydm);
	//根据系查询专业
	public List<ZybEntity> queryZyListByX(String xydm);
	//查询班级
	public List<BjbEntity> queryBjList2(String zydm);
	public UserEntity queryUser(UserEntity userEntity);
	public boolean impPyfa(HSSFWorkbook workbook,UserEntity userEntity);
	public String queryOneXsxxbByXh(String xh);
	public void addBathXsxx(XsxxbEntity entity);
	public void updBathXsxx(XsxxbEntity entity);
	//导入
	public Map impXsxx( HSSFWorkbook workbook);
	//查询学生的tree
	public List<XsxxbEntity> queryYxByZyTree(XsxxbEntity entity);
	//导入学生
	public void addorupdXs(XsxxbEntity entity);
	public List<XsxxbEntity> queryAllXsxx(String ids);
	
	//查询全部年级
	public List<XsxxbEntity> qyeryAllNj();
	//查询符合年级条件的  数据
	public List<XsxxbEntity> queryAllXsxxByNj(String nj);
	public Integer queryByPtXhCount(String xh);
	public void addPtXsxx(XsxxbEntity entity);
	public void updPtXsxx(XsxxbEntity entity);
}
