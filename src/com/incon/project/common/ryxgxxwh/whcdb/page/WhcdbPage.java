package com.incon.project.common.ryxgxxwh.whcdb.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.ryxgxxwh.whcdb.page.WhcdPage
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
public class WhcdbPage extends Page {
	
		private String dmmc;	
		public WhcdbPage(){
			this.setSql("whcdbgl.queryWhcd");
			this.setSqlCount("whcdbgl.queryWhcdCount");
		}

		public String getDmmc() {
			return dmmc;
		}

		public void setDmmc(String dmmc) {
			this.dmmc = dmmc;
		}
		
}
