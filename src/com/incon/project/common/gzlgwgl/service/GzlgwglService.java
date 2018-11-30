package com.incon.project.common.gzlgwgl.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.HelpbEntity;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.JsqxbEntity;
import com.incon.pojo.common.QxEntity;
import com.incon.pojo.common.RyjsqxbEntity;
import com.incon.pojo.common.gzlgwgl.GzlgwglEntity;
import com.incon.pojo.common.gzlgwgl.RygwglEntity;

/**
 * 
 * @类名：  com.incon.project.common.qxcdgl.service.QxcdglService
 * @创建人：李旭
 * @日期： 2018-2-2
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
public interface GzlgwglService extends CommService {
	
	public List<GzlgwglEntity> queryGzlgwgl();
	
	//查询岗位名称
		public List<GzlgwglEntity> queryGWcdgl();
		
		//查询岗位名称(人员)
				public List<GzlgwglEntity> queryGWcdglry();
		
		//添加岗位
		public void addGzlgwgl(GzlgwglEntity gzlgwglEntity);
		
		//根据岗位代码查询岗位
		public GzlgwglEntity queryByGwdm(String gwdm);
		
		//根据岗位代码修改岗位
		public void updGwcd(GzlgwglEntity gzlgwglEntity);
		
		//删除岗位
		public void delGw(Map map);
		
		//添加人员岗位
		public void addRygwgl(RygwglEntity rygwglEntity);
		
		
		//根据岗位代码查询岗位
		public RygwglEntity queryRygwdm(String rygwdm);
		
		//根据岗位代码修改岗位
		public void updRycd(RygwglEntity rygwglEntity);
		
		//删除教师
		public void delRy(String[] ids);
		
		//修改菜单时，判断访问路径是否存在
		public Integer queryRyyz(RygwglEntity rygwglEntity);
}
