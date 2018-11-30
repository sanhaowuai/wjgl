package com.incon.common.grrc.service;

import java.util.List;

import com.incon.common.grrc.page.GrrcEntity;
import com.incon.framework.service.CommService;

public interface GrrcService extends CommService{
	public List<GrrcEntity> queryGrrcJson(GrrcEntity p);

	public GrrcEntity querySinGrrc(GrrcEntity p);

	public Integer delSinGrrc(GrrcEntity p);

	public Integer addShumitSinGrrc(GrrcEntity p);

	public Integer updShumitSinGrrc(GrrcEntity p);
}
