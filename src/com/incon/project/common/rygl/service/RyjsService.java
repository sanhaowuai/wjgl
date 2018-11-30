package com.incon.project.common.rygl.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.JyssjqxbEntity;
import com.incon.pojo.common.RyjsbEntity;
import com.incon.pojo.common.SjqxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.jcxgxxwh.JysbEntity;
import com.incon.pojo.common.jcxgxxwh.JyslxbEntity;
import com.incon.project.common.rygl.page.JysQxPage;

/**
 * 
 * @类名：  com.incon.project.common.rygl.service.RyjsService
 * @创建人：樊旭
 * @日期： 2013-3-17
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
public interface RyjsService extends CommService {
	//查询登录用户的管理院系
	public String queryGlyx(String yhdm);
	//查询所有角色
	public List<JsbEntity> queryJsb();
	//角色授权
	//public List<Map<String,String>> queryQx(RyjsbEntity ryjsbEntity);
	public List<Map<String,String>> queryQx(Map map);
	//更改管理级别
	public int updGljb(RyjsbEntity ryjsbEntity);
	//更改默认角色
	public void changeMrjs(UserEntity userEntity);
	//添加权限
	void addQx(String jsdm, String yhdm, String id, String idd, String fid,
			String cjr, String sfcjgly, UserEntity user);
	//查询数据权限表
	public List<SjqxbEntity> querySjqx(SjqxbEntity sjqxbEntity);
	//添加数据权限
	public void addSjqx(SjqxbEntity sjqxbEntity);
	//查询角色
	public List<RyjsbEntity> queryJs(RyjsbEntity ryjsbEntity);
	//添加人员角色
	public void addJs(RyjsbEntity ryjsbEntity);
	//查询已选教研室
	public List<JysbEntity> queryJyxYx(JysQxPage jysQxPage);
	//添加教研室人员数据权限
	public void addJysSjqx(JyssjqxbEntity jyssjqxbEntity);
	//查询具体用户的教研室
	public List<HashMap<String, String>> queryJysAll(Map map);

	public UserEntity queryUser(UserEntity userEntity);


}
