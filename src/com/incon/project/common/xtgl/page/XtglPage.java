/*
 * 文件名：XtglPage.java
 * 版权：Copyright 2011-2015 Libowei Tech. Co. Ltd. All Rights Reserved. 
 * 描述： XtglPage.java
 * 修改人：Administrator
 * 修改时间：2015-5-2
 * 修改内容：新增
 */
package com.incon.project.common.xtgl.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.xtgl.page.XtglPage
 * @作者：zhaoaihua
 * @时间：2015-05-02
 * @版本：
 * @描述：教师管理
 */
@SuppressWarnings("all")
public class XtglPage extends Page
{
    private String yhdm; // 用户代码

    private Integer jsdm; // 角色代码

    private String xn; // 学年

    private String xq; // 学期

    private String xydm; // 学院代码

    private String xtmc; // 选题名称

    public XtglPage()
    {
        this.setSql("xtgl.queryLwxt");
        this.setSqlCount("xtgl.queryLwxtCount");
    }

    public String getYhdm()
    {
        return yhdm;
    }

    public void setYhdm(String yhdm)
    {
        this.yhdm = yhdm;
    }

    public Integer getJsdm()
    {
        return jsdm;
    }

    public void setJsdm(Integer jsdm)
    {
        this.jsdm = jsdm;
    }

    public String getXn()
    {
        return xn;
    }

    public void setXn(String xn)
    {
        this.xn = xn;
    }

    public String getXq()
    {
        return xq;
    }

    public void setXq(String xq)
    {
        this.xq = xq;
    }

    public String getXydm()
    {
        return xydm;
    }

    public void setXydm(String xydm)
    {
        this.xydm = xydm;
    }

    public String getXtmc()
    {
        return xtmc;
    }

    public void setXtmc(String xtmc)
    {
        this.xtmc = xtmc;
    }

}
