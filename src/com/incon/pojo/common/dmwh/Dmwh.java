package com.incon.pojo.common.dmwh;

import java.util.Map;

public class Dmwh {
	
	/**接收从前台页面提交的表单中name和value 比如前台有
	 * <input type='text' name='val.id' value='2' />,提交到后台后，实体Dmwh中的map中应该会有
	 * [id=2]这么一项*/
	private Map<String,String> val;

	public Map<String, String> getVal() {
		return val;
	}

	public void setVal(Map<String, String> val) {
		this.val = val;
	}

	
	
}
