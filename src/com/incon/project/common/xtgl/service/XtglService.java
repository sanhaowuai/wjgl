package com.incon.project.common.xtgl.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
import com.incon.pojo.common.lwgl.KxkzybEntity;
import com.incon.pojo.common.lwgl.LwsbbEntity;
import com.incon.pojo.common.lwgl.XsxtbEntity;
import com.incon.pojo.common.lwgl.XtczbEntity;

/**
 * 
 * @类名： com.incon.project.common.jsgl.service.JsglService
 * @创建人： zhaoaihua
 * @日期： 2015-05-02
 * @修改人：
 * @日期：
 * @描述：
 * @版本号：
 */
@SuppressWarnings("all")
public interface XtglService extends CommService
{

    // 查询可选论文
    // public List<LwsbbEntity> queryLwsbbInfo(KxkzybEntity kxkzybEntity);

    // 新增选题
    public void addXt(XsxtbEntity xsxtbEntity, LwsbbEntity lwsbb);

    // 删除选题
    public void delXt(XsxtbEntity xsxtbEntity, LwsbbEntity lwsbb);

    // 查询一条可选题
    public LwsbbEntity queryOneLwsbbInfo(LwsbbEntity lwsbbEntity);

    // 学生是否已选题
    public boolean ifchooseXt(XsxtbEntity xsxtbEntity);

    // 查询学生选题
    public List<XsxtbEntity> queryXsxt(XsxtbEntity xsxtbEntity);

    // 查询系统设置
    public KxkzybEntity queryZykxt(KxkzybEntity kxkzybEntity);

    // 查询系统设置
    public XtczbEntity queryXtInfo();

    // 当前时间是否开放选课
    public boolean queryXtTime();

    // 根据角色代码查询角色
    public XsxxbEntity queryXsByXh(String xh);

    public UserEntity queryUser(UserEntity userEntity);

}
