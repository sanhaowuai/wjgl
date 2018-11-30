package com.incon.project.common.gzlgwgl.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;











import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.HelpbEntity;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.JsqxbEntity;
import com.incon.pojo.common.QxEntity;
import com.incon.pojo.common.RyjsqxbEntity;
import com.incon.pojo.common.gzlgwgl.GzlgwglEntity;
import com.incon.pojo.common.gzlgwgl.RygwglEntity;

/**
 * 
 * @类名：  com.incon.project.common.qxcdgl.service.QxcdglServiceImpl
 * @创建人： 李旭	
 * @日期： 2018-2-2
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value= "gzlgwglService")
public class GzlgwglServiceImpl extends CommServiceImpl implements GzlgwglService {
	
	
	//查询岗位
	@Override
	public List<GzlgwglEntity> queryGzlgwgl(){
		return dbDao.query("gzlgwgl.queryGzlgwgl");
	}
	
	//查询岗位名称
		@Override
		public List<GzlgwglEntity> queryGWcdgl(){
			return dbDao.query("gzlgwgl.queryGWcdgl");
		}
		
		//查询岗位名称
				@Override
				public List<GzlgwglEntity> queryGWcdglry(){
					return dbDao.query("gzlgwgl.queryGWcdglry");
				}
		
		//添加岗位
		@Override
		@Transactional
		@MethodLog(description="添加岗位")
		public void addGzlgwgl(GzlgwglEntity gzlgwglEntity){
			 dbDao.insert("gzlgwgl.addGzlgwgl",gzlgwglEntity);
		}
		
		
		//根据岗位代码查询岗位
		@Override
		public GzlgwglEntity queryByGwdm(String gwdm){
			return (GzlgwglEntity) dbDao.queryForObject("gzlgwgl.queryByGwdm",gwdm);
		}
		
		//根据权限代码修改权限
		@Override
		
		public void updGwcd(GzlgwglEntity gzlgwglEntity){
			dbDao.update("gzlgwgl.updGwcd",gzlgwglEntity);
		}
		
		
		//删除权限菜单
		@Override
		public void delGw(Map map){
			dbDao.delete("gzlgwgl.delGw",map);
		}
		
		//添加岗位
				@Override
				@Transactional
				@MethodLog(description="添加人员岗位")
				public void addRygwgl(RygwglEntity rygwglEntity){
					 dbDao.insert("gzlgwgl.addRygwgl",rygwglEntity);
				}
				
	 //根据岗位代码查询岗位
	  @Override
	  public RygwglEntity queryRygwdm(String rygwdm){
			return (RygwglEntity) dbDao.queryForObject("gzlgwgl.queryRygwdm",rygwdm);
		}
	//根据权限代码修改权限
			@Override
			
			public void updRycd(RygwglEntity rygwglEntity){
				dbDao.update("gzlgwgl.updRycd",rygwglEntity);
			}
			
			//删除教师
			@Transactional
			@Override
			@MethodLog(description="删除人员岗位")
			public void delRy(String[] ids){
				dbDao.executeBatchOperation("gzlgwgl.delRy", Arrays.asList(ids), "delete");
			}
			
			//修改菜单时，判断访问路径是否存在
			@Override
			public Integer queryRyyz(RygwglEntity rygwglEntity){
				return (Integer)this.dbDao.queryForObject("gzlgwgl.queryRyyz", rygwglEntity);
			}

}
