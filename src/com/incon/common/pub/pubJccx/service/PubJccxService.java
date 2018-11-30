package com.incon.common.pub.pubJccx.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.ryxgxxwh.JgbEntity;
import com.incon.pojo.common.ryxgxxwh.MzbEntity;
import com.incon.pojo.common.ryxgxxwh.WhcdbEntity;
import com.incon.pojo.common.ryxgxxwh.XbbEntity;
import com.incon.pojo.common.ryxgxxwh.XlbEntity;
import com.incon.pojo.common.ryxgxxwh.XwbEntity;
import com.incon.pojo.common.ryxgxxwh.XzjbbEntity;
import com.incon.pojo.common.ryxgxxwh.ZcbEntity;
import com.incon.pojo.common.ryxgxxwh.ZzmmbEntity;

public interface PubJccxService extends CommService{

	//性别
	public List<XbbEntity> queryXb();
	//籍贯
	public List<JgbEntity> queryJg();
	//民族
	public List<MzbEntity> queryMz();
	//文化程度
	public List<WhcdbEntity> queryWhcd();
	//学历
	public List<XlbEntity> queryXl();
	//学位
	public List<XwbEntity> queryXw();
	//行政级别
	public List<XzjbbEntity> queryXzjb();
	//职称
	public List<ZcbEntity> queryZc();
	//政治面貌
	public List<ZzmmbEntity> queryZzmm();
}
