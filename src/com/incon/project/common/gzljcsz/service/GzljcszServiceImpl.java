package com.incon.project.common.gzljcsz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.gzljcsz.YwDmxlhEntity;
import com.incon.pojo.common.gzljcsz.YwlcBlxlhEnntity;
import com.incon.pojo.common.gzljcsz.YwlcYmxlhEntity;
import com.incon.project.common.gzljcsz.page.FuzhiPage;
import com.incon.project.common.gzljcsz.page.FuzhilcPage;
import com.incon.project.common.gzljcsz.page.YwlcBlPage;
import com.incon.project.common.gzljcsz.page.YwlcdmbPage;

@Service(value="gzljcszService")
public  class GzljcszServiceImpl extends CommServiceImpl  implements GzljcszService  {

	@Override
	public Integer copyYwlcbbh(FuzhiPage fuzhipage) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("new_ywlcbbh", fuzhipage.getNew_ywlcbbh()); 	
		map.put("old_ywlcbbh", fuzhipage.getOld_ywlcbbh()); 		
		map.put("old_xtdm", fuzhipage.getOld_xtdm()); 
		map.put("old_ywlcdm", fuzhipage.getOld_ywlcdm()); 
	
	
		return (Integer) dbDao.insert("gzljcsz.copyywlcbbh", map) ;
	}

	@Override
	public Integer copyYwlc(FuzhilcPage fuzhilcpage) {
		// TODO Auto-generated method stub
		Map<String, String> Fuzhilc = new HashMap<String, String>();	
		Fuzhilc.put("oldr_ywlcbbh", fuzhilcpage.getOldr_ywlcbbh()); 		
		Fuzhilc.put("oldr_xtdm", fuzhilcpage.getOldr_xtdm()); 
		Fuzhilc.put("oldr_ywlcdm", fuzhilcpage.getOldr_ywlcdm()); 
//		Fuzhilc.put("oldr_ywlcmc", fuzhilcpage.getOldr_ywlcmc()); 
		Fuzhilc.put("newr_ywlcdm", fuzhilcpage.getNewr_ywlcdm()); 
//		Fuzhilc.put("newr_ywlcmc", fuzhilcpage.getNewr_ywlcmc()); 	
		Fuzhilc.put("newr_ywlcbbh", fuzhilcpage.getNewr_ywlcbbh()); 	
		
		return (Integer) dbDao.insert("gzljcsz.copyywlc", Fuzhilc) ;
	}

	@Override
	public Integer querypzsfcz(YwlcBlPage ywlcbl) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("gzljcsz.querypzsfcz", ywlcbl);
	}

	@Override
	public Integer querypdslcz(YwlcdmbPage  ywlcdmbPage) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("gzljcsz.querypdslcz",ywlcdmbPage);
	}
	
	@Override
	public Integer querysffgbbh(FuzhiPage fuzhipage) {
		// TODO Auto-generated method stub
		return(Integer) dbDao.queryForObject("gzljcsz.querysffgbbh",fuzhipage);
	}

 
	@Override
	public List<YwlcBlxlhEnntity> queryBlxlh(YwDmxlhEntity ywDmxlhEntity) {
		// TODO Auto-generated method stub
		return dbDao.query("gzljcsz.queryBlxlh",ywDmxlhEntity);
	}
 

 
	@Override
	public  YwDmxlhEntity  queryDmxlh(String id) {
		// TODO Auto-generated method stub
		return (YwDmxlhEntity)dbDao.queryForObject("gzljcsz.queryDmxlh",id);
	}

	@Override
	public List<YwlcYmxlhEntity> queryLcxlh(YwDmxlhEntity ywDmxlhEntity) {
		// TODO Auto-generated method stub
		return dbDao.query("gzljcsz.queryLcxlh",ywDmxlhEntity);
	}

	@Override
	public String queryDmxlhSfcz(YwDmxlhEntity ywDmxlhEntity) {
		// TODO Auto-generated method stub
		return dbDao.queryForObject("gzljcsz.queryDmxlhSfcz", ywDmxlhEntity)==null?"0":dbDao.queryForObject("gzljcsz.queryDmxlhSfcz", ywDmxlhEntity).toString();
	}

	@Override
	@Transactional
	public void addDmxlh(List<YwDmxlhEntity> list) {
		// TODO Auto-generated method stub
		if(list!=null && list.size()>0){
			for(YwDmxlhEntity y:list){
				dbDao.delete("gzljcsz.delDmxlh", y);
				dbDao.insert("gzljcsz.addDmxlh", y);
				List<YwlcYmxlhEntity> listlc=y.getListlc();
				if(listlc!=null && listlc.size()>0){
					for(YwlcYmxlhEntity lc:listlc){
						dbDao.insert("gzljcsz.addLcxlh", lc);
					}
				}
				
				List<YwlcBlxlhEnntity> listbl=y.getListbl();
				if(listbl!=null && listbl.size()>0){
					for(YwlcBlxlhEnntity bl:listbl){
						dbDao.insert("gzljcsz.addBlxlh", bl);
					}
				}
				 
			}
		}
	}

 
	

}
