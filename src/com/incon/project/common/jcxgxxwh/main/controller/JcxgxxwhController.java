package com.incon.project.common.jcxgxxwh.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @类名：  com.incon.project.common.jcxgxxwh.mian.controller.JcxgxxwhController
 * @创建人： 丁起明
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述： 科类管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/jcxgxxwh")
public class JcxgxxwhController {
	@RequestMapping("/main")
	public String main(){
		return "commons/jcxgxxwh/main";
	}
}
