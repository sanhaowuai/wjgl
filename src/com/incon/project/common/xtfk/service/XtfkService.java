package com.incon.project.common.xtfk.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.XtfkbEntity;

/**
 * 
 * @类名：  com.incon.project.common.xtfk.service.XtfkService
 * @创建人：于洋
 * @日期： 2013-5-6
 * @修改人：
 * @日期：
 * @描述：  系统反馈接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface XtfkService extends CommService{
	//删除角色
	public void delFk(String[] ids);
	
	//修改处理标志
	public void updClbz(XtfkbEntity xtfkEntity);
	
	//查询反馈详细信息
	public XtfkbEntity queryFknrByDm(String dm);

	public List qeuryXtfklbb();

	public void addFk(XtfkbEntity xtfkbEntity);

	public void updSfzd(XtfkbEntity xtfkEntity);

	public void updFk(XtfkbEntity xtfkEntity);

	public void addFk_user(XtfkbEntity xtfkbEntity);

	void updFk_user(XtfkbEntity xtfkEntity);
}
