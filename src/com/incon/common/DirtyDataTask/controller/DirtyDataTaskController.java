package com.incon.common.DirtyDataTask.controller;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import com.incon.common.DirtyDataTask.page.DirtyDataTaskEntity;
import com.incon.common.DirtyDataTask.service.DirtyDataTaskService;
import com.incon.common.ExceptionTask.page.RwrzbEntity;
import com.incon.common.ExceptionTask.quartz.ExceptionJob;
import com.incon.common.ExceptionTask.quartz.QuartzManager;
import com.incon.common.ExceptionTask.quartz.TestJob;
import com.incon.common.grrc.page.GrrcEntity;
import com.incon.framework.interseptor.WebConstants;
import com.incon.framework.util.IWSPOOL;
import com.incon.pojo.common.UserEntity;

/**
 * @类名：com.incon.common.DirtyDataTask.Controller.DirtyDataTaskController
 * @作者：dqm
 * @时间：2016-12-09
 * @版本：
 * @描述：垃圾数据 任务
 * @修改人员：
 * @修改时间：
 * @修改说明：
 */
@Controller
@RequestMapping("/dirtyDataTaskController")
public class DirtyDataTaskController {

	@Resource(name = "dirtyDataTaskService")
	private DirtyDataTaskService dirtyDataTaskService;

	private static final Logger logger = Logger
			.getLogger(DirtyDataTaskController.class);

	/**
	 * 垃圾数据 页面
	 * 
	 * @param gnbs
	 *            (功能标识 1：查看全部查询 垃圾数据 任务列表 、2：查看自己创建 垃圾数据 任务列表 )
	 * @return
	 */
	@RequestMapping("/index/{gnbs}")
	public String index(@PathVariable String gnbs, Model model) {
		model.addAttribute("gnbs", gnbs);
		return "commons/dirtyDataTask/index";
	}

	/**
	 * 查询 垃圾数据 任务列表
	 * 
	 * @param response
	 * @param callback
	 *            Ajax回调函数名
	 * @param entity
	 *            垃圾数据任务 实体
	 *            com.incon.common.DirtyDataTask.page.DirtyDataTaskEntity
	 * @param gnbs
	 *             (功能标识 1：查看全部查询 垃圾数据 任务列表 、2：查看自己创建 垃圾数据 任务列表 )
	 * @throws Exception
	 */
	@RequestMapping("queryDirtyDataTaskToList/{gnbs}")
	public void queryDirtyDataTaskToList(HttpSession session,
			HttpServletResponse response, String callback,
			@PathVariable String gnbs, DirtyDataTaskEntity entity)
			throws Exception {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		UserEntity userEntity = (UserEntity) session
				.getAttribute(WebConstants.CURRENT_USER);
		wr.append(callback + "(");
		try {
			entity.setZhxgrdm(userEntity.getYhdm());
			entity.setGnbs(gnbs);
			
			List<DirtyDataTaskEntity> reList = dirtyDataTaskService.queryDirtyDataTaskToList(entity);
			writer = response.getWriter();
			wr.append(JSON.toJSONString(reList, true));
			System.out.println(wr);
		} catch (Exception e) {
			logger.error("DirtyDataTaskController.queryDirtyDataTaskToList/{"
					+ gnbs + "} 失败", e);
			throw new Exception(
					"DirtyDataTaskController.queryDirtyDataTaskToList/{" + gnbs
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
	/**
	 * 查询一个垃圾数据
	 * @param session
	 * @param response
	 * @param callback
	 * @param entity
	 * @throws Exception
	 */
	@RequestMapping("queryDirtyDataTaskToSinJson")
	public void queryDirtyDataTaskToSinJson(HttpSession session,
			HttpServletResponse response, String callback,
			DirtyDataTaskEntity entity)
			throws Exception {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		UserEntity userEntity = (UserEntity) session
				.getAttribute(WebConstants.CURRENT_USER);
		
		DirtyDataTaskEntity reList = null; 
		wr.append(callback + "(");
		try {
			reList = dirtyDataTaskService.queryDirtyDataTaskToSin(entity);
			writer = response.getWriter();
			wr.append(JSON.toJSONString(reList, true));
			System.out.println(wr);
		} catch (Exception e) {
			logger.error("DirtyDataTaskController.queryDirtyDataTaskToSinJson 失败", e);
			throw new Exception(
					"DirtyDataTaskController.queryDirtyDataTaskToSinJson 失败", e);
		} finally {
			wr.append(");");
			if (writer != null) {
				writer.print(wr);
				writer.flush();
				writer.close();
			}
		}
	}
	/**
	 * 执行 SQL
	 * @param session
	 * @param response
	 * @param callback
	 * @param entity
	 * @throws Exception
	 */
	@RequestMapping("executeDirtyDataTaskToSin")
	public void executeDirtyDataTaskToSin(HttpSession session,
			HttpServletResponse response, String callback,
			DirtyDataTaskEntity entity)
			throws Exception {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		UserEntity userEntity = (UserEntity) session
				.getAttribute(WebConstants.CURRENT_USER);
		DirtyDataTaskEntity reList = null; 
		wr.append(callback + "(");
		IWSPOOL iw = new IWSPOOL();
		Connection conn = null;
		Statement stmt  = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			entity.setZhxgrdm(userEntity.getYhdm());

			conn  = iw.getConnection();
			conn.setAutoCommit(false);   
			stmt  = conn.createStatement();
			//1.执行 处理SQl
			StringBuffer sql1 = new StringBuffer();
			sql1.append(entity.getDeletesql()+" ");
			sql1.append(entity.getTablename()+" ");
			sql1.append(entity.getWheresql()+" ");
			System.out.println(sql1.toString());
			
			int yxhs = stmt.executeUpdate(sql1.toString());

			entity.setYxhs(yxhs);
			//更新数据
			dirtyDataTaskService.updDirtyDataTaskToSin(entity);			
			reList = dirtyDataTaskService.queryDirtyDataTaskToSin(entity);
		    String sql = "insert into xt_rwrzb (id, rwlx, zxsj, rwid, xtdm, zxsql, zxrdm, yxhs) values (?, ?, sysdate, ?, ?, ?, ?, ?)";
		    ps = conn.prepareStatement(sql);
		    ps.setString(1,UUID.randomUUID().toString());
		    ps.setString(2, "2");
		    ps.setString(3,entity.getId());
		    ps.setString(4, reList.getXtdm());
		    ps.setString(5, sql1.toString());
		    ps.setString(6, userEntity.getYhdm());
		    ps.setInt(7, yxhs);
		    ps.executeUpdate();
			
			conn.commit(); 
			
			writer = response.getWriter();
			wr.append(JSON.toJSONString(reList, true));
			System.out.println(wr);
		} catch (Exception e) {
			conn.rollback();
			logger.error("DirtyDataTaskController.executeDirtyDataTaskToSin 失败", e);
			throw new Exception(
					"DirtyDataTaskController.executeDirtyDataTaskToSin 失败", e);
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
			wr.append(");");
			if (writer != null) {
				writer.print(wr);
				writer.flush();
				writer.close();
			}
		}
	}	
	/**
	 * 批量执行sql
	 * @param session
	 * @param response
	 * @param callback
	 * @param ids
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("executeDirtyDataTaskToBatch")
	public String executeDirtyDataTaskToBatch(HttpSession session,
			HttpServletResponse response,
			String[] ids){
		String message = "success";
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		try {
			dirtyDataTaskService.executeDirtyDataTaskToBatch(ids, userEntity.getYhdm());
		} catch (Exception e) {
			message="error:["+e+"]";		
			logger.error("DirtyDataTaskController.executeDirtyDataTaskToBatch 失败", e);
			//throw new Exception("DirtyDataTaskController.executeDirtyDataTaskToBatch 失败", e);
		} 
		
		return message;
	}	
	

	/**
	 * 提交表单
	 * @param response
	 * @param session
	 * @param entity
	 * @param method
	 * @throws Exception
	 */
	@RequestMapping("shumitDirtyDataTaskToSin/{method}")
	public void shumitDirtyDataTaskToSin(HttpServletResponse response,
			HttpSession session, DirtyDataTaskEntity entity,
			@PathVariable String method) throws Exception {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		UserEntity userEntity = (UserEntity) session
				.getAttribute(WebConstants.CURRENT_USER);
		Integer reusltCount = 0;
		try {
			entity.setZhxgrdm(userEntity.getYhdm());

			if (method.equals("add")) {
				reusltCount = dirtyDataTaskService
						.addDirtyDataTaskToSin(entity);
			} else if (method.equals("upd")) {
				reusltCount = dirtyDataTaskService
						.updDirtyDataTaskToSin(entity);
			} else if (method.equals("del")) {
				reusltCount = dirtyDataTaskService
						.delDirtyDataTaskToSin(entity);
			}
			writer = response.getWriter();
			wr.append(reusltCount);
		} catch (Exception e) {
			logger.error("DirtyDataTaskController.shumitDirtyDataTaskToSin/{"
					+ method + " }失败", e);
			throw new Exception(
					"DirtyDataTaskController.shumitDirtyDataTaskToSin/{"
							+ method + " }失败", e);
		} finally {
			if (writer != null) {
				writer.print(wr);
				writer.flush();
				writer.close();
			}
		}
	}

	@RequestMapping("queryRwrzb")
	public void queryRwrzb(HttpSession session,
			HttpServletResponse response, String callback,String rwlx ,String rwid)
			throws Exception {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		UserEntity userEntity = (UserEntity) session
				.getAttribute(WebConstants.CURRENT_USER);
		wr.append(callback + "(");
		try {			
			List<RwrzbEntity> rwrzbList = dirtyDataTaskService.queryRwrzb(rwlx, rwid)	;		
			
			writer = response.getWriter();
			wr.append(JSON.toJSONString(rwrzbList, true));
		} catch (Exception e) {
			logger.error("DirtyDataTaskController.queryRwrzb 失败", e);
			throw new Exception(
					"DirtyDataTaskController.queryRwrzb 失败", e);
		} finally {
			wr.append(");");
			if (writer != null) {
				writer.print(wr);
				writer.flush();
				writer.close();
			}
		}
	}
	@RequestMapping("getGuid")
	@ResponseBody
	public String getGuid(){
		return UUID.randomUUID().toString();
	}	
}
