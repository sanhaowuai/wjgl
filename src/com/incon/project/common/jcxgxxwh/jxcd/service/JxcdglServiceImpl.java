package com.incon.project.common.jcxgxxwh.jxcd.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.jcxgxxwh.CdlbbEntity;
import com.incon.pojo.common.jcxgxxwh.JxcdbEntity;
import com.incon.pojo.common.jcxgxxwh.JxlbEntity;
import com.incon.pojo.common.jcxgxxwh.XiaoqubEntity;



/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.jxcd.service.JxcdglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：教学场地接口的实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="jxcdglService")
public class JxcdglServiceImpl extends CommServiceImpl implements JxcdglService{

	//增加教学场地
	@Override
	@MethodLog(description="增加教学场地")
	public void addJxcd(JxcdbEntity jxcdbEntity) {
		dbDao.insert("jxcdgl.addJxcd", jxcdbEntity);

	}
	//删除教学场地
	@Transactional
	@Override
	@MethodLog(description="删除教学场地")
	public void delJxcd(String[] ids) {
		dbDao.executeBatchOperation("jxcdgl.delJxcd", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("jxcdgl.queryByDmCount", dm)));
	}
	//查询教学场地列表
	@Override
	public List<JxcdbEntity> queryJxcdList() {
		
		return dbDao.query("jxcdgl.queryJxcdList");
	}
	
	//查询场地类别列表
	@Override
	public List<CdlbbEntity> queryCdlb(){
		return dbDao.query("jxcdgl.queryCdlb");
	}
	
	//修改教学场地
	@Override
	@MethodLog(description="根据代码修改教学场地")
	public void updJxcd(JxcdbEntity jxcdbEntity) {
		dbDao.update("jxcdgl.updJxcd", jxcdbEntity);

	}
	//根据代码查询专业类别
	@Override
	public JxcdbEntity queryJxcdByDm(String dm) {
		
		return (JxcdbEntity) dbDao.queryForObject("jxcdgl.queryJxcdByDm", dm);
	}
	@Override
	public List<XiaoqubEntity> queryXiaoquList() {
		
		return dbDao.query("jxcdgl.queryXiaoquList");
	}
	@Override
	public List<JxlbEntity> queryJxlList(String yxdm) {
		
		return dbDao.query("jxcdgl.queryJxlList",yxdm);
	}
	//查询院系
	@Override
	public List<YxdmbEntity> queryYx(JxcdbEntity jxcdbEntity){
		List<YxdmbEntity> list1 = dbDao.query("jxcdgl.queryYx",jxcdbEntity);
		if(jxcdbEntity.getSybm() != null){
			List<String> list = Arrays.asList(jxcdbEntity.getSybm().split(","));
			for (int i = 0; i < list1.size(); i++) {
				if(list.contains(list1.get(i).getYxdm())){
					list1.get(i).setChecked("true");
				}else{
					list1.get(i).setChecked("false");
				}
			}
		}else{
			for (int i = 0; i < list1.size(); i++) {
				list1.get(i).setChecked("false");
			}
		}
		return list1;
	}
	
	//修改教学场地的使用部门
	@Override
	@MethodLog(description="修改教学场地的使用部门!!")
	public void updSybm(String dm,String obj){
		JxcdbEntity jxcdbEntity = new JxcdbEntity();
		jxcdbEntity.setDm(dm);
		jxcdbEntity.setSybm(obj);
		dbDao.update("jxcdgl.updSybm",jxcdbEntity);
	}
}
