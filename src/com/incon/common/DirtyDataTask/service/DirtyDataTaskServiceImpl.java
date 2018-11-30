package com.incon.common.DirtyDataTask.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.common.DirtyDataTask.page.DirtyDataTaskEntity;
import com.incon.common.ExceptionTask.page.RwrzbEntity;
import com.incon.common.ExceptionTask.quartz.QuartzManager;
import com.incon.common.grrc.page.GrrcEntity;
import com.incon.common.grrc.service.GrrcService;
import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.framework.util.IWSPOOL;
@Service(value= "dirtyDataTaskService")

/**
 * @类名：com.incon.common.DirtyDataTask.service.DirtyDataTaskServiceImpl
 * @作者：dqm
 * @时间：2016-12-09
 * @版本：
 * @描述：垃圾数据任务 实现类
 * @修改人员：
 * @修改时间：
 * @修改说明：
 */
public class DirtyDataTaskServiceImpl extends CommServiceImpl implements DirtyDataTaskService{

	/**
	 * 查询垃圾数据任务列表 
	 */
	@Override
	public List<DirtyDataTaskEntity> queryDirtyDataTaskToList(DirtyDataTaskEntity e) {
		// TODO Auto-generated method stub
		return dbDao.query("dirtyDataTask.queryDirtyDataTaskToList", e);
	}

	/**
	 * 查询任务日志
	 * @param rwlx
	 * @param rwid
	 */
	@Override
	public List<RwrzbEntity> queryRwrzb(String rwlx,String rwid){
		HashMap map = new HashMap();
		map.put("rwlx", rwlx);
		map.put("rwid",rwid);
		return dbDao.query("dirtyDataTask.queryRwrzb", map);
	}
	/**
	 * 查询单个垃圾数据任务
	 */
	@Override
	public DirtyDataTaskEntity queryDirtyDataTaskToSin(DirtyDataTaskEntity e) {
		// TODO Auto-generated method stub
		return (DirtyDataTaskEntity) dbDao.queryForObject("dirtyDataTask.queryDirtyDataTaskToSin", e);
	}

	/**
	 * 删除单个垃圾数据任务 
	 */
	@Transactional
	@MethodLog(description=" 删除单个 垃圾数据 任务  ")	
	@Override
	public Integer delDirtyDataTaskToSin(DirtyDataTaskEntity e) {
		return (Integer) dbDao.delete("dirtyDataTask.delDirtyDataTaskToSin", e);
	}

	/**
	 * 新增单个垃圾数据任务 
	 */
	@Transactional
	@MethodLog(description="新增单个垃圾数据任务 ")
	@Override
	public Integer addDirtyDataTaskToSin(DirtyDataTaskEntity e) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.update("dirtyDataTask.addDirtyDataTaskToSin", e);
	}

	/**
	 * 修改单个垃圾数据任务
	 */
	@Transactional
	@MethodLog(description="修改单个垃圾数据任务")
	@Override
	public Integer updDirtyDataTaskToSin(DirtyDataTaskEntity e) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.update("dirtyDataTask.updDirtyDataTaskToSin", e);
	}
	
	/**
	 * 批量执行sql
	 * @param ids
	 * @param zhxgrdm
	 * @throws Exception
	 */
	@Override
	public void executeDirtyDataTaskToBatch(String[] ids,String zhxgrdm) throws Exception{
		IWSPOOL iw = new IWSPOOL();
		Connection conn = null;
		Statement stmt  = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		try{
			conn  = iw.getConnection();
			conn.setAutoCommit(false); 
			if(ids != null  && ids.length > 0 ){
				for(int i=0;i<ids.length;i++){
					DirtyDataTaskEntity tem = new DirtyDataTaskEntity();
					tem.setZhxgrdm(zhxgrdm);
					tem.setId(ids[i]);
					DirtyDataTaskEntity entity = queryDirtyDataTaskToSin(tem);	
					//1.执行 处理SQl
					StringBuffer sql1 = new StringBuffer();
					sql1.append(entity.getDeletesql()+" ");
					sql1.append((entity.getTablename()==null?"":entity.getTablename())+" ");
					System.out.println(entity.getWheresql()+"--------------");
					sql1.append((entity.getWheresql()==null?"":entity.getWheresql())+" ");
					stmt  = conn.createStatement();
					System.out.println(sql1.toString());
					int yxhs = stmt.executeUpdate(sql1.toString());
					entity.setYxhs(yxhs);
					//更新数据
					updDirtyDataTaskToSin(entity);	
				    String sql = "insert into xt_rwrzb (id, rwlx, zxsj, rwid, xtdm, zxsql, zxrdm, yxhs) values (?, ?, sysdate, ?, ?, ?, ?, ?)";
				    ps = conn.prepareStatement(sql);
				    ps.setString(1,UUID.randomUUID().toString());
				    ps.setString(2, "2");
				    ps.setString(3,entity.getId());
				    ps.setString(4, entity.getXtdm());
				    ps.setString(5, sql1.toString());
				    ps.setString(6, zhxgrdm);
				    ps.setInt(7, yxhs);
				    ps.executeUpdate();
				}
			}
		}catch (Exception e) {
			conn.rollback();
			throw new Exception("DirtyDataTaskServiceImpl.executeDirtyDataTaskToBatch 失败", e);
		} finally {
			if(rs != null){
				rs.close();
			}
			if(ps != null){
				ps.close();
			}
			if(stmt != null){
				stmt.close();
			}		
			if(conn != null && !conn.isClosed()){
				conn.close();
			}			
		}
	}

}
