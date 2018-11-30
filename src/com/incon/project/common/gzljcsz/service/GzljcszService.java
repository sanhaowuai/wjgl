package com.incon.project.common.gzljcsz.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.project.common.gzljcsz.page.FuzhiPage;
import com.incon.project.common.gzljcsz.page.FuzhilcPage;
import com.incon.project.common.gzljcsz.page.YwlcBlPage;
import com.incon.project.common.gzljcsz.page.YwlcdmbPage;
import com.incon.pojo.common.gzljcsz.*;


public interface GzljcszService extends CommService {
  public  Integer copyYwlcbbh(FuzhiPage fuzhipage);
  public  Integer copyYwlc(FuzhilcPage fuzhilcpage);
  public  Integer querypzsfcz(YwlcBlPage  ywlcbl);
  public  Integer querypdslcz(YwlcdmbPage  ywlcdmbPage);
  public  Integer querysffgbbh(FuzhiPage fuzhipage);
  
   
  public   YwDmxlhEntity  queryDmxlh(String id);
  
 
  public List<YwlcYmxlhEntity> queryLcxlh (YwDmxlhEntity ywDmxlhEntity);
  
  public List<YwlcBlxlhEnntity> queryBlxlh (YwDmxlhEntity ywDmxlhEntity);
  
  public String queryDmxlhSfcz(YwDmxlhEntity ywDmxlhEntity);
  
  
  public void addDmxlh(List<YwDmxlhEntity> list);
  
  
  
  
}
