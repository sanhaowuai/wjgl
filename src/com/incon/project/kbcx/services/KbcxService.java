package com.incon.project.kbcx.services;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.kbcx.Zkb;

public interface KbcxService extends CommService {
	
	
	//根据学年学期查询周次
	public List<Map<String, String>> queryzklistbyxnxq(Map<String, String> map);
	/**
	 * @描述：查询课表开关状态
	 */
	public Integer queryKbkgzt(String xnxq);
	/**
	 * 查询学生班级推荐课表
	 * @param map
	 */
	@SuppressWarnings("all")
	public List KbcxList(Map<String, String> map);
	/**
	 * 查询学生其他班级推荐周课表   
	 */
	public List queryQtZkb(Map<String, String> map);
	/**
	 * 学生查询实践
	 * @param map
	 */
	public List querySjkc(Map<String, String> map);
	/**
	 * 查询学生个人实践课程信息  
	 * @param map
	 */
	public List<Map<String,Object>> queryGrsjkc(Map<String, String> map);
	
	/**
	 * 查询学生个人课表
	 * @param map
	 */
	public List GrkbcxList(Map<String, String> map);
	/**
	 * 查询学生个人周课表
	 * @param map
	 */
	public List GrZkbcxList(Map<String, String> map);
	/**
	 * 查询学生班级推荐周课表
	 */
	public List bjtjZkbcxList(Map<String, String> map);
	/**
	 * 查询学生个人课表(英文版)
	 */
	public List queryYwGrkb(Map<String, String> map);
	/**
	 * 查询推荐班级课表(英文版)
	 */
	public List queryYwBJkb(Map<String, String> map);
	/**
	 * 查询学生专业课表
	 * @param map
	 */
	public List queryZykbList(Map<String, String> map);
	/**
	 * 查询专业课程实践课程信息
	 */
	public List queryZySjkc(Map<String, String> map);
	/**
	 * 查询课表日期
	 */
	public List<Zkb> queryKbrqList(Map map);

	/**
	 * 查询学生信息
	 * @param map
	 */
	public Map queryXsxx(String xh);
	//判断确认按钮是否可用
	public String  queryQransfky(Map<String, String> map);
	
	//个人课表确认
	public void queryGrkbqr(Map<String, String> map);
	
	//个人课表是否已确认
	public int queryGrkbsfqr(Map<String, String> map);
	//判断学生是否已选课
	public int querySfyxk(Map<String, String> map);
	
	/**
	 *  查询当前周次
	 */
	public String queryDqzc();
}
