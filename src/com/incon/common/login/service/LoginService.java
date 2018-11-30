package com.incon.common.login.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XtfkbEntity;

/**
 * @类名：com.incon.common.login.service.LoginService
 * @作者：于洋
 * @时间：2014-3-10
 * @版本：
 * @描述：登录service
 * @修改人员：
 * @修改时间：
 * @修改说明：
 */
public interface LoginService extends CommService{
	//登录
	public UserEntity yhLogin(Map<String,String> map);
	
	//查询用户角色
	public List<JsbEntity> getRyjsb(UserEntity userEntity);
	
	//一级菜单
	public List<Map> getFatherOrder(UserEntity userEntity);
	
	//二级菜单
	public List<Map> getOrder(UserEntity userEntity);
	
	//二级菜单main_02专用
	public List<Map> getOrderMain02(UserEntity userEntity);
	
	//修改密码前查询密码输入是否正确
	public Integer getDlbToMm(UserEntity userEntity);
	
	//修改密码
	public void updMm(UserEntity userEntity);
	
	//三级菜单1main_06专用
	public List<Map> getOrder1Main06(UserEntity userEntity);
	
	//三级菜单2main_06专用
	public List<Map> getOrder2Main06(UserEntity userEntity);
	


	List<HashMap> queryRyjsanb(UserEntity userEntity);

	List<HashMap> queryJsanb(UserEntity userEntity);

	List<HashMap> queryRyjsqxb(UserEntity userEntity);

	List<HashMap> queryJsqxb(UserEntity userEntity);

	List<Map> checkCdqx(UserEntity userEntity);

	List<Map> checkAnqx(UserEntity userEntity);

	HashMap getOneAn(String fwlj);

	HashMap getOneCd(String fwlj);

	UserEntity casYhLogin(Map<String, String> map);

	HashMap queryCsb(String csdm);

	List<HashMap> getAllCd(String fwlj);
}
