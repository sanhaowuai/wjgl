package com.incon.common.pub.pubzj.service;

 

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.incon.common.pub.pubYx.service.PubYxService;
import com.incon.common.pub.pubzj.service.PubZjService;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.QxEntity;
import com.incon.pojo.common.UserEntity;
/**
 * @功能    组件布局管理
 * @author 林乐松
 *
 */
@Service(value="pubZjService")
public class PubZjServiceImpl extends CommServiceImpl implements PubZjService{
    /**
     * 组件布局保存
     */
	@Override
	public void saveLayout(List<Map> items , UserEntity  userEntity ) {
		// TODO Auto-generated method stub
		 
		dbDao.delete("PubZj.deleteLayout", userEntity);
		dbDao.executeBatchOperation("PubZj.saveLayout", items, "insert");
		 
	}
  /**
   *  布局加载   
   */
	@Override
	public List<Map> loadLayout(UserEntity userEntity) {
		// TODO Auto-generated method stub
		
		return dbDao.query("PubZj.loadLayout",userEntity);
	}
	
    @Override
    public List<Map> ryZjqx(UserEntity userEntity)
    {
        List<Map> zjMapList = null; // size=0=没有访问按钮权限
        Integer ret = Integer.parseInt(String.valueOf(dbDao.queryForObject(
                "PubZj.getRyjsqxCount", userEntity)));
        if (ret == 0)
        { // 无人员角色权限
        	zjMapList = dbDao.query("PubZj.getkywtjZjb_1", userEntity);
        }
        else
        {
        	zjMapList = dbDao.query("PubZj.getkywtjZjb_2", userEntity);
        }
        return zjMapList;
    }
	@Override
	public List<QxEntity> querykjcd(UserEntity userEntity) {
		// TODO Auto-generated method stub
		return dbDao.query("PubZj.querykjcd", userEntity);
	}

	@Override
	public String querykjcdwz(UserEntity userEntity) {
		// TODO Auto-generated method stub
		return (String)dbDao.queryForObject("PubZj.querykjcdwz", userEntity);
	}
	@Override
	public List<Map> loadLayoutJsZj(UserEntity userEntity) {
		// TODO Auto-generated method stub
		 return dbDao.query("PubZj.loadLayoutJszj",userEntity);
	}
	@Override
	public void saveLayoutJsdm(List<Map> items, UserEntity userEntity) {
		// TODO Auto-generated method stub
		dbDao.delete("PubZj.deleteLayoutJsdm", userEntity);
		dbDao.executeBatchOperation("PubZj.saveLayoutJsdm", items, "insert");
	}
	@Override
	public List<Map> ryZjqxJsdm(UserEntity userEntity) {
		// TODO Auto-generated method stub
        List<Map> zjMapList = null; // size=0=没有访问按钮权限
  
        zjMapList = dbDao.query("PubZj.getkywtjZjb_3", userEntity);
       
       
        return zjMapList;
	}

}
