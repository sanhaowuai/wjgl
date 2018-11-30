package com.incon.common.pub.pubzj.service;

import java.util.List;
import java.util.Map;

import com.incon.pojo.common.QxEntity;
import com.incon.pojo.common.UserEntity;

public interface PubZjService {

	public void saveLayout(List<Map> items, UserEntity userEntity);

	public List<Map> loadLayout(UserEntity userEntity);
	
	public List<Map> ryZjqx(UserEntity userEntity);

	public List<QxEntity> querykjcd(UserEntity userEntity);

	public String querykjcdwz(UserEntity userEntity);

	public List<Map> loadLayoutJsZj(UserEntity userEntity);

	public void saveLayoutJsdm(List<Map> items, UserEntity userEntity);

	public List<Map> ryZjqxJsdm(UserEntity userEntity);
}
