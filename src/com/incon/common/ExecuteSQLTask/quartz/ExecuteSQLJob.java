package com.incon.common.ExecuteSQLTask.quartz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.incon.common.ExecuteSQLTask.page.ExecuteSQLTaskEntity;
import com.incon.framework.util.IWSPOOL;

public class ExecuteSQLJob implements Job{
	private static final Logger logger = Logger.getLogger(ExecuteSQLJob.class);
	public void execute(JobExecutionContext context) throws JobExecutionException {
		Map<String, Object> map = context.getJobDetail().getJobDataMap();
		ExecuteSQLTaskEntity exEntity = (ExecuteSQLTaskEntity) map.get("exEntity");
		IWSPOOL iw = new IWSPOOL();
		Connection conn = null;
		Statement stmt  = null;
		ResultSet rs = null;
		
		try {
			
			conn  = iw.getConnection();
			
			logger.info("执行SQL任务["+context.getJobDetail().getKey()+"],name="+exEntity.getMc()+"执行处理SQL"+exEntity.getClsql());
			conn.setAutoCommit(false);   
			
			
			stmt  = conn.createStatement();
			System.out.println(exEntity.getClsql());
		    int updateCount = stmt.executeUpdate(exEntity.getClsql());
		    
		    String updaterowCount = "update xt_zxsqlwb set clsqlrows = "+ updateCount + " where id = '" + exEntity.getId() + "'";
		    System.out.println(updaterowCount);
		    stmt.executeUpdate(updaterowCount);
		    PreparedStatement ps = null;
		    String sql = "insert into xt_rwrzb (id, rwlx, zxsj, rwid, xtdm, zxsql, zxrdm, yxhs) values (?, ?, sysdate, ?, ?, ?, ?, ?)";
		    ps = conn.prepareStatement(sql);
		    ps.setString(1,UUID.randomUUID().toString());
		    ps.setString(2, "3");
		    ps.setString(3,exEntity.getId());
		    ps.setString(4, exEntity.getXtdm());
		    ps.setString(5, exEntity.getClsql());
		    ps.setString(6, exEntity.getZhxgrdm());
		    ps.setInt(7, updateCount);
		    ps.executeUpdate();
//			System.out.println(rowCount+"结果集合"+"==="+updateCount);
			conn.commit();   
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
			logger.error(e);
		}finally{
			try {
				if(rs != null){
					rs.close();
				}
				if(stmt != null){
					stmt.close();
				}
				if(conn != null && !conn.isClosed()){
					conn.close();
				}				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				logger.error(e);
			}			
		}
        throw new JobExecutionException();
    }
}
