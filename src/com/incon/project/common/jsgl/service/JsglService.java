package com.incon.project.common.jsgl.service;

import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.JsxxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.jcxgxxwh.JysbEntity;
import com.incon.pojo.common.ryxgxxwh.JgbEntity;
import com.incon.pojo.common.ryxgxxwh.MzbEntity;
import com.incon.pojo.common.ryxgxxwh.WhcdbEntity;
import com.incon.pojo.common.ryxgxxwh.XbbEntity;
import com.incon.pojo.common.ryxgxxwh.XlbEntity;
import com.incon.pojo.common.ryxgxxwh.XwbEntity;
import com.incon.pojo.common.ryxgxxwh.XzjbbEntity;
import com.incon.pojo.common.ryxgxxwh.ZcbEntity;
import com.incon.pojo.common.ryxgxxwh.ZzmmbEntity;

/**
 * 
 * @类名：  com.incon.project.common.jsgl.service.JsglService
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
public interface JsglService extends CommService{

	//查询院系列表
	public List<YxdmbEntity> queryYxList();
	
	//查询教研室
	public List<JysbEntity> queryJysList(String yxdm);
	
	//查询教师列表
	public List<JsxxbEntity> queryJsList();
	//添加教师
	public void addJs(JsxxbEntity jsxxbEntity);
	//添加教师
	public void addXzjs(List<JsxxbEntity> list);
	//修改教师信息
	public void updJs(JsxxbEntity jsxxbEntity);
	//删除教师
	public void delJs(String[] ids);
	public void updKyf(List<JsxxbEntity> list);
	//查询zgh是否重复
	public Integer queryByZghCount(String zgh);
	//查询zgh是否重复
	public Integer queryByZghCount2(String zgh);
	
	//根据职工号查询教师
	public JsxxbEntity queryJsByZgh(String zgh);
	
	//查询学院
	public List<YxdmbEntity> queryYxb();
	//性别表
	public List<XbbEntity> queryXb();
	//籍贯表
	public List<JgbEntity> queryJg();
	//民族表
	public List<MzbEntity> queryMz();
	//文化程度表
	public List<WhcdbEntity> queryWhcd();
	//学历表
	public List<XlbEntity> queryXl();
	//学位表
	public List<XwbEntity> queryXw();
	//行政级别表
	public List<XzjbbEntity> queryXzjb();
	//职称表
	public List<ZcbEntity> queryZc();
	//政治面貌表
	public List<ZzmmbEntity> queryZzmm();
	//根据院查询系
	public List<YxdmbEntity> queryXList(String yxdm);
	//查询院是否为管理院系
	public YxdmbEntity querySfglbm(YxdmbEntity yxdmbEntity);
	//根据院代码查询教研室
	public List<JysbEntity> queryJysListNoGl(String yxdm);
	//根据系代码查询教研室
	public List<JysbEntity> queryJysListNoGlByX(String yxdm);
	//查询教研室数据权限表中是否有数据
	public int queryJyssjqxCount(Map map);
	
	public UserEntity queryUser(UserEntity userEntity);

	public boolean impPyfa(HSSFWorkbook workbook,UserEntity userEntity);
	
	public String queryOneJsxxbByzgh(String zgh);
	
	public void addBathJsxx(JsxxbEntity entity);
	
	public void updBathJsxx(JsxxbEntity entity);
	//导入
	public Map impJsxx( HSSFWorkbook workbook);
	//学院
	public Integer queryYxCount(String dmormc);
	
	public String queryYxDm(String dmormc);
	//专业
	public Integer queryZyCount(String dmormc);
	
	public String queryZyDm(String dmormc);
	//教研室
	public Integer queryJysCount(String dmormc);
	
	public String queryJysDm(String dmormc);
	//性别
	public Integer queryXbCount(String dmormc);
	
	public String queryXbDm(String dmormc);
	//籍贯
	public Integer queryJgCount(String dmormc);
	
	public String queryJgDm(String dmormc);
	//民族
	public Integer queryMzCount(String dmormc);
	
	public String queryMzDm(String dmormc);
	//文化程度
	public Integer queryWhcdCount(String dmormc);
	
	public String queryWhcdDm(String dmormc);
	//学历
	public Integer queryXlCount(String dmormc);
	
	public String queryXlDm(String dmormc);
	//学位
	public Integer queryXwCount(String dmormc);
	
	public String queryXwDm(String dmormc);
	//行政级别
	public Integer queryXzjbCount(String dmormc);
	
	public String queryXzjbDm(String dmormc);
	//职称
	public Integer queryZcCount(String dmormc);
	
	public String queryZcDm(String dmormc);
	//政治面貌
	public Integer queryZzmmCount(String dmormc);
	
	public String queryZzmmDm(String dmormc);
	 //班级
	public Integer queryBjCount(String dmormc);
	
	public String queryBj(String dmormc);
	 
	
	
	
	
	
	//查询是否重复
	public Integer queryByPtZghCount(String zgh);
	//添加‘addPtJsxx
	public void addPtJsxx(JsxxbEntity jsxxbEntity);
	//修改updPtJsxx
	public void updPtJsxx(JsxxbEntity jsxxbEntity);
	
	
	//平台教师  按条件导入教师用  tree
	public List<JsxxbEntity> queryYxByJysTree(JsxxbEntity entity);
	//导入  添加或修改
	public void addorupdJs(JsxxbEntity entity);
	public List<JsxxbEntity> queryAllJsxx(String ids);
	
}
