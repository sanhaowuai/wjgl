/*
 * 文件名：XtglController.java
 * 版权：Copyright 2011-2015 Libowei Tech. Co. Ltd. All Rights Reserved. 
 * 描述： XtglController.java
 * 修改人：Administrator
 * 修改时间：2015-5-2
 * 修改内容：新增
 */
package com.incon.project.common.xtgl.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubYx.service.PubYxService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.JsxxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
import com.incon.pojo.common.lwgl.KxkzybEntity;
import com.incon.pojo.common.lwgl.LwsbbEntity;
import com.incon.pojo.common.lwgl.XsxtbEntity;
import com.incon.pojo.common.lwgl.XtczbEntity;
import com.incon.project.common.xtgl.page.XtglPage;
import com.incon.project.common.xtgl.service.XtglService;

/**
 * 
 * @类名： com.incon.project.common.jsgl.controller.XtglController
 * @创建人： zhaoaihua
 * @日期： 2015-05-02
 * @修改人：
 * @日期：
 * @描述： 学生选题管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/xtgl")
public class XtglController
{

    @Resource(name = "xtglService")
    private XtglService xtglService;

    @Resource(name = "pubYxService")
    private PubYxService pubYxService;

    @RequestMapping("/main")
    public String main()
    {
        return "commons/xtgl/main";
    }

    @RequestMapping("/queryxtgl")
    public String queryXtgl(Model model, JsxxbEntity jsxxbEntity,
            XtglPage xtglPage, HttpSession session)
    {
        UserEntity userEntity = (UserEntity) session
                .getAttribute(WebConstants.CURRENT_USER);
        try
        {
            xtglPage.setYhdm(userEntity.getYhdm());// 登录用户名
            UserEntity user = xtglService.queryUser(userEntity);

            XtczbEntity info = xtglService.queryXtInfo();

            xtglPage.setJsdm(user.getJsdm());// 角色代码

            // xtczb 判断时间
            if (!xtglService.queryXtTime())
            {
                return "commons/xtgl/errorTime";
            }

            // 学生信息， 获得院系
            XsxxbEntity stuXx = xtglService.queryXsByXh(userEntity.getYhdm());

            KxkzybEntity kxtzy = new KxkzybEntity();
            kxtzy.setXN(info.getXN());
            kxtzy.setXQ(info.getXQ());
            kxtzy.setXYDM(stuXx.getXydm());
            kxtzy.setZYDM(stuXx.getZydm());

            kxtzy = xtglService.queryZykxt(kxtzy);

            if (kxtzy != null && "1".equals(kxtzy.getSfkxk().toString()))
            {
                xtglPage.setXn(kxtzy.getXN());
                xtglPage.setXq(kxtzy.getXQ());
                xtglPage.setXydm(kxtzy.getXYDM());

                List<LwsbbEntity> xtlist = xtglService.query(xtglPage);
                model.addAttribute("xtlist", xtlist);
            }
            else
            {
                return "commons/xtgl/errrorZY";
            }

            model.addAttribute("xtglPage", xtglPage);

            System.out.println(stuXx);

        }
        catch (Exception e)
        {
            System.err.println("queryJsgl操作失败!!");
            e.printStackTrace();
        }
        return "commons/xtgl/xtgl";
    }

    @RequestMapping("/querychoosextgl")
    public String queryChooseXtgl(Model model, JsxxbEntity jsxxbEntity,
            XtglPage xtglPage, HttpSession session)
    {
        UserEntity userEntity = (UserEntity) session
                .getAttribute(WebConstants.CURRENT_USER);
        try
        {
            xtglPage.setYhdm(userEntity.getYhdm());// 登录用户名
            UserEntity user = xtglService.queryUser(userEntity);

            // xitong
            XtczbEntity info = xtglService.queryXtInfo();

            // xtczb 判断时间
            if (!xtglService.queryXtTime())
            {
                return "commons/xtgl/errorTime";
            }

            xtglPage.setJsdm(user.getJsdm());// 角色代码

            // 学生信息， 获得院系
            XsxxbEntity stuXx = xtglService.queryXsByXh(userEntity.getYhdm());

            KxkzybEntity kxtzy = new KxkzybEntity();
            kxtzy.setXN(info.getXN());
            kxtzy.setXQ(info.getXQ());
            kxtzy.setXYDM(stuXx.getXydm());
            kxtzy.setZYDM(stuXx.getZydm());

            kxtzy = xtglService.queryZykxt(kxtzy);

            if (kxtzy != null && "1".equals(kxtzy.getSFKXK().toString()))
            {
                xtglPage.setXn(kxtzy.getXN());
                xtglPage.setXq(kxtzy.getXQ());
                xtglPage.setXydm(kxtzy.getXYDM());

                XsxtbEntity xuantinfo = new XsxtbEntity();
                xuantinfo.setXN(kxtzy.getXN());
                xuantinfo.setXQ(kxtzy.getXQ());
                xuantinfo.setXH(stuXx.getXh());

                List<XsxtbEntity> yxtlist = xtglService.queryXsxt(xuantinfo);

                model.addAttribute("yxtlist", yxtlist);
            }

            System.out.println(stuXx);

            // kxkzyb 判断学生所在专业是否有可选课

            // lwsbb 查询xn xq mxxy下的所有list

        }
        catch (Exception e)
        {
            System.err.println("queryJsgl操作失败!!");
            e.printStackTrace();
        }
        return "commons/xtgl/choosextgl";
    }

    @ResponseBody
    @RequestMapping("addXt")
    public String addXt(String lwid, HttpSession session)
    {
        try
        {
            UserEntity userEntity = (UserEntity) session
                    .getAttribute(WebConstants.CURRENT_USER);

            UserEntity user = xtglService.queryUser(userEntity);
            XsxxbEntity stuXx = xtglService.queryXsByXh(userEntity.getYhdm());

            // xitong
            XtczbEntity info = xtglService.queryXtInfo();

            // 是否已选题
            XsxtbEntity xuantinfo = new XsxtbEntity();
            xuantinfo.setXN(info.getXN());
            xuantinfo.setXQ(info.getXQ());
            xuantinfo.setXH(stuXx.getXh());

            // 已选题
            if (xtglService.ifchooseXt(xuantinfo))
            {
                return null;
            }

            xuantinfo.setID(String.valueOf(System.currentTimeMillis()));
            xuantinfo.setLWID(lwid);
            xuantinfo.setXTSJ(new Date());

            LwsbbEntity lwsbb = new LwsbbEntity();
            lwsbb.setLWID(lwid);

            lwsbb = xtglService.queryOneLwsbbInfo(lwsbb);

            // 已满
            if (lwsbb.getDXSS() == lwsbb.getYXRS())
            {
                return null;
            }

            xtglService.addXt(xuantinfo, lwsbb);

            System.out.println("--");

        }
        catch (Exception e)
        {
            System.err.println("delZy操作失败!!");
            e.printStackTrace();
        }
        return null;
    }

    @ResponseBody
    @RequestMapping("delXt")
    public String delXt(String ids, String lwid)
    {
        try
        {

            XsxtbEntity xuantinfo = new XsxtbEntity();

            xuantinfo.setID(ids);
            xuantinfo.setLWID(lwid);
            xuantinfo.setXTSJ(new Date());

            LwsbbEntity lwsbb = new LwsbbEntity();
            lwsbb.setLWID(lwid);

            lwsbb = xtglService.queryOneLwsbbInfo(lwsbb);

            xtglService.delXt(xuantinfo, lwsbb);

            System.out.println("--");

        }
        catch (Exception e)
        {
            System.err.println("delZy操作失败!!");
            e.printStackTrace();
        }
        return null;
    }

}
