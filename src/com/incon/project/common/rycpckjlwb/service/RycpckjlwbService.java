package com.incon.project.common.rycpckjlwb.service;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.rycpckjlwb.RycpckjlwbEntity;

@SuppressWarnings("all")
public interface RycpckjlwbService extends CommService {

	public RycpckjlwbEntity queryRycpckjlwbOne(String yhdm,String yylx);

	public void addRycpckjlwb(RycpckjlwbEntity entity);

	public void updRycpckjlwb(RycpckjlwbEntity entity);

	public void delRycpckjlwb(String yhdm,String yylx);

	public int isExFAdd(RycpckjlwbEntity entity);

}
