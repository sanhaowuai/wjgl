package com.incon.wjgl.service;

import com.incon.framework.service.CommService;
import com.incon.wjgl.param.MultipartFileParam;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 *@author:zh
 *@description:存储操作的service
 *@date:2018/11/16
 */
public interface StorageService extends CommService {

    /**
     * 删除全部数据
     */
    //void deleteAll();

    /**
     * 初始化方法
     */
    //void init();

    /**
     * 上传文件方法1
     *
     * @param param
     * @throws IOException
     */
    void uploadFileRandomAccessFile(MultipartFileParam param, HttpServletRequest request) throws IOException;

}
