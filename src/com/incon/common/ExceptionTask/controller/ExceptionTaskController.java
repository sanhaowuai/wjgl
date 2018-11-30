package com.incon.common.ExceptionTask.controller;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.incon.common.ExceptionTask.page.ExceptionTaskEntity;
import com.incon.common.ExceptionTask.page.RwrzbEntity;
import com.incon.common.ExceptionTask.page.RwrzbJsonPage;
import com.incon.common.ExceptionTask.quartz.ExceptionJob;
import com.incon.common.ExceptionTask.quartz.QuartzManager;
import com.incon.common.ExceptionTask.quartz.TestJob;
import com.incon.common.ExceptionTask.service.ExceptionTaskService;
import com.incon.common.grrc.page.GrrcEntity;
import com.incon.framework.interseptor.WebConstants;
import com.incon.framework.util.IWSPOOL;
import com.incon.pojo.common.UserEntity;
import com.incon.project.common.demo.page.DemoJsonPage;

/**
 * @类名：com.incon.common.ExceptionTask.Controller.ExceptionTaskController
 * @作者：dqm
 * @时间：2016-12-09
 * @版本：
 * @描述：例外（异常）任务
 * @修改人员：
 * @修改时间：
 * @修改说明：
 */
@Controller
@RequestMapping("/exceptionTaskController")
public class ExceptionTaskController {

	@Resource(name = "exceptionTaskService")
	private ExceptionTaskService exceptionTaskService;

	private static final Logger logger = Logger
			.getLogger(ExceptionTaskController.class);

	/**
	 * 异常任务页面
	 * 
	 * @param gnbs
	 *            (功能标识 1：查看全部查询异常（例外）任务列表 、2：查看自己创建异常（例外）任务列表 )
	 * @return
	 */
	@RequestMapping("/index/{gnbs}")
	public String index(@PathVariable String gnbs, Model model) {
		System.out.println("-----------------------------");
		model.addAttribute("gnbs", gnbs);
		return "commons/cxceptionTask/index";
	}

	/**
	 * 查询异常（例外）任务列表
	 * 
	 * @param response
	 * @param callback
	 *            Ajax回调函数名
	 * @param entity
	 *            异常任务 实体
	 *            com.incon.common.ExceptionTask.page.ExceptionTaskEntity
	 * @param gnbs
	 *            (功能标识 1：查看全部查询异常（例外）任务列表 、2：查看自己创建异常（例外）任务列表 )
	 * @throws Exception
	 */
	@RequestMapping("queryExceptionTaskToList/{gnbs}")
	public void queryExceptionTaskToList(HttpSession session,
			HttpServletResponse response, String callback,
			@PathVariable String gnbs, ExceptionTaskEntity entity)
			throws Exception {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		UserEntity userEntity = (UserEntity) session
				.getAttribute(WebConstants.CURRENT_USER);
		wr.append(callback + "(");
		try {
			entity.setZhxgrdm(userEntity.getYhdm());
			entity.setGnbs(gnbs);
			List<ExceptionTaskEntity> exceptionTaskEntityList = exceptionTaskService.queryExceptionTaskToList(entity);
			
			List<ExceptionTaskEntity>  runExceptionTaskEntityList= QuartzManager.listJob();	
			
			List<ExceptionTaskEntity> reList = new ArrayList<ExceptionTaskEntity>();
			
			for(ExceptionTaskEntity e : exceptionTaskEntityList){
				e.setYxzt("2");
				for(ExceptionTaskEntity r1 : runExceptionTaskEntityList){
					if(e.getId().equals(r1.getId())){
						e.setYxzt("1");
						break;
					}
				}
				reList.add(e);
			}
			
			
			writer = response.getWriter();
			wr.append(JSON.toJSONString(reList, true));
			System.out.println(wr);
		} catch (Exception e) {
			logger.error("ExceptionTaskController.queryExceptionTaskToList/{"
					+ gnbs + "} 失败", e);
			throw new Exception(
					"ExceptionTaskController.queryExceptionTaskToList/{" + gnbs
							+ "} 失败", e);
		} finally {
			wr.append(");");
			if (writer != null) {
				writer.print(wr);
				writer.flush();
				writer.close();
			}
		}
	}

	@RequestMapping("queryExceptionTaskToSinJson")
	public void queryExceptionTaskToSinJson(HttpSession session,
			HttpServletResponse response, String callback,
			ExceptionTaskEntity entity)
			throws Exception {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		UserEntity userEntity = (UserEntity) session
				.getAttribute(WebConstants.CURRENT_USER);
		
		ExceptionTaskEntity reList = null; 
		wr.append(callback + "(");
		try {
			reList = exceptionTaskService.queryExceptionTaskToSin(entity);
			writer = response.getWriter();
			wr.append(JSON.toJSONString(reList, true));
			System.out.println(wr);
		} catch (Exception e) {
			logger.error("ExceptionTaskController.queryExceptionTaskToSinJson 失败", e);
			throw new Exception(
					"ExceptionTaskController.queryExceptionTaskToSinJson 失败", e);
		} finally {
			wr.append(");");
			if (writer != null) {
				writer.print(wr);
				writer.flush();
				writer.close();
			}
		}
	}
	
	@RequestMapping("executeExceptionTaskToSin")
	public void executeExceptionTaskToSin(HttpSession session,
			HttpServletResponse response, String callback,
			ExceptionTaskEntity entity)
			throws Exception {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		UserEntity userEntity = (UserEntity) session
				.getAttribute(WebConstants.CURRENT_USER);
		
		ExceptionTaskEntity reList = null; 
		wr.append(callback + "(");
		IWSPOOL iw = new IWSPOOL();
		Connection conn = null;
		Statement stmt  = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			entity.setZhxgrdm(userEntity.getYhdm());
			//更新数据
			exceptionTaskService.updExceptionTaskToSin(entity);
			
			
			
			conn  = iw.getConnection();
			conn.setAutoCommit(false);   
			stmt  = conn.createStatement();
			
			//1.执行 处理SQl
			int updateCount = stmt.executeUpdate(entity.getYcclsql());
			
			
			StringBuffer yccxsql = new StringBuffer();
			yccxsql.append("select count(*) record_ from (");
			yccxsql.append(entity.getYccxsql());
			yccxsql.append(")");
			//2.查询异常SQL
			rs = stmt.executeQuery(yccxsql.toString());  
			int rowCount = 0;
		    if(rs.next())    
		    {    
		        rowCount=rs.getInt("record_");
		    }
		    
		    String updaterowCount = "update xt_ycscrwb set YCCXROWS = "+ rowCount + " where id = '" + entity.getId() + "'";
		    System.out.println(updaterowCount);
		    //3.根据异常SQL的结果更新 事务表中 查询行数
		    stmt.executeUpdate(updaterowCount);
		    
		    
		    

		      
			
		    //查询处理后的任务
			reList = exceptionTaskService.queryExceptionTaskToSin(entity);
			
		    String sql = "insert into xt_rwrzb (id, rwlx, zxsj, rwid, xtdm, zxsql, zxrdm, yxhs) values (?, ?, sysdate, ?, ?, ?, ?, ?)";
		    ps = conn.prepareStatement(sql);
		    ps.setString(1,UUID.randomUUID().toString());
		    ps.setString(2, "1");
		    ps.setString(3,entity.getId());
		    ps.setString(4, reList.getXtdm());
		    ps.setString(5, entity.getYcclsql());
		    ps.setString(6, userEntity.getYhdm());
		    ps.setInt(7, updateCount);
		    ps.executeUpdate();
			conn.commit(); 
			
			reList.setUpdateCount(updateCount);
			
			
			
			System.out.println(reList.getUpdateCount()+"=========="+reList.getYccxrows());
			writer = response.getWriter();
			wr.append(JSON.toJSONString(reList, true));
			System.out.println(wr);
		} catch (Exception e) {
			conn.rollback();
			logger.error("ExceptionTaskController.executeExceptionTaskToSin 失败", e);
			throw new Exception(
					"ExceptionTaskController.executeExceptionTaskToSin 失败", e);
		} finally {
			try {
				if(rs != null ){
					rs.close();
				}
				if(stmt != null){
					stmt.close();
				}
				if(ps != null){
					ps.close();
				}				
				if(conn != null && !conn.isClosed()){
					conn.close();
				}	
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				logger.error(e);
			}			
			wr.append(");");
			if (writer != null) {
				writer.print(wr);
				writer.flush();
				writer.close();
			}
		}
	}	
	
	/**
	 * 查询单个异常（例外）任务
	 * 
	 * @param session
	 * @param response
	 * @param entity
	 * @param method
	 *            add：添加 、upd：修改
	 * @throws Exception
	 */
	@RequestMapping("queryExceptionTaskToSin/{method}")
	public String queryExceptionTaskToSin(HttpSession session,
			HttpServletResponse response, ExceptionTaskEntity entity,
			@PathVariable String method, Model model) throws Exception {

		ExceptionTaskEntity exceptionTaskEntitySin = null;
		try {
			if (method.equals("add")) {
				exceptionTaskEntitySin = new ExceptionTaskEntity();
				exceptionTaskEntitySin.setId(UUID.randomUUID().toString());
			} else if (method.equals("upd")) {
				exceptionTaskEntitySin = exceptionTaskService
						.queryExceptionTaskToSin(entity);
			}
		} catch (Exception e) {
			logger.error("ExceptionTaskController.exceptionTaskEntitySin/{"
					+ method + " }失败", e);
			throw new Exception(
					"ExceptionTaskController.exceptionTaskEntitySin/{" + method
							+ " }失败", e);
		} finally {
			model.addAttribute("exceptionTaskEntitySin", exceptionTaskEntitySin);
			model.addAttribute("method", method);
			return "commons/cxceptionTask/queryExceptionTaskToSin";
		}
	}

	@RequestMapping("shumitExceptionTaskToSin/{method}")
	public void shumitExceptionTaskToSin(HttpServletResponse response,
			HttpSession session, ExceptionTaskEntity entity,
			@PathVariable String method) throws Exception {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		UserEntity userEntity = (UserEntity) session
				.getAttribute(WebConstants.CURRENT_USER);
		Integer reusltCount = 0;
		try {
			entity.setZhxgrdm(userEntity.getYhdm());

			if (method.equals("add")) {
				reusltCount = exceptionTaskService
						.addExceptionTaskToSin(entity);
			} else if (method.equals("upd")) {
				reusltCount = exceptionTaskService
						.updExceptionTaskToSin(entity);
			} else if (method.equals("del")) {
				reusltCount = exceptionTaskService
						.delExceptionTaskToSin(entity);
			}
			writer = response.getWriter();
			wr.append(reusltCount);
		} catch (Exception e) {
			logger.error("ExceptionTaskController.shumitExceptionTaskToSin/{"
					+ method + " }失败", e);
			throw new Exception(
					"ExceptionTaskController.shumitExceptionTaskToSin/{"
							+ method + " }失败", e);
		} finally {
			if (writer != null) {
				writer.print(wr);
				writer.flush();
				writer.close();
			}
		}
	}
	/**
	 * 添加Job
	 * @param response
	 * @param session
	 * @param id
	 * @throws Exception
	 */
	@RequestMapping("addJob/{id}")
	@ResponseBody
	public String addJob(HttpServletResponse response, HttpSession session,
			@PathVariable String id,ExceptionTaskEntity entity){
		UserEntity userEntity = (UserEntity) session
				.getAttribute(WebConstants.CURRENT_USER);
		String message = "success";
		try {
			logger.info("ExceptionTaskController.addJob/{" + id + " } 执行");
			
			
			QuartzManager.removeJob(id);
			/**运行Job**/
			entity.setId(id);
			ExceptionTaskEntity exEntity = exceptionTaskService.queryExceptionTaskToSin(entity);	
			
			System.out.println(exEntity.getId()+"---------------");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("exEntity", exEntity);			

			QuartzManager.addJob(ExceptionJob.class, id,exEntity.getCron(), map);
			/**运行Job**/
		} catch (Exception e) {
			message="error:["+e+"]";			
			logger.error("ExceptionTaskController.addJob/{" + id + " }失败", e);

			
		} 
		return message;
	}
	/**
	 * 移除JOb
	 * @param response
	 * @param session
	 * @param id
	 * @throws Exception
	 */
	@RequestMapping("removeJob/{id}")
	@ResponseBody
	public String removeJob(HttpServletResponse response, HttpSession session,
			@PathVariable String id) throws Exception {
		PrintWriter writer = null;
		UserEntity userEntity = (UserEntity) session
				.getAttribute(WebConstants.CURRENT_USER);
		String message = "success";
		try {
			logger.info("ExceptionTaskController.removeJob/{" + id + " } 执行");
			
			QuartzManager.removeJob(id);
			

		} catch (Exception e) {
			logger.error("ExceptionTaskController.removeJob/{" + id + " }失败", e);
			message="error:["+e+"]";			
		}
		return message;
	}
	
	
	@RequestMapping("listJob")
	public void listJob(HttpSession session,
			HttpServletResponse response, String callback)
			throws Exception {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		UserEntity userEntity = (UserEntity) session
				.getAttribute(WebConstants.CURRENT_USER);
		wr.append(callback + "(");
		try {			
			List<ExceptionTaskEntity> exceptionTaskEntityList = QuartzManager.listJob();			
			
			writer = response.getWriter();
			wr.append(JSON.toJSONString(exceptionTaskEntityList, true));
		} catch (Exception e) {
			logger.error("ExceptionTaskController.listJob 失败", e);
			throw new Exception(
					"ExceptionTaskController.listJob 失败", e);
		} finally {
			wr.append(");");
			if (writer != null) {
				writer.print(wr);
				writer.flush();
				writer.close();
			}
		}
	}	

	@RequestMapping(value="queryRwrzbPage")
	public String queryRwrzbPage(Model model,RwrzbJsonPage rwrzbJsonPage){
		model.addAttribute("rwrzbJsonPage",rwrzbJsonPage);
		return "commons/cxceptionTask/easyuiRwrzb";
	}
	
	@ResponseBody
	@RequestMapping(value="queryRwrzb")
	public Object queryRwrzb(Model model,RwrzbJsonPage rwrzbJsonPage,HttpSession session){
		JSONObject jsonObject = null;
		try{
			logger.info("queryNjListData() ");			
			List<RwrzbEntity> njList = exceptionTaskService.queryRwrzb(rwrzbJsonPage);
			Integer total = exceptionTaskService.queryRwrzbCount(rwrzbJsonPage);
			jsonObject = new JSONObject();
			jsonObject.put("total", total);
			jsonObject.put("rows", njList);
		}catch(Exception e){
			logger.error("queryRwrzb() 失败", e);
		}
		return jsonObject;
	}

	
}
