package com.incon.common.ExecuteSQLTask.controller;

import java.io.PrintWriter;
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
import com.incon.common.ExceptionTask.page.RwrzbEntity;
import com.incon.common.ExceptionTask.page.RwrzbJsonPage;
import com.incon.common.ExecuteSQLTask.page.ExecuteSQLTaskEntity;
import com.incon.common.ExecuteSQLTask.quartz.ExecuteSQLJob;
import com.incon.common.ExecuteSQLTask.quartz.ExecuteSQLQuartzManager;
import com.incon.common.ExecuteSQLTask.service.ExecuteSQLTaskService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;

/**
 * 
 * @类名：com.incon.common.ExecuteSQLTask.controller.ExecuteSQLTaskController
 * @创建人：安智博
 * @日期：2017-3-31
 * @描述：执行SQL任务
 */
@Controller
@RequestMapping("/executeSQLTaskController")
public class ExecuteSQLTaskController {

	@Resource(name = "executeSQLTaskService")
	private ExecuteSQLTaskService executeSQLTaskService;

	private static final Logger logger = Logger
			.getLogger(ExecuteSQLTaskController.class);

	/**
	 * 执行SQL任务页面
	 * 
	 * @param gnbs
	 *            (功能标识 1：查看全部执行SQL任务列表 、2：查看自己创建执行SQL任务列表 )
	 * @return
	 */
	@RequestMapping("/index/{gnbs}")
	public String index(@PathVariable String gnbs, Model model) {
		System.out.println("-----------------------------");
		model.addAttribute("gnbs", gnbs);
		return "commons/executeSQLTask/index";
	}

	/**
	 * 查询执行SQL任务列表
	 * 
	 * @param response
	 * @param callback
	 *            Ajax回调函数名
	 * @param entity
	 *            异常任务 实体
	 * @param gnbs
	 *            (功能标识 1：查看全部查询异常（例外）任务列表 、2：查看自己创建异常（例外）任务列表 )
	 * @throws Exception
	 */
	@RequestMapping("queryExecuteSQLTaskToList/{gnbs}")
	public void queryExecuteSQLTaskToList(HttpSession session,
			HttpServletResponse response, String callback,
			@PathVariable String gnbs, ExecuteSQLTaskEntity entity)
			throws Exception {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		UserEntity userEntity = (UserEntity) session
				.getAttribute(WebConstants.CURRENT_USER);
		wr.append(callback + "(");
		try {
			entity.setZhxgrdm(userEntity.getYhdm());
			entity.setGnbs(gnbs);
			List<ExecuteSQLTaskEntity> ExecuteSQLTaskEntityList = executeSQLTaskService.queryExecuteSQLTaskToList(entity);
			
			List<ExecuteSQLTaskEntity>  runExecuteSQLTaskEntityList= ExecuteSQLQuartzManager.listJob();	
			
			List<ExecuteSQLTaskEntity> reList = new ArrayList<ExecuteSQLTaskEntity>();
			
			for(ExecuteSQLTaskEntity e : ExecuteSQLTaskEntityList){
				e.setYxzt("2");
				for(ExecuteSQLTaskEntity r1 : runExecuteSQLTaskEntityList){
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
			logger.error("ExecuteSQLTaskController.queryExecuteSQLTaskToList/{"
					+ gnbs + "} 失败", e);
			throw new Exception(
					"ExecuteSQLTaskController.queryExecuteSQLTaskToList/{" + gnbs
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

	@RequestMapping("queryExecuteSQLTaskToSinJson")
	public void queryExecuteSQLTaskToSinJson(HttpSession session,
			HttpServletResponse response, String callback,
			ExecuteSQLTaskEntity entity)
			throws Exception {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		
		ExecuteSQLTaskEntity reList = null; 
		wr.append(callback + "(");
		try {
			reList = executeSQLTaskService.queryExecuteSQLTaskToSin(entity);
			writer = response.getWriter();
			wr.append(JSON.toJSONString(reList, true));
			System.out.println(wr);
		} catch (Exception e) {
			logger.error("ExecuteSQLTaskController.queryExecuteSQLTaskToSinJson 失败", e);
			throw new Exception(
					"ExecuteSQLTaskController.queryExecuteSQLTaskToSinJson 失败", e);
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
	 * 查询执行SQL任务
	 * 
	 * @param session
	 * @param response
	 * @param entity
	 * @param method
	 *            add：添加 、upd：修改
	 * @throws Exception
	 */
	@RequestMapping("queryExecuteSQLTaskToSin/{method}")
	public String queryExecuteSQLTaskToSin(HttpSession session,
			HttpServletResponse response, ExecuteSQLTaskEntity entity,
			@PathVariable String method, Model model) throws Exception {

		ExecuteSQLTaskEntity ExecuteSQLTaskEntitySin = null;
		try {
			if (method.equals("add")) {
				ExecuteSQLTaskEntitySin = new ExecuteSQLTaskEntity();
				ExecuteSQLTaskEntitySin.setId(UUID.randomUUID().toString());
			} else if (method.equals("upd")) {
				ExecuteSQLTaskEntitySin = executeSQLTaskService
						.queryExecuteSQLTaskToSin(entity);
			}
		} catch (Exception e) {
			logger.error("ExecuteSQLTaskController.ExecuteSQLTaskEntitySin/{"
					+ method + " }失败", e);
			throw new Exception(
					"ExecuteSQLTaskController.ExecuteSQLTaskEntitySin/{" + method
							+ " }失败", e);
		} finally {
			model.addAttribute("ExecuteSQLTaskEntitySin", ExecuteSQLTaskEntitySin);
			model.addAttribute("method", method);
			return "commons/executeSQLTask/queryExecuteSQLTaskToSin";
		}
	}

	@RequestMapping("shumitExecuteSQLTaskToSin/{method}")
	public void shumitExecuteSQLTaskToSin(HttpServletResponse response,
			HttpSession session, ExecuteSQLTaskEntity entity,
			@PathVariable String method) throws Exception {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		UserEntity userEntity = (UserEntity) session
				.getAttribute(WebConstants.CURRENT_USER);
		Integer reusltCount = 0;
		try {
			entity.setZhxgrdm(userEntity.getYhdm());

			if (method.equals("add")) {
				reusltCount = executeSQLTaskService
						.addExecuteSQLTaskToSin(entity);
			} else if (method.equals("upd")) {
				reusltCount = executeSQLTaskService
						.updExecuteSQLTaskToSin(entity);
			} else if (method.equals("del")) {
				reusltCount = executeSQLTaskService
						.delExecuteSQLTaskToSin(entity);
			}
			writer = response.getWriter();
			wr.append(reusltCount);
		} catch (Exception e) {
			logger.error("ExecuteSQLTaskController.shumitExecuteSQLTaskToSin/{"
					+ method + " }失败", e);
			throw new Exception(
					"ExecuteSQLTaskController.shumitExecuteSQLTaskToSin/{"
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
			@PathVariable String id,ExecuteSQLTaskEntity entity){
		String message = "success";
		try {
			logger.info("ExecuteSQLTaskController.addJob/{" + id + " } 执行");
			
			
			ExecuteSQLQuartzManager.removeJob(id);
			/**运行Job**/
			entity.setId(id);
			ExecuteSQLTaskEntity exEntity = executeSQLTaskService.queryExecuteSQLTaskToSin(entity);	
			
			System.out.println(exEntity.getId()+"---------------");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("exEntity", exEntity);			

			ExecuteSQLQuartzManager.addJob(ExecuteSQLJob.class, id,exEntity.getCron(), map);
			/**运行Job**/
		} catch (Exception e) {
			message="error:["+e+"]";			
			logger.error("ExecuteSQLTaskController.addJob/{" + id + " }失败", e);

			
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
		String message = "success";
		try {
			logger.info("ExecuteSQLTaskController.removeJob/{" + id + " } 执行");
			
			ExecuteSQLQuartzManager.removeJob(id);
			

		} catch (Exception e) {
			logger.error("ExecuteSQLTaskController.removeJob/{" + id + " }失败", e);
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
		wr.append(callback + "(");
		try {			
			List<ExecuteSQLTaskEntity> ExecuteSQLTaskEntityList = ExecuteSQLQuartzManager.listJob();			
			
			writer = response.getWriter();
			wr.append(JSON.toJSONString(ExecuteSQLTaskEntityList, true));
		} catch (Exception e) {
			logger.error("ExecuteSQLTaskController.listJob 失败", e);
			throw new Exception(
					"ExecuteSQLTaskController.listJob 失败", e);
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
		return "commons/executeSQLTask/easyuiRwrzb";
	}
	
	@ResponseBody
	@RequestMapping(value="queryRwrzb")
	public Object queryRwrzb(Model model,RwrzbJsonPage rwrzbJsonPage,HttpSession session){
		JSONObject jsonObject = null;
		try{
			logger.info("queryNjListData() ");			
			List<RwrzbEntity> njList = executeSQLTaskService.queryRwrzb(rwrzbJsonPage);
			Integer total = executeSQLTaskService.queryRwrzbCount(rwrzbJsonPage);
			jsonObject = new JSONObject();
			jsonObject.put("total", total);
			jsonObject.put("rows", njList);
		}catch(Exception e){
			logger.error("queryRwrzb() 失败", e);
		}
		return jsonObject;
	}

	
}
