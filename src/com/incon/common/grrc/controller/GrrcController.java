package com.incon.common.grrc.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.incon.common.grrc.page.GrrcEntity;
import com.incon.common.grrc.service.GrrcService;

/**
 * 个人日程
 * 
 * @author 丁起明
 *
 */
@Controller
@RequestMapping("/grrc")
public class GrrcController {

	private static final Logger logger = Logger.getLogger(GrrcController.class);

	@Resource(name = "grrcService")
	private GrrcService grrcService;

	/**
	 * 进入日程主页面
	 * @return
	 */
	@RequestMapping("/index")
	public String index() {
		return "commons/grrc/index";
	}

	/**
	 * 返回日程json
	 * @param response
	 * @param callback
	 * @param p
	 * @param yhdm
	 */
	@RequestMapping("queryGrrcJson/{yhdm}")
	public void queryGrrcJson(HttpServletResponse response, String callback,
			GrrcEntity p, @PathVariable String yhdm) {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		try {
			p.setYhdm(yhdm);
			List<GrrcEntity> grrcList = grrcService.queryGrrcJson(p);
			writer = response.getWriter();
			wr.append(JSON.toJSONString(grrcList, true));
		} catch (Exception e) {
			logger.error("queryGrrcJson/{" + yhdm + "} 失败", e);
		} finally {
			if (writer != null) {
				writer.print(wr);
				writer.flush();
				writer.close();
			}
		}
	}
	/**
	 * 进入到编辑页面
	 * @param response
	 * @param model
	 * @param p
	 * @param id
	 * @param yhdm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("editSinGrrc/{yhdm}/{id}")
	public String editSinGrrc(HttpServletResponse response, Model model,
			GrrcEntity p, @PathVariable String id, @PathVariable String yhdm)
			throws Exception {
		try {
			p.setYhdm(yhdm);
			p.setId(id);
			GrrcEntity sinGrrc = grrcService.querySinGrrc(p);
			model.addAttribute("sinGrrc", sinGrrc);
		} catch (Exception e) {
			logger.error("editSinGrrc/{" + yhdm + "}/{" + id + "} 失败", e);
			throw new Exception("editSinGrrc/{" + yhdm + "}/{" + id + "} 失败", e);
		}
		return "commons/grrc/editSinGrrc";
	}

	/**
	 * 进入到添加页面
	 * @param response
	 * @param model
	 * @param p
	 * @param yhdm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("addSinGrrc/{yhdm}/{rcsj}")
	public String addSinGrrc(HttpServletResponse response, Model model,
			GrrcEntity p, @PathVariable String yhdm,@PathVariable String rcsj) throws Exception {
		try {
			p.setRcsj(rcsj);
			model.addAttribute("sinGrrc", p);
		} catch (Exception e) {
			logger.error("addSinGrrc/{" + yhdm + "} 失败", e);
			throw new Exception("addSinGrrc/{" + yhdm + "} 失败", e);
		}
		return "commons/grrc/addSinGrrc";
	}

	/**
	 * 删除
	 * @param response
	 * @param callback
	 * @param p
	 * @param yhdm
	 * @param id
	 */
	@RequestMapping("delSinGrrc/{yhdm}/{id}")
	public void delSinGrrc(HttpServletResponse response, String callback,
			GrrcEntity p, @PathVariable String yhdm, @PathVariable String id) {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		try {
			p.setYhdm(yhdm);
			p.setId(id);
			Integer reusltCount = grrcService.delSinGrrc(p);
			writer = response.getWriter();
			wr.append(reusltCount);
		} catch (Exception e) {
			logger.error("delSinGrrc/{" + yhdm + "}/{" + id + "} 失败", e);
		} finally {
			if (writer != null) {
				writer.print(wr);
				writer.flush();
				writer.close();
			}
		}
	}
	/**
	 * 添加保存提交
	 * @param response
	 * @param callback
	 * @param p
	 * @param yhdm
	 */
	@RequestMapping("addShumitSinGrrc/{yhdm}/{rcsj}")
	public void addShumitSinGrrc(HttpServletResponse response, String callback,
			GrrcEntity p, @PathVariable String yhdm,@PathVariable String rcsj) {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		try {
			p.setYhdm(yhdm);
			p.setRcsj(rcsj);
			p.setCzbs("0");
			Integer reusltCount = grrcService.addShumitSinGrrc(p);
			writer = response.getWriter();
			wr.append(reusltCount);
		} catch (Exception e) {
			logger.error("addShumitSinGrrc/{" + yhdm + "} 失败", e);
		} finally {
			if (writer != null) {
				writer.print(wr);
				writer.flush();
				writer.close();
			}
		}
	}
	/**
	 * 修改提交保存
	 * @param response
	 * @param callback
	 * @param p
	 * @param yhdm
	 * @param id
	 */
	@RequestMapping("updShumitSinGrrc/{yhdm}/{id}")
	public void updShumitSinGrrc(HttpServletResponse response, String callback,
			GrrcEntity p, @PathVariable String yhdm, @PathVariable String id) {
		StringBuffer wr = new StringBuffer();
		PrintWriter writer = null;
		try {
			p.setYhdm(yhdm);
			p.setId(id);
			Integer reusltCount = grrcService.updShumitSinGrrc(p);
			writer = response.getWriter();
			wr.append(reusltCount);
		} catch (Exception e) {
			logger.error("updShumitSinGrrc/{" + yhdm + "}/{" + id + "} 失败", e);
		} finally {
			if (writer != null) {
				writer.print(wr);
				writer.flush();
				writer.close();
			}
		}
	}	
}
