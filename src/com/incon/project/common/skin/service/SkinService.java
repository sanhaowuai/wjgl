package com.incon.project.common.skin.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.JsbEntity;
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
public interface SkinService extends CommService {

	public void updateUserSkin(Map<String, String> map);

	public Map<String, String> querySkin(Map<String, String> map);

	public int querySkinSfyy(Map<String, String> map);

	public void saveUserSkin(Map<String, String> map);

	public void updateUserSkin1(Map<String, String> map);

	public void saveUserSkin1(Map<String, String> map);

	public Map<String, String> querySkinUsed(Map<String, String> map);

	public void chooseSkin(Map<String, String> map);

	public void deleteSkin(String[] ids);

	public void redefault(Map<String, String> map);

	public Map<String, String> querySkinForUp(Map<String, String> map);

	public void updateSkinModel(Map<String, String> map);

	public void saveSkinModel(Map<String, String> map);

	public void chooseSkin00(Map<String, String> map);
	
	public Map<String, String> querySkinUsed00(Map<String, String> map);
}
