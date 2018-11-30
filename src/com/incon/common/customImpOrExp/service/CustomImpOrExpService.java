package com.incon.common.customImpOrExp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.incon.common.customImpOrExp.page.CustomImpOrExpEntity;
import com.incon.common.customImpOrExp.page.ImpColCheckEntity;
import com.incon.common.customImpOrExp.page.ImpColEntity;
import com.incon.common.customImpOrExp.page.JsEntity;
import com.incon.common.customImpOrExp.page.TabColumnsEntity;
import com.incon.framework.service.CommService;

public interface CustomImpOrExpService extends CommService{

	List<JsEntity> queryJsList();

	int saveMbxx(CustomImpOrExpEntity customImpOrExp);

	JsEntity queryJsEntity(String jsdm);

	CustomImpOrExpEntity queryMbxxById(String id);

	List<TabColumnsEntity> queryTabColumnsByTabName(String tablename);

	List<ImpColEntity> queryImpColList(String id);

	int saveImpcol(Map map, String[] columnEn, String[] columnZh,String[] columnCd,String[] columnLx,
			String impColMesg, String[] dmbmc);

	List<ImpColEntity> queryImpColById(Map cxMap);

	List<ImpColEntity> queryImpZjColList(String curid);

	List<ImpColCheckEntity> queryImpColCheckList();

	ImpColEntity queryImpColByEnAndTabId(Map jymap);

	ImpColCheckEntity queryImpChkBytblName(String dmbmc);

	String querySfczdmb(Map zdmap);

	void saveImpMesg(Map impMap);

	String querydmbfhz(String dmbmc,String dm,String mc,String imporVal);

	void updateImpMesg(Map impMap);

	String delCustomImp(String[] ids);

	List<ImpColEntity> queryTabColsByTabName(Map map);

	List<HashMap<String, String>> queryById(String id);

	List<ImpColEntity> queryCurImpColList(String tablename, String id);


}
