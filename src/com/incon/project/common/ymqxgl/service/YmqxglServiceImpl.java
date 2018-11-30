package com.incon.project.common.ymqxgl.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.AnbEntity;
import com.incon.pojo.common.QxbEntity;
import com.incon.pojo.common.ZybEntity;
/**
 * 
 * @类名：  com.incon.project.common.ymqxgl.service.YmqxglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-3-12
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value= "ymqxglService")
public class YmqxglServiceImpl extends CommServiceImpl implements YmqxglService{
	//新增按钮
	@Override
	@MethodLog(description="增加按钮")
	public void addAn(AnbEntity anbEntity) {
		dbDao.insert("ymqxgl.addAn", anbEntity);	
	}
	//删除按钮
	@Transactional
	@Override
	@MethodLog(description="删除按钮")
	public void delAn(String[] ids) {
		dbDao.executeBatchOperation("ymqxgl.delAn", Arrays.asList(ids), "delete");
	}
	//查询一个按钮
	@Override
	public AnbEntity queryOneAn(String andm) {
		return (AnbEntity)dbDao.queryForObject("ymqxgl.queryOneAn", andm);
	}
	//修改按钮
	@Override
	@MethodLog(description="根据按钮代码修改按钮")
	public void updAn(AnbEntity anbEntity) {
		dbDao.update("ymqxgl.updAn", anbEntity);
		
	}
	@Override
	public List<AnbEntity> queryQxbToList(AnbEntity anbEntity) {
		
		return dbDao.query("ymqxgl.queryQxb", anbEntity);
	}
	//查询qxdh是否重复
	
	public Integer queryByAndhCount(AnbEntity anbEntity){
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("ymqxgl.queryByAndhCount", anbEntity)));
	}
	/**********按钮功能表 丁起明 20170717*********************************************************************/
	@Transactional
	@Override
	public void updOrAddAngnb(Map m1){
		List<Map<String,String>> data = (List<Map<String, String>>) m1.get("data");
		for(Map<String,String> m : data){
			if(m.get("andm")==null || m.get("andm").trim().equals("")){
				AnbEntity e = new AnbEntity();
				e.setAnmc(m.get("anmc"));
				e.setTitle(m.get("title"));
				e.setFwlj(m.get("fwlj"));
				e.setIcon(m.get("icon"));
				e.setXssx(m.get("xssx"));
				e.setTcfs(m.get("tcfs"));	
				e.setKyf(m.get("kyf"));
				dbDao.insert("ymqxgl.addAngnb", e);
			}else {
				AnbEntity e = new AnbEntity();
				e.setAndm(m.get("andm"));
				e.setAnmc(m.get("anmc"));
				e.setTitle(m.get("title"));
				e.setFwlj(m.get("fwlj"));
				e.setIcon(m.get("icon"));
				e.setXssx(m.get("xssx"));
				e.setTcfs(m.get("tcfs"));		
				e.setKyf(m.get("kyf"));	
				dbDao.insert("ymqxgl.updAngnb", e);
			}
		}
	}
	@Override
	public void delAngnb(String andm){
		dbDao.delete("ymqxgl.delAngnb", andm);
	}
	@Override
	public List<AnbEntity> queryAngnbList(){
		return dbDao.query("ymqxgl.queryAngnbList");
	}
	@Override
	public List<AnbEntity> queryAngnbListOnQy(){
		return dbDao.query("ymqxgl.queryAngnbListOnQy");
	}	
	
	/**********按钮功能表 丁起明 20170717*********************************************************************/	
}
