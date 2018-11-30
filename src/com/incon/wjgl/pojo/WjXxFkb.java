package com.incon.wjgl.pojo;

import java.util.List;
import java.util.Map;

/**
 * @BelongsProject: incon4.1
 * @BelongsPackage: com.incon.wjgl.pojo
 * @Author: 爱迪生
 * @CreateTime: 2018-11-13 16:21
 * @Description: 文件表及文件分块表
 */
public class  WjXxFkb{

    private String md5;
    private String wjkmd5;
    private int wjksx;
    private byte[] wj;
    private String czsj;
    private String czrip;
    private String czrmac;

    private String lx;
    private String wjm;
    private String wjsm;
    private String wjwz;
    private String wzbs;
    private String stwjscbz;
    private String crsj;

    public String getWjm() {
        return wjm;
    }

    public String getLx() {
        return lx;
    }

    public void setLx(String lx) {
        this.lx = lx;
    }

    public void setWjm(String wjm) {
        this.wjm = wjm;
    }

    public String getWjsm() {
        return wjsm;
    }

    public void setWjsm(String wjsm) {
        this.wjsm = wjsm;
    }

    public String getWjwz() {
        return wjwz;
    }

    public void setWjwz(String wjwz) {
        this.wjwz = wjwz;
    }

    public String getWzbs() {
        return wzbs;
    }

    public void setWzbs(String wzbs) {
        this.wzbs = wzbs;
    }

    public String getStwjscbz() {
        return stwjscbz;
    }

    public void setStwjscbz(String stwjscbz) {
        this.stwjscbz = stwjscbz;
    }

    public String getCrsj() {
        return crsj;
    }

    public void setCrsj(String crsj) {
        this.crsj = crsj;
    }

    public String getWjkmd5() {
        return wjkmd5;
    }

    public void setWjkmd5(String wjkmd5) {
        this.wjkmd5 = wjkmd5;
    }

    public String getMd5() {
        return md5;
    }

    public void setMd5(String md5) {
        this.md5 = md5;
    }

    public int getWjksx() {
        return wjksx;
    }

    public void setWjksx(int wjksx) {
        this.wjksx = wjksx;
    }

    public byte[] getWj() {
        return wj;
    }

    public void setWj(byte[] wj) {
        this.wj = wj;
    }

    public String getCzsj() {
        return czsj;
    }

    public void setCzsj(String czsj) {
        this.czsj = czsj;
    }

    public String getCzrip() {
        return czrip;
    }

    public void setCzrip(String czrip) {
        this.czrip = czrip;
    }

    public String getCzrmac() {
        return czrmac;
    }

    public void setCzrmac(String czrmac) {
        this.czrmac = czrmac;
    }
}
