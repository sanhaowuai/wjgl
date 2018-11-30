package com.incon.common.button.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.incon.common.button.service.ButtonService;
import com.incon.common.login.service.LoginService;
import com.incon.pojo.common.XsxxbEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.ryxgxxwh.JgbEntity;
import com.incon.pojo.common.ryxgxxwh.MzbEntity;
import com.incon.pojo.common.ryxgxxwh.XbbEntity;
import com.incon.pojo.common.ryxgxxwh.ZzmmbEntity;
import com.incon.project.common.xsgl.page.XsglPage;

/**
 * @类名：com.incon.common.button.controller.ButtonController
 * @作者：于洋
 * @时间：2014-3-10
 * @版本：
 * @描述：按钮控制
 * @修改人员：
 * @修改时间：
 * @修改说明：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/button")
public class ButtonController {
	@Resource(name = "buttonService") 
	private ButtonService buttonService;
	
	@RequestMapping("queryAnkz")
	public String queryAnkz(){
		return "commons/ankzDemo/demo";
	}
}
