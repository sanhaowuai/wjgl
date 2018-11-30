package com.incon.common.customImpOrExp.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.incon.common.customImpOrExp.page.CustomImpOrExpEntity;
import com.incon.common.customImpOrExp.page.ImpColCheckEntity;
import com.incon.common.customImpOrExp.page.ImpColEntity;
import com.incon.common.customImpOrExp.page.JsEntity;
import com.incon.common.customImpOrExp.page.TabColumnsEntity;
import com.incon.framework.service.impl.CommServiceImpl;

@SuppressWarnings("all")
@Service(value="customImpOrExpService")
public class CustomImpOrExpServiceImpl extends CommServiceImpl implements CustomImpOrExpService{

	@Override
	public List<JsEntity> queryJsList() {
		 List<JsEntity> jsList = dbDao.query("customImpOrExp.queryJsList");
		return jsList;
	}

	@Override
	public int saveMbxx(CustomImpOrExpEntity customImpOrExp) {
		int rel=1;
		try{
			dbDao.insert("customImpOrExp.saveMbxx", customImpOrExp);
		}catch (Exception e) {
			rel=0;
			e.printStackTrace();
		}
		return rel;
	}

	@Override
	public JsEntity queryJsEntity(String jsdm) {
		Map map = new HashMap();
		map.put("jsdm", jsdm);
		JsEntity js = (JsEntity) dbDao.queryForObject("customImpOrExp.queryJsByJsdm", map);
		return js;
	}

	@Override
	public CustomImpOrExpEntity queryMbxxById(String id) {
		Map map = new HashMap();
		map.put("id", id);
		CustomImpOrExpEntity customImpOrExp = (CustomImpOrExpEntity) dbDao.queryForObject("customImpOrExp.queryMbxxById", map);  
		return customImpOrExp;
	}

	@Override
	public List<TabColumnsEntity> queryTabColumnsByTabName(String tablename) {
		Map map = new HashMap();
		map.put("tablename", tablename);
		List<TabColumnsEntity> tabColumns = dbDao.query("customImpOrExp.queryTabColumnsByTabName", map); 
		return tabColumns;
	}

	@Override
	public List<ImpColEntity> queryImpColList(String id) {
		Map map = new HashMap();
		map.put("id", id);
		List<ImpColEntity> impColList = dbDao.query("customImpOrExp.queryImpColList", map); 
		return impColList;
	}

	@Override
	public int saveImpcol(Map map, String[] columnEn, String[] columnZh,String[] columnCd,String[] columnLx,
			String impColMesg, String[] dmbmc) {
		int rel=1;
		try{
			dbDao.update("customImpOrExp.updateImptab",map);
			dbDao.delete("customImpOrExp.delImpCol", map);
			String[] impMesg = impColMesg.split(",");
			for(int i=0;i<columnEn.length;i++){
				String[] splImpMesg =  impMesg[i].split("\\|");
				ImpColEntity impCol = new ImpColEntity();  
				impCol.setColumn_en(columnEn[i]);
				impCol.setColumn_zh(columnZh[i]);
				impCol.setColumn_cd(columnCd[i]);
				impCol.setColumn_lx(columnLx[i]);
				impCol.setTab_id(map.get("id").toString());
				impCol.setSfzj(splImpMesg[0]);
				impCol.setSfxlzj(splImpMesg[1]);
				if("1".equals(impMesg[i].split("\\|")[1])){
					impCol.setXlmc(splImpMesg[2]);
				}else{
					impCol.setXlmc("");
				}
				System.out.println(dmbmc+"****************");
				if(dmbmc==null || dmbmc.length==0 || dmbmc[i]==null || "".equals(dmbmc[i])){
					impCol.setDmbmc("");
				}else{
					impCol.setDmbmc(dmbmc[i]);
				}
				
				dbDao.insert("customImpOrExp.saveImpCol",impCol);
			}
		}catch (Exception e) {
			rel=0;
			e.printStackTrace();
		}
		return rel;
	}

	@Override
	public List<ImpColEntity> queryImpColById(Map cxMap) {
		List<ImpColEntity> impColList = dbDao.query("customImpOrExp.queryImpColById", cxMap);
		return impColList;
	}

	@Override
	public List<ImpColEntity> queryImpZjColList(String curid) {
		Map map = new HashMap();
		map.put("id", curid);
		List<ImpColEntity> impColList = dbDao.query("customImpOrExp.queryImpZjColList", map);
		return impColList;
	}

	@Override
	public List<ImpColCheckEntity> queryImpColCheckList() {
		List<ImpColCheckEntity> impColCheckList = dbDao.query("customImpOrExp.queryImpColCheck");
		return impColCheckList;
	}

	@Override
	public ImpColEntity queryImpColByEnAndTabId(Map jymap) {
		ImpColEntity imp = (ImpColEntity) dbDao.queryForObject("customImpOrExp.queryImpColByEnAndTabId", jymap);
		return imp;
	}

	@Override
	public ImpColCheckEntity queryImpChkBytblName(String dmbmc) {
		Map map = new HashMap();
		map.put("tablename", dmbmc);
		ImpColCheckEntity impCol = (ImpColCheckEntity) dbDao.queryForObject("customImpOrExp.queryImpChkBytblName", map);
		return impCol;
	}

	@Override
	public String querySfczdmb(Map zdmap) {
		String sfcz = "0";
		String sfczdm="";
		String sfczmc="";
		try{
			sfczdm= (String) dbDao.queryForObject("customImpOrExp.querySfczdm", zdmap);
		    sfczmc = (String) dbDao.queryForObject("customImpOrExp.querySfczmc", zdmap);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		if(!("0".equals(sfczdm)&&"0".equals(sfczmc))){
			sfcz="1";
		}
		return sfcz;
	}

	@Override
	public void saveImpMesg(Map impMap) {
		dbDao.insert("customImpOrExp.saveZdyMesg", impMap);
	}

	@Override
	public String querydmbfhz(String dmbmc,String dm,String mc,String imporVal) {
		Map map = new HashMap();
		map.put("mc", mc);
		map.put("dm", dm);
		map.put("imporVal", imporVal);
		map.put("dmbmc", dmbmc);
		String dmfh = (String) dbDao.queryForObject("customImpOrExp.querydmbfhz", map);
		return dmfh;
	}

	@Override
	public void updateImpMesg(Map impMap) {
		dbDao.insert("customImpOrExp.updateZdyMesg", impMap);
	}

	@Override
	public String delCustomImp(String[] ids) {
		String res = "1";//执行成功
		try{
			dbDao.executeBatchOperation("customImpOrExp.delCustomImp", Arrays.asList(ids), "delete");
			dbDao.executeBatchOperation("customImpOrExp.delCustomImp1", Arrays.asList(ids), "delete");
		}catch(Exception e){
			res = "0";//执行失败
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<ImpColEntity> queryCurImpColList(String tablename,String id) {
		Map map = new HashMap();
		map.put("tableName", tablename);
		map.put("id", id);
		List<ImpColEntity> impcol = (List<ImpColEntity>) dbDao.query("customImpOrExp.queryImpColById", map);
		if(!(null!=impcol && impcol.size()>0)){
			impcol = dbDao.query("customImpOrExp.queryCurImpColList", map);
		}
		return impcol;
	}

	@Override
	public List<ImpColEntity> queryTabColsByTabName(Map map) {
		List<ImpColEntity> tabColumns = dbDao.query("customImpOrExp.queryTabColsByTabName", map);  
		return tabColumns;
	}

	@Override
	public List<HashMap<String, String>> queryById(String id) {
		return dbDao.query("customImpOrExp.queryById",id);
	}
	
	
	

}
