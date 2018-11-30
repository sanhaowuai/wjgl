package com.incon.project.common.xtgl.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
import com.incon.pojo.common.lwgl.KxkzybEntity;
import com.incon.pojo.common.lwgl.LwsbbEntity;
import com.incon.pojo.common.lwgl.XsxtbEntity;
import com.incon.pojo.common.lwgl.XtczbEntity;

/**
 * 
 * @类名： com.incon.project.common.jsgl.service.JsglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-03-11
 * @修改人：
 * @日期：
 * @描述：
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value = "xtglService")
public class XtglServiceImpl extends CommServiceImpl implements XtglService
{

    // 新增选题
    @Override
    @MethodLog(description = "增加专业")
    @Transactional
    public void addXt(XsxtbEntity xsxtbEntity, LwsbbEntity lwsbb)
    {
        dbDao.insert("xtgl.addXt", xsxtbEntity);

        lwsbb.setYXRS(lwsbb.getYXRS() + 1);

        dbDao.update("xtgl.upXtyxrs", lwsbb);

    }

    // 删除选题
    @Override
    @MethodLog(description = "增加专业")
    @Transactional
    public void delXt(XsxtbEntity xsxtbEntity, LwsbbEntity lwsbb)
    {
        dbDao.delete("xtgl.delXt", xsxtbEntity);

        lwsbb.setYXRS(lwsbb.getYXRS() - 1);

        dbDao.update("xtgl.upXtyxrs", lwsbb);

    }

    // 学生是否已选题
    @Override
    public boolean ifchooseXt(XsxtbEntity xsxtbEntity)
    {
        int result = (Integer) dbDao.queryForObject("xtgl.ifchooseXt",
                xsxtbEntity);

        if (result > 0)
        {
            return true;
        }

        return false;

    }

    // 查询学生选题
    @Override
    public List<XsxtbEntity> queryXsxt(XsxtbEntity xsxtbEntity)
    {
        return (List<XsxtbEntity>) dbDao.query("xtgl.queryXsxtinfo",
                xsxtbEntity);
    }

    // 查询一条可选题
    @Override
    public LwsbbEntity queryOneLwsbbInfo(LwsbbEntity lwsbbEntity)
    {
        return (LwsbbEntity) dbDao.queryForObject("xtgl.queryOneLwsbbInfo",
                lwsbbEntity);
    }

    // 查询系统设置
    @Override
    public KxkzybEntity queryZykxt(KxkzybEntity kxkzybEntity)
    {
        return (KxkzybEntity) dbDao.queryForObject("xtgl.queryZykxtInfo",
                kxkzybEntity);
    }

    // 查询系统设置
    @Override
    public XtczbEntity queryXtInfo()
    {
        XtczbEntity result = (XtczbEntity) dbDao.queryForObject(
                "xtgl.queryXtInfo", "1");

        return result;

    }

    // 查询系统设置时候开发
    @Override
    public boolean queryXtTime()
    {
        int result = (Integer) dbDao.queryForObject("xtgl.queryXtTime", "1");

        if (result > 0)
        {
            return true;
        }

        return false;

    }

    // 根据学生学号查询学生
    @Override
    public XsxxbEntity queryXsByXh(String xh)
    {
        return (XsxxbEntity) dbDao.queryForObject("xsgl.queryXsByXh", xh);
    }

    @Override
    public UserEntity queryUser(UserEntity userEntity)
    {

        return (UserEntity) dbDao.queryForObject("jysgl.queryUser", userEntity);
    }
}
