package com.incon.project.common.grb.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.QxbEntity;
import com.incon.pojo.common.grb.GrbEntity;

@SuppressWarnings("all")
@Service(value="grbService")
public class GrbServiceImpl extends CommServiceImpl implements GrbService {

	

	@Override
	public List<GrbEntity> queryGrbcd(String yhdm) {
		// TODO Auto-generated method stub
		return dbDao.query("grb.queryGrbcd", yhdm);
	}

	@Override
	public List<QxbEntity> queryQxb() {
		// TODO Auto-generated method stub
		return dbDao.query("grb.queryQxb");
	}

	@Override
	public List<Map<String, String>> queryQx(Map xxMap) {
		// TODO Auto-generated method stub
		//查询当前登陆用户在人员权限表里是否有记录
		Integer sf=(Integer)dbDao.queryForObject("grb.queryQxZt", xxMap);
		if(sf>0){
			return dbDao.query("grb.queryRyjsQx", xxMap);
		}else{
			return dbDao.query("grb.queryJsQx", xxMap);
		}		
	}

	@Override
	@Transactional
	@MethodLog(description="添加个人菜单")
	public void addGrbCd(String id, String idd, String fid, String yhdm,
			Integer jsdm) {
		// TODO Auto-generated method stub
		GrbEntity entity=new GrbEntity();
		entity.setYhdm(yhdm);
		entity.setJsdm(jsdm.toString());
		
		
		String[] qxdm = id.split(",");//页面选中的值
		String[] fqxdm = fid.split(",");//按钮的所属菜单
		String[] sfzxj = idd.split(",");//1是权限2是按钮
		
		dbDao.delete("grb.delGrbsj", entity);
		
		if((qxdm != null && qxdm.length>0 && qxdm.length==sfzxj.length && qxdm.length == fqxdm.length)){
			for(int i=0;i<qxdm.length;i++){
				if((sfzxj[i] != null && !sfzxj[i].trim().equals("")) && (qxdm[i] != null && !qxdm[i].trim().equals(""))){
					entity.setQxdm(qxdm[i]);
					if(sfzxj[i].equals("1")){
						System.out.println("1111");
						dbDao.insert("grb.addGrbCd", entity);
					}					
				}
			}
		}
		
	}

	@Override
	public void delGrb(String[] ids) {
		// TODO Auto-generated method stub
		dbDao.executeBatchOperation("grb.delGrb", Arrays.asList(ids), "delete");
	}

	@Override
	public void adBcsx(List<GrbEntity> list) {
		// TODO Auto-generated method stub
		dbDao.executeBatchOperation("grb.updBcsx", list, "update");
	}

	
}
