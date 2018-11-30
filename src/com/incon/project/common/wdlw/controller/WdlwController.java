package com.incon.project.common.wdlw.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.LwcjEntity;
import com.incon.pojo.common.LwdbTimeAddrEntity;
import com.incon.pojo.common.LwxxEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XtxxEntity;
import com.incon.project.common.wdlw.service.WdlwService;

/**
 * 
 * @类名： com.incon.project.common.wdlw.controller.XsglController
 * @创建人：丁磊磊
 * @日期： 2015-5-3
 * @修改人：
 * @日期：
 * @描述： 我的论文
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/wdlw")
public class WdlwController {

	private static final String HAS_SUBMITTED = "1";

	private static final int BUFFER_SIZE = 2 * 1024;

	@Resource(name = "wdlwService")
	private WdlwService wdlwService;

	@Autowired
	ServletContext context;

	@RequestMapping("querywdlw")
	public String queryXuanTi(Model model, HttpSession session) {
		String commitForwardPage = "commons/wdlw/wdlw_submited";
		String editForwardPage = "commons/wdlw/wdlw_edit";
		String forwardPage = "";
		try {
			UserEntity userEntity = (UserEntity) session
					.getAttribute(WebConstants.CURRENT_USER);
			String userCode = userEntity.getYhdm();
			LwxxEntity lwxxEntity = wdlwService.queryLwInfo(userCode);

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			if (null == lwxxEntity) {
				return "commons/wdlw/emptyLunwen";
			}
			lwxxEntity.setUserCode(userCode);
			if (HAS_SUBMITTED.equals(lwxxEntity.getStatus()))// 表示论文已经提交
			{
				forwardPage = commitForwardPage;
				lwxxEntity.setSubDateString(dateFormat.format(lwxxEntity
						.getSubDate()));
				String filepath = lwxxEntity.getFilepath();
				lwxxEntity.setFilepath(filepath.substring(filepath
						.indexOf("upload/bylw")));
				model.addAttribute("lunwen", lwxxEntity);

				LwdbTimeAddrEntity lwdbTimeAddr = wdlwService
						.queryDabianTimeAddr(lwxxEntity);
				if (null != lwdbTimeAddr) {
					model.addAttribute("dabian", lwdbTimeAddr);
				}
				LwcjEntity lwcjEntity = wdlwService
						.queryDabianChengji(lwxxEntity);
				if (null != lwcjEntity) {
					model.addAttribute("chengji", lwcjEntity);
				}

			} else {
				forwardPage = editForwardPage;
			}

			XtxxEntity xtxxEntity = wdlwService.queryXtInfo(userCode);

			xtxxEntity.setSelectDateString(dateFormat.format(xtxxEntity
					.getSelectDate()));
			model.addAttribute("lwxx", xtxxEntity);
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("查询论文失败");
		}

		return forwardPage;
	}

	@RequestMapping("saveLuwen")
	public String addLunwen(@RequestParam("keyword") String keyword,
			@RequestParam("summary") String summary,
			@RequestParam("attach") MultipartFile file, HttpSession session) {
		try {
			UserEntity userEntity = (UserEntity) session
					.getAttribute(WebConstants.CURRENT_USER);
			Calendar c = Calendar.getInstance();
			String suffix = file.getOriginalFilename().substring(
					file.getOriginalFilename().lastIndexOf('.'));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSSS");
			String name = userEntity.getYhdm() + "_" + sdf.format(c.getTime())
					+ suffix;

			String savePath = "upload/bylw";
			String realPath = context.getRealPath(File.separator + savePath);// 实际路径
			// 更新数据库
			LwxxEntity lwxxEntity = new LwxxEntity();
			lwxxEntity.setSubDate(c.getTime());
			lwxxEntity.setFilepath(realPath.replaceAll("\\\\", "/") + "/"
					+ name);
			lwxxEntity.setKeyword(keyword);
			lwxxEntity.setSummary(summary);
			lwxxEntity.setUserCode(userEntity.getYhdm());
			wdlwService.updateLunwenStatus(lwxxEntity);
			// 保存文件

			File saveFiledir = new File(realPath); // 在该实际路径下实例化一个文件
			if (!saveFiledir.exists()) {
				saveFiledir.mkdirs();
			}
			// 文件已存在（上传了同名的文件）
			File saveFile = new File(realPath + "/" + name);
			if (saveFile.exists()) {
				saveFile.delete();
				saveFile = new File(realPath + "/" + name);
			}
			try {
				this.copy(file.getInputStream(), saveFile);
				//设置不能运行 防止出现病毒
				saveFile.setExecutable(false);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("保存论文失败");
		}

		return "redirect:/wdlw/querywdlw";
	}

	@RequestMapping(value = "downFile")
	@ResponseBody
	public void download(@RequestParam("filepath") String downLoadPath,
			final HttpServletRequest request, final HttpServletResponse response) {

		String savePath = downLoadPath;
		UserEntity userEntity = (UserEntity) request.getSession(true)
				.getAttribute(WebConstants.CURRENT_USER);
		String fileName = savePath.substring(savePath.lastIndexOf("/") + 1);
		// 未登录状态不能下载 不能下载别人的论文
		if (null == userEntity || !fileName.startsWith(userEntity.getYhdm())) {
			try {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				StringBuilder builder = new StringBuilder();
				builder
						.append("<script type=\"text/javascript\" charset=\"UTF-8\">");
				builder.append("alert(\"没有登录 不能下载！\");");
				builder.append("window.top.location.href=\"");
				builder.append("" + request.getContextPath() + "\";</script>");
				out.print(builder.toString());
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return;
		}

		downLoadPath = context.getRealPath("/" + downLoadPath);// 实际路径
		java.io.BufferedInputStream bis = null;
		java.io.BufferedOutputStream bos = null;
		String filename = "我的论文"
				+ downLoadPath.substring(downLoadPath.lastIndexOf('.'));

		try {
			response.setContentType("text/html;charset=utf-8");
			request.setCharacterEncoding("UTF-8");

			long fileLength = new File(downLoadPath).length();
			response.setContentType("application/x-msdownload;");
			response.setHeader("Content-disposition", "attachment; filename="
					+ new String(filename.getBytes("GBK"), "ISO8859-1"));
			response.setHeader("Content-Length", String.valueOf(fileLength));

			bis = new BufferedInputStream(new FileInputStream(downLoadPath));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}

		} catch (Exception e) {
			System.out.println("Err :" + e);
		} finally {
			try {
				if (bis != null)
					bis.close();
				if (bos != null)
					bos.close();
			} catch (IOException e) {
				System.out.println("Err :" + e);
			}
		}
	}

	@ExceptionHandler(MaxUploadSizeExceededException.class)
	public ModelAndView handleException(Exception ex) {

		ModelAndView page = new ModelAndView("error/error_err");
		if (ex instanceof MaxUploadSizeExceededException) {
			Exception e = new Exception("上传的论文文件应不大于 "
					+ getFileMB(((MaxUploadSizeExceededException) ex)
							.getMaxUploadSize())+"！");
			page.addObject("exception", e);
		}
		return page;
	}

    private String getFileMB(long byteFile){
    	if(byteFile==0)
     	   return "0MB";
     	long mb=1024*1024;
     	return ""+byteFile/mb+"MB";
    }

	private void copy(InputStream in, File dst) {
		OutputStream out = null;
		try {
			if (dst.exists()) {
				out = new BufferedOutputStream(new FileOutputStream(dst, true),
						BUFFER_SIZE);
			} else {
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
			}
			// in = new BufferedInputStream(new FileInputStream(src),
			// BUFFER_SIZE);

			byte[] buffer = new byte[BUFFER_SIZE];
			int len = 0;
			while ((len = in.read(buffer)) > 0) {
				out.write(buffer, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (null != out) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
