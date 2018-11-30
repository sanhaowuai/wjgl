package com.incon.project.common.xxfbxx.page;

import com.incon.framework.page.Page;

public class XxfbckPage extends Page{
		private String yhlx;
		private String xxlb;
		private String fbr;
		private String xxbt;
		private String fbbm;
		private String fbkssj;
		private String fbjssj;
		private String yhdm;
		
		
		
		public XxfbckPage(){
			this.setSql("xxfbxx.queryXxfbck"); 
			this.setSqlCount("xxfbxx.queryXxfbckCount");
		}
		
		public String getYhdm() {
			return yhdm;
		}

		public void setYhdm(String yhdm) {
			this.yhdm = yhdm;
		}

		public String getYhlx() {
			return yhlx;
		}
		public String getXxlb() {
			return xxlb;
		}
		public String getFbr() {
			return fbr;
		}
		public String getXxbt() {
			return xxbt;
		}
		public String getFbbm() {
			return fbbm;
		}
		public String getFbkssj() {
			return fbkssj;
		}
		public String getFbjssj() {
			return fbjssj;
		}
		public void setYhlx(String yhlx) {
			this.yhlx = yhlx;
		}
		public void setXxlb(String xxlb) {
			this.xxlb = xxlb;
		}
		public void setFbr(String fbr) {
			this.fbr = fbr;
		}
		public void setXxbt(String xxbt) {
			this.xxbt = xxbt;
		}
		public void setFbbm(String fbbm) {
			this.fbbm = fbbm;
		}
		public void setFbkssj(String fbkssj) {
			this.fbkssj = fbkssj;
		}
		public void setFbjssj(String fbjssj) {
			this.fbjssj = fbjssj;
		}
		
		
		
}
