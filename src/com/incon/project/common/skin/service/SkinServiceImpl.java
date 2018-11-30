package com.incon.project.common.skin.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.JsqxbEntity;
import com.incon.pojo.common.RzEntity;
import com.incon.pojo.common.ZxtbEntity;
import com.incon.pojo.common.shoujcd.PtappqxbEntity;
/**
 * 
 * @类名：  com.incon.project.common.shoujcd.service
 * @创建人：赵玥
 * @日期： 2016-09-01
 * @修改人：
 * @日期：
 * @描述：  手机菜单授权
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value= "skinService")
public class SkinServiceImpl extends CommServiceImpl implements SkinService {

	@Override
	public void updateUserSkin(Map<String, String> map) {
		dbDao.update("skin.updateUserSkin",map);
	}
	
	@Override
	public void saveUserSkin(Map<String, String> map) {
		dbDao.insert("skin.saveUserSkin",map);
	}

	@Override
	public Map<String, String> querySkin(Map<String, String> map) {
		
		return (Map<String, String>)dbDao.queryForObject("skin.querySkin", map);
	}

	@Override
	public int querySkinSfyy(Map<String, String> map) {
		
		return (Integer)dbDao.queryForObject("skin.querySkinSfyy", map);
	}

	@Override
	public void updateUserSkin1(Map<String, String> map) {
		dbDao.update("skin.updateUserSkin1",map);
		
	}

	@Override
	public void saveUserSkin1(Map<String, String> map) {
		dbDao.insert("skin.saveUserSkin1",map);
		
	}

	@Override
	public Map<String, String> querySkinUsed(Map<String, String> map) {
		return (Map<String, String>)dbDao.queryForObject("skin.querySkinUsed", map);
	}

	@Override
	public void chooseSkin(Map<String, String> map) {
		dbDao.delete("skin.celchooseSkin", map);
		dbDao.insert("skin.chooseSkin", map);
	}

	@Override
	public void deleteSkin(String[] ids) {
		String skinId;
		for (int i = 0; i < ids.length; i++) {
			skinId=ids[i];
			dbDao.delete("skin.deleteSkin", skinId);
		}
	}

	@Override
	public void redefault(Map<String, String> map) {
		dbDao.delete("skin.celchooseSkin", map);
	}

	@Override
	public Map<String, String> querySkinForUp(Map<String, String> map) {
		return (Map<String, String>)dbDao.queryForObject("skin.querySkinForUp", map);
	}

	@Override
	public void updateSkinModel(Map<String, String> map) {
		dbDao.update("skin.updateSkinModel", map);
		
	}

	@Override
	public void saveSkinModel(Map<String, String> map) {
		dbDao.insert("skin.saveSkinModel", map);
		
	}

	@Override
	public void chooseSkin00(Map<String, String> map) {
		dbDao.delete("skin.celchooseSkin00", map);
		dbDao.insert("skin.chooseSkin00", map);
	}

	
	@Override
	public Map<String, String> querySkinUsed00(Map<String, String> map) {
		return (Map<String, String>)dbDao.queryForObject("skin.querySkinUsed00", map);
	}
	

}
