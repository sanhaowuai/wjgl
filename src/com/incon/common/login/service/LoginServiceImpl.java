package com.incon.common.login.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XtfkbEntity;

/**
 * @类名：com.incon.common.login.service.LoginServiceImpl
 * @作者：于洋
 * @时间：2014-3-10
 * @版本：
 * @描述：登录service实现类
 * @修改人员：
 * @修改时间：
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value = "loginService")
public class LoginServiceImpl extends CommServiceImpl implements LoginService
{
    // CAS登录
    @Override
    public UserEntity casYhLogin(Map<String, String> map)
    {
    	dbDao.insert("login.updMrjs", map.get("yhdm"));
        UserEntity bean = (UserEntity) dbDao.queryForObject("login.casYhLogin",
                map);
        return bean;
    }	
    // 登录
    @Override
    public UserEntity yhLogin(Map<String, String> map)
    {
    	dbDao.insert("login.updMrjs", map.get("yhdm"));
        UserEntity bean = (UserEntity) dbDao.queryForObject("login.yhLogin",
                map);
        return bean;
    }

    // 查询用户角色
    @Override
    public List<JsbEntity> getRyjsb(UserEntity userEntity)
    {
        return dbDao.query("login.getRyjsb", userEntity);
    }

    // 一级菜单
    @Override
    public List<Map> getFatherOrder(UserEntity userEntity)
    {
        Integer ret = Integer.parseInt(String.valueOf(dbDao.queryForObject(
                "login.getRyjsqxCount", userEntity)));
        List<Map> list = new ArrayList<Map>();
        if (ret == 0)
        { // 无人员角色权限
            list = dbDao.query("login.getFatherOrder2", userEntity);
        }
        else
        {
            list = dbDao.query("login.getFatherOrder1", userEntity);
        }
        return list;
    }

    /**
     * 验证登录用户访问菜单权限
     * 
     * @param userEntity
     * @return
     */
    @Override
    public List<Map> checkCdqx(UserEntity userEntity)
    {
        List<Map> cdMapList = null; // size=0=没有访问菜单权限
        Integer ret = Integer.parseInt(String.valueOf(dbDao.queryForObject(
                "login.getRyjsqxCount", userEntity)));
        if (ret == 0)
        { // 无人员角色权限
            cdMapList = dbDao.query("login.getCdOrder2", userEntity);
        }
        else
        {
            cdMapList = dbDao.query("login.getCdOrder1", userEntity);
        }
        return cdMapList;
    }

    /**
     * 验证登录用户访问按钮权限
     * 
     * @param userEntity
     * @return
     */
    @Override
    public List<Map> checkAnqx(UserEntity userEntity)
    {
        List<Map> anMapList = null; // size=0=没有访问按钮权限
        Integer ret = Integer.parseInt(String.valueOf(dbDao.queryForObject(
                "login.getRyjsqxCount", userEntity)));
        if (ret == 0)
        { // 无人员角色权限
            anMapList = dbDao.query("login.getAnOrder2", userEntity);
        }
        else
        {
            anMapList = dbDao.query("login.getAnOrder1", userEntity);
        }
        return anMapList;
    }

    /**
     * 根据访问路径返回一个按钮Map
     * 
     * @param fwlj
     * @return
     */
    @Override
    public HashMap getOneAn(String fwlj)
    {
        return (HashMap) dbDao.queryForObject("login.getOneAn", fwlj);
    }

    /**
     * 根据访问路径返回一个菜单Map
     * 
     * @param fwlj
     * @return
     */
    @Override
    public HashMap getOneCd(String fwlj)
    {
        return (HashMap) dbDao.queryForObject("login.getOneCd", fwlj);
    }
    
    @Override
    public List<HashMap> getAllCd(String fwlj)
    {
        return dbDao.query("login.getAllCd", fwlj);
    }

    // 二级菜单
    @Override
    public List<Map> getOrder(UserEntity userEntity)
    {
        Integer ret = Integer.parseInt(String.valueOf(dbDao.queryForObject(
                "login.getRyjsqxCount", userEntity)));
        List<Map> list = new ArrayList<Map>();
        if (ret == 0)
        { // 无人员角色权限
            list = dbDao.query("login.getOrder2", userEntity);
        }
        else
        {
            list = dbDao.query("login.getOrder1", userEntity);
        }
        return list;
    }

    // 二级菜单main_02专用
    @Override
    public List<Map> getOrderMain02(UserEntity userEntity)
    {
        Integer ret = Integer.parseInt(String.valueOf(dbDao.queryForObject(
                "login.getRyjsqxCount", userEntity)));
        List<Map> list = new ArrayList<Map>();
        if (ret == 0)
        { // 无人员角色权限
            list = dbDao.query("login.getOrder2Main02", userEntity);
        }
        else
        {
            list = dbDao.query("login.getOrder1Main02", userEntity);
        }
        return list;
    }

    // 三级菜单1main_06专用
    public List<Map> getOrder1Main06(UserEntity userEntity)
    {
        Integer ret = Integer.parseInt(String.valueOf(dbDao.queryForObject(
                "login.getRyjsqxCount", userEntity)));
        List<Map> list = new ArrayList<Map>();
        if (ret == 0)
        { // 无人员角色权限
            list = dbDao.query("login.getOrder2_1Main06", userEntity);
        }
        else
        {
            list = dbDao.query("login.getOrder1_1Main06", userEntity);
        }
        return list;
    }

    // 三级菜单2main_06专用
    public List<Map> getOrder2Main06(UserEntity userEntity)
    {
        Integer ret = Integer.parseInt(String.valueOf(dbDao.queryForObject(
                "login.getRyjsqxCount", userEntity)));
        List<Map> list = new ArrayList<Map>();
        if (ret == 0)
        { // 无人员角色权限
            list = dbDao.query("login.getOrder2_2Main06", userEntity);
        }
        else
        {
            list = dbDao.query("login.getOrder1_2Main06", userEntity);
        }
        return list;
    }

    // 修改密码前查询密码输入是否正确
    public Integer getDlbToMm(UserEntity userEntity)
    {
        return Integer.parseInt(String.valueOf(dbDao.queryForObject(
                "login.getDlbToMm", userEntity)));
    }

    // 修改密码
    @Override
    public void updMm(UserEntity userEntity)
    {
        dbDao.update("login.updMm", userEntity);
    }



    // 查询人员角色按钮表
    @Override
    public List<HashMap> queryRyjsanb(UserEntity userEntity)
    {
        return dbDao.query("login.queryRyjsanb", userEntity);
    }

    // 查询角色按钮表
    @Override
    public List<HashMap> queryJsanb(UserEntity userEntity)
    {
        return dbDao.query("login.queryJsanb", userEntity);
    }

    // 查询人员角色权限表
    @Override
    public List<HashMap> queryRyjsqxb(UserEntity userEntity)
    {
        return dbDao.query("login.queryRyjsqxb", userEntity);
    }

    // 查询角色权限表
    @Override
    public List<HashMap> queryJsqxb(UserEntity userEntity)
    {
        return dbDao.query("login.queryJsqxb", userEntity);
    }
    /**
     * 获取参数表
     * @param csdm
     * @return
     */
    @Override
    public HashMap queryCsb(String csdm){
    	return (HashMap)dbDao.queryForObject("login.queryCsb", csdm);
    }

}
