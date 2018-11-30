package com.incon.framework.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.incon.framework.dao.DbDao;
import com.incon.framework.service.InitService;

/**
 * @类名：com.incon.framework.service.impl.InitServiceImpl
 * @作者：Linls
 * @时间：2012-12-25
 * @版本：
 * @描述：初始化
 * @修改人员：
 * @修改时间：2012-12-25
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value="initService")
public class InitServiceImpl implements InitService {
//	private static final Logger logger = LoggerFactory.getLogger(InitServiceImpl.class);
	@Resource(name="dbDao")
	private DbDao dbDao;
	public Map<String, Object> selectAllFields() {
//		logger.info("读取系统默认配置");
		Map<String, Object> map = new HashMap<String, Object>();
		//此处的的值会被放到Applaction中 随时调用
		map.put("List", new ArrayList()); //
		return map;
	}
	
	
}
