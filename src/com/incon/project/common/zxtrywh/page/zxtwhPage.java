 
package com.incon.project.common.zxtrywh.page;

import com.incon.framework.page.Page;

/**
 * 
 * @类名：com.incon.project.common.zxtrywh.page
 * @创建人： 赵玥(zhaoyue)
 * @日期： 2016-10-22
 * @版本号：
 * @说明：子系统人员维护
 */
@SuppressWarnings("all")
public class zxtwhPage extends Page
{
    private String pyhmc,pyhlx,pyxdm,pzxtdm;

    public String getPzxtdm() {
		return pzxtdm;
	}

	public void setPzxtdm(String pzxtdm) {
		this.pzxtdm = pzxtdm;
	}

	public String getPyhmc() {
		return pyhmc;
	}

	public void setPyhmc(String pyhmc) {
		this.pyhmc = pyhmc;
	}

	public String getPyhlx() {
		return pyhlx;
	}

	public void setPyhlx(String pyhlx) {
		this.pyhlx = pyhlx;
	}

	public String getPyxdm() {
		return pyxdm;
	}

	public void setPyxdm(String pyxdm) {
		this.pyxdm = pyxdm;
	}

	public zxtwhPage()
    {
        this.setSql("zxtrywh.queryZxt");
        this.setSqlCount("zxtrywh.queryZxtCount");
    }


	 

}