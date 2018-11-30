package com.incon.common.ExceptionTask.quartz;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;

import com.incon.common.ExceptionTask.page.ExceptionTaskEntity;
import com.incon.framework.util.IWSPOOL;

public class ExceptionJob implements Job{
	private static final Logger logger = Logger.getLogger(ExceptionJob.class);
	public void execute(JobExecutionContext context) throws JobExecutionException {
		Map<String, Object> map = context.getJobDetail().getJobDataMap();
		ExceptionTaskEntity exEntity = (ExceptionTaskEntity) map.get("exEntity");
		IWSPOOL iw = new IWSPOOL();
		Connection conn = null;
		Statement stmt  = null;
		ResultSet rs = null;
		
		try {
			
			conn  = iw.getConnection();
			
			StringBuffer yccxsql = new StringBuffer();
			yccxsql.append("select count(*) record_ from (");
			yccxsql.append(exEntity.getYccxsql());
			yccxsql.append(")");
			
			logger.info("执行异常数据筛查["+context.getJobDetail().getKey()+"],name="+exEntity.getMc()+"执行查询SQL="+yccxsql.toString()+
					"执行处理SQL"+exEntity.getYcclsql());
			conn.setAutoCommit(false);   
			
			
			stmt  = conn.createStatement();
			rs = stmt.executeQuery(yccxsql.toString());  
			int rowCount = 0;
		    if(rs.next())    
		    {    
		        rowCount=rs.getInt("record_");
		    }
		    
		    String updaterowCount = "update xt_ycscrwb set YCCXROWS = "+ rowCount + " where id = '" + exEntity.getId() + "'";
		    System.out.println(updaterowCount);
		    int updateCount = stmt.executeUpdate(updaterowCount);
		    
		    
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
