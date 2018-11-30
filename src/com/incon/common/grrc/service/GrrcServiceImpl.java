package com.incon.common.grrc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.incon.common.grrc.page.GrrcEntity;
import com.incon.common.grrc.service.GrrcService;
import com.incon.framework.service.impl.CommServiceImpl;
@Service(value= "grrcService")
public class GrrcServiceImpl extends CommServiceImpl implements GrrcService{
	@Override
	public List<GrrcEntity> queryGrrcJson(GrrcEntity p) {
		return dbDao.query("grrc.queryGrrcJson", p);
	}
	@Override
	public GrrcEntity querySinGrrc(GrrcEntity p) {
		return (GrrcEntity) dbDao.queryForObject("grrc.querySinGrrc", p);
	}
	@Override
	public Integer delSinGrrc(GrrcEntity p){
		return dbDao.delete("grrc.delSinGrrc", p);
	}
	@Override
	public Integer updShumitSinGrrc(GrrcEntity p){
		return dbDao.delete("grrc.updShumitSinGrrc", p);
	}	
	@Override
	public Integer addShumitSinGrrc(GrrcEntity p){
		return dbDao.delete("grrc.addShumitSinGrrc", p);
	}	
}
