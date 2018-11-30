package com.incon.project.common.wdlw.service;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.LwcjEntity;
import com.incon.pojo.common.LwdbTimeAddrEntity;
import com.incon.pojo.common.LwxxEntity;
import com.incon.pojo.common.XtxxEntity;
/**
 * 
 * @类名：  com.incon.project.common.xsgl.service.XsglService
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
public interface WdlwService extends CommService{
	//查询学生列表
	public XtxxEntity queryXtInfo(String userCode);
	
	public LwxxEntity queryLwInfo(String userCode);

	public void updateLunwenStatus(LwxxEntity lwxxEntity);
	
	public LwdbTimeAddrEntity queryDabianTimeAddr(LwxxEntity lwxxEntity);
	
	public LwcjEntity queryDabianChengji(LwxxEntity lwxxEntity);
}
