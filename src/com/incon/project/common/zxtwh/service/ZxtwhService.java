package com.incon.project.common.zxtwh.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.zxtwh.ZxtwhEntity;
import com.incon.project.common.zxtwh.page.ZxtwhJsqxPage;
import com.incon.project.common.zxtwh.page.ZxtwhRyjsqxPage;


@SuppressWarnings("all")
public interface ZxtwhService extends CommService{

	void addZxtwh(ZxtwhEntity entity);

	void UpdZxtwh(ZxtwhEntity entity);

	ZxtwhEntity queryZxtwhOne(String dm);

	void delZxtwh(String[] ids);

	List<ZxtwhEntity> queryZxtqx(ZxtwhJsqxPage page);

	void addJsZxtsq(String jsdm, String[] ids,String pxtmc);

	List<ZxtwhEntity> queryRyjsZxtqx(ZxtwhRyjsqxPage page);

	void addRyjsZxtsq(String[] ids, String jsdm, String yhdm);

	String checkXtdm(String xtdm);

}
