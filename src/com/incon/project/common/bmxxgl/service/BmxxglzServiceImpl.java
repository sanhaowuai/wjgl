package com.incon.project.common.bmxxgl.service;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.common.upload.service.UploadService;
import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.FjbEntity;
import com.incon.pojo.common.XxfbbEntity;

@Service("bmxxglService")
public class BmxxglzServiceImpl extends CommServiceImpl  implements BmxxglService{
	@Resource(name="uploadService")
	private UploadService uploadService;

	@Override
	public XxfbbEntity queryOneXxfb(String xxid) {
		return (XxfbbEntity)dbDao.queryForObject("bmxxgl.queryOneXxfb",xxid);
	}

	@Override
	public void addXxfbHzb(Map<String, String> map) {
		dbDao.insert("bmxxgl.addXxfbHzb", map);
	}

	@Override
	public FjbEntity queryFjByFjbh(String fjbh) {
		return (FjbEntity)dbDao.queryForObject("bmxxgl.queryFjByFjbh", fjbh);
	}
	public List<FjbEntity> queryFj(String GLB,String GLZJ,String GLZJZ) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("GLB", GLB); 		//表名
		map.put("GLZJ", GLZJ); 		//关联主键
		map.put("GLZJZ", GLZJZ); 	//关联主键值
		return dbDao.query("bmxxgl.queryFj", map);
	}
	
	
	/**
	 * xxfbbEntity 信息实体
	 * yhdm  登录人代码，上传附件用
	 * qfjs
	 * hfjs
	 * del_fjs  附件三个参数，可不传
	 */
	@Override
	@Transactional
	public void addGg(XxfbbEntity xxfbbEntity,String yhdm,String [] qfjs,String[]   hfjs,String [] del_fjs) {
		dbDao.insert("bmxxgl.addGg", xxfbbEntity);
		uploadService.addFj("bmxxgl", "PT_XT_XXFB", "XXID", yhdm, xxfbbEntity.getXxid(), qfjs, hfjs, del_fjs);
		//   查询附件表  更新 '是否有附件' 标志位
		dbDao.update("bmxxgl.updateSfyfj",xxfbbEntity.getXxid());
		//bmxxService.updSfyfj(xxid);
	
	}
	//修改
	@Override
	@Transactional
	//@MethodLog(description="修改通知公告")
	public void updGg(XxfbbEntity xxfbbEntity,String yhdm,String [] qfjs,String[]   hfjs,String [] del_fjs) {
		dbDao.update("bmxxgl.updateGg", xxfbbEntity);
		uploadService.addFj("bmxxgl", "PT_XT_XXFB", "XXID", yhdm, xxfbbEntity.getXxid(), qfjs, hfjs, del_fjs);
		//   查询附件表  更新 '是否有附件' 标志位
		dbDao.update("bmxxgl.updateSfyfj",xxfbbEntity.getXxid());
	}
	@Override
	@MethodLog(description="删除通知公告")
	public void delGg(String[] ids) {
		dbDao.executeBatchOperation("bmxxgl.deleteGg", Arrays.asList(ids), "delete");
	}
	//  查询附件表  更新 '是否有附件' 标志位
	@Override
	public void updSfyfj(String xxid) {
		dbDao.update("bmxxgl.updateSfyfj",xxid);
	}
	@Override
	public String queryXwid() {
		// TODO Auto-generated method stub
		return dbDao.queryForObject("bmxxgl.queryXwid", null).toString();
	}
 
	@Override
	public void updateGgSffb(String xxid) {
		// TODO Auto-generated method stub
		dbDao.update("bmxxgl.updateGgSffb",xxid);
	}
	@Override
	public List<HashMap<String, String>> queryLb() {
		// TODO Auto-generated method stub
		return dbDao.query("bmxxgl.queryLb");
	}

	@Override
	public void yxxxbc(XxfbbEntity xxfbbEntity) {
		// TODO Auto-generated method stub
		dbDao.insert("bmxxgl.addGg", xxfbbEntity);
	}

}

