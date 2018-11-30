package com.incon.project.common.ryxgxxwh.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @类名：  com.incon.project.common.ryxgxxwh.mian.controller.RyxgxxwhController
 * @创建人： 丁起明
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述： 人员信息相关维护
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/ryxgxxwh")
public class RyxgxxwhController {
	@RequestMapping("/main")
	public String main(){
		return "commons/ryxgxxwh/main";
	}
}
