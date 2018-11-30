package com.incon.project.kbcx.services;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.kbcx.Zkb;


@SuppressWarnings("all")
@Service(value="kbcxService")
public class KbcxServiceImpl  extends CommServiceImpl implements KbcxService {
	
	
	//根据学年学期查询周次
	public List<Map<String, String>> queryzklistbyxnxq(Map<String, String> map){
		return dbDao.query("kbcx.queryzclistByxnxq",map);
	}
	/**
	 * @描述：查询课表开关状态
	 */
	public Integer queryKbkgzt(String xnxq){
		return (Integer)dbDao.queryForObject("kbcx.queryKbkgzt",xnxq);
	}
	
	/**
	 * 查询学生班级推荐课表
	 */
	public List KbcxList(Map<String, String> map) {
		return dbDao.query("kbcx.queryKb", map);
	}
	
	/**
	 * 查询学生其他班级推荐周课表   
	 */
	public List queryQtZkb(Map<String, String> map) {
		return dbDao.query("kbcx.queryQtZkb", map);
	}
	/**
	 * 查询学生班级实践课程信息
	 */
	public List querySjkc(Map<String, String> map) {
		return dbDao.query("kbcx.querySjkc", map);
	}
	
	/**
	 * 查询学生个人实践课程信息 
	 */
	public List<Map<String,Object>> queryGrsjkc(Map<String, String> map) {
		return dbDao.query("kbcx.queryGrsjkc", map);
	}

	/**
	 * 查询学生个人课表
	 */
	public List GrkbcxList(Map<String, String> map) {
		return dbDao.query("kbcx.queryGrkb", map);
	}
	/**
	 * 查询学生班级推荐周课表
	 */
	public List bjtjZkbcxList(Map<String, String> map){
		return dbDao.query("kbcx.bjtjZkbcxList", map);
	}
	
	/**
	 * 查询学生个人周课表
	 * @param map
	 */
	public List GrZkbcxList(Map<String, String> map){
		return dbDao.query("kbcx.GrZkbcxList", map);
	}
	
	/**
	 * 查询学生个人课表(英文版)
	 */
	public List queryYwGrkb(Map<String, String> map) {
		return dbDao.query("kbcx.queryYwGrkb", map);
	}
	
	/**
	 * 查询班级课表(英文版)
	 */
	public List queryYwBJkb(Map<String, String> map) {
		return dbDao.query("kbcx.queryYwBJkb", map);
	}
	
	/**
	 * 查询学生专业课表
	 * @param map
	 */
	public List queryZykbList(Map<String, String> map){
		return dbDao.query("kbcx.queryZykbList", map);
	}
	/**
	 * 查询专业课程实践课程信息
	 */
	public List queryZySjkc(Map<String, String> map) {
		return dbDao.query("kbcx.queryZySjkc", map);
	}
	/**
	 * 查询学生信息
	 * @param map
	 */
	public Map queryXsxx(String xh){
		return (Map)dbDao.queryForObject("kbcx.queryXsxx", xh);
	}

	@Override
	public String queryQransfky(Map<String, String> map) {
		
		return dbDao.queryForObject("kbcx.queryQransfky", map)==null?"0":dbDao.queryForObject("kbcx.queryQransfky", map).toString();
	}

	@Transactional
	@MethodLog(description="个人课表确认")	
	public void queryGrkbqr(Map<String, String> map) {
		dbDao.update("kbcx.queryGrkbqr", map);
		
	}

	@Override
	public int queryGrkbsfqr(Map<String, String> map) {
		
		return Integer.parseInt(dbDao.queryForObject("kbcx.queryGrkbsfqr", map).toString());
	}

	/**
	 * 查询课表日期
	 */
	public  List<Zkb>  queryKbrqList(Map map){
		return   dbDao.query("kbcx.queryKbrqList", map);
	}
	@Override
	public int querySfyxk(Map<String, String> map) {
		
		return Integer.parseInt(dbDao.queryForObject("kbcx.querySfyxk", map).toString());
	}
	/**
	 *  查询当前周次
	 */
	public String queryDqzc(){
		return (String)dbDao.queryForObject("kbcx.queryDqzc",null);
	}
	
}
