package com.incon.project.common.yxzygl.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;

/**
 * 
 * @类名：  com.incon.project.common.zygl.service.ZyglService
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
public interface YxZyglService extends CommService{

	public List<ZybEntity> queryZy();

	public List<Map> queryPubYxList(Map yxMap);

	public void delZy(String[] ids);

	public void addYxZy(ZybEntity zybEntity);

	Integer updYxzyKyf(ZybEntity zybEntity);

}
