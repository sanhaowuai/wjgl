package com.incon.common.dmbwh.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;


@SuppressWarnings("all")
@Service(value="dmbwhService")
/**
 * 代码表维护
 * 赵恒
 * 2016年12月2日
 */
public class DmbwhServiceImpl extends CommServiceImpl implements DmbwhService{

	@Override
	public int queryByTableName(String tablename) {
		return (Integer)dbDao.queryForObject("dmbwh.queryByTableName",tablename);
	}

	@Override
	public String delDmbwh(String[] ids) {
		String res = "0";
		try{
			for(int i=0;i<ids.length;i++){
				dbDao.delete("dmbwh.delDmbwh", ids[i]);
			}
			res = "1";
		}catch(Exception e){
			res = "0";
			e.printStackTrace();		
		}
		return res;
	}

	@Override
	public int queryTabExist(String tablename) {
		return (Integer)dbDao.queryForObject("dmbwh.queryTabExist", tablename);
	}

	@Override
	public int queryColExist(Map<String, String> map) {
		return (Integer)dbDao.queryForObject("dmbwh.queryColExist", map);
	}

}
