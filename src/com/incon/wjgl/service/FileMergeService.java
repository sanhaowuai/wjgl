package com.incon.wjgl.service;

import com.incon.framework.service.CommService;

/**
 *@author:zh
 *@description:文件合成接口
 *@date:2018/11/16
 */
public interface FileMergeService extends CommService {

     boolean fileMerge(String md5);
}
