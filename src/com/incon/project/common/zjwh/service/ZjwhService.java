package com.incon.project.common.zjwh.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.zjwh.JszjbEntity;
import com.incon.pojo.common.zjwh.ZjwhEntity;
import com.incon.project.common.zjwh.page.ZjwhJsqxPage;
import com.incon.project.common.zjwh.page.ZjwhRyjsqxPage;
/**
 * 
 * @类名： com.incon.project.common.zjwh.service.ZjwhService
 * @修改人：
 * @日期：
 * @描述：  组件维护
 * @版本号：
 */
@SuppressWarnings("all")
public interface ZjwhService extends CommService {

	public void addZjwh(ZjwhEntity entity);

	public void UpdZjwh(ZjwhEntity entity);

	public ZjwhEntity queryZjwhOne(String zjdm);

	public void delZjwh(String[] ids);

	public List<ZjwhEntity> queryZjqx();

	public void addJsZjsq(String jsdm,String ids[],String qxlb,String pzjmc);

	public void delJsZjsq(String jsdm,String qxlb);

	public void delRyjsZjsq(String jsdm, String yhdm,String qxlb);

	public void addRyjsZjsq(String[] ids,String jsdm,String yhdm,String qxlb);

	public List<ZjwhEntity> queryZjwhJsqx(ZjwhJsqxPage page);

	public List<ZjwhEntity> queryRyjsZjqx(ZjwhRyjsqxPage page);

	

	
}
