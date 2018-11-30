package com.incon.wjgl.controller;

import com.incon.wjgl.page.WjglPage;
import com.incon.wjgl.param.MultipartFileParam;
import com.incon.wjgl.pojo.WjXxFkb;
import com.incon.wjgl.service.FileMergeService;
import com.incon.wjgl.service.StorageService;
import com.incon.wjgl.vo.ResultStatus;
import com.incon.wjgl.vo.ResultVo;
import net.sf.json.JSONObject;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

/**
 *@author:zh
 *@description:上传控制层
 *@date:2018/11/16
 */
@Controller
@RequestMapping(value = "/wjglindex")
public class IndexController {

    private Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private StorageService storageService;

    @Autowired
    private FileMergeService fileMergeService;

    /**
     * 文件管理List
     * @param model
     * @param wjglPage
     * @return
     */
    @RequestMapping(value = "/wjglList")
    public String wjglList(Model model, WjglPage wjglPage) {

        List<WjXxFkb> wjxxfkbList = storageService.query(wjglPage);
        model.addAttribute("wjxxfkbList",wjxxfkbList);
        return "wjgl/wjglList";
        //return "wjgl/wjsc";
    }

    /**
     * 文件上传页面
     * @return
     */
    @RequestMapping(value = "/wjsc")
    public String scwjIndex() {

        //return "wjgl/wjsc_bak";
        return "wjgl/wjsc";
    }

    /**
     * 秒传判断，断点判断
     * @param md5
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "checkFileMd5", method = RequestMethod.POST)
    @ResponseBody
    public Object checkFileMd5(String md5) throws IOException {

        WjXxFkb wjxx = (WjXxFkb)storageService.queryForObject("wjgl.queryWjxxbByMd5",md5);
        String processingObj = "";
        if(wjxx != null){
            processingObj = wjxx.getWzbs();
        }
        if (processingObj == null || "".equals(processingObj)) {
            return new ResultVo(ResultStatus.NO_HAVE);
            //因为ResultVo中d含有null,net.sf.json.JSONObject这个版本转化时会报错。
            /*ResultVo resultVo = new ResultVo(ResultStatus.NO_HAVE);
            return JSONObject.fromObject(resultVo);*/
        }
        boolean processing = "1".equals(processingObj);
        String value = "";
        //存在，返回路径信息
        if (processing) {
            value = wjxx.getWjwz()+ wjxx.getMd5();
            ResultVo resultVo = new ResultVo(ResultStatus.IS_HAVE, value);
            return JSONObject.fromObject(resultVo);
        //上传一部分的情况
        } else {
            value = wjxx.getWjwz()+ wjxx.getMd5() + ".conf";
            File confFile = new File(value);
            byte[] completeList = FileUtils.readFileToByteArray(confFile);
            List<String> missChunkList = new LinkedList<>();
            for (int i = 0; i < completeList.length; i++) {
                if (completeList[i] != Byte.MAX_VALUE) {
                    missChunkList.add(i + "");
                }
            }
            //return new ResultVo<>(ResultStatus.ING_HAVE, missChunkList);
            ResultVo resultVo = new ResultVo<>(ResultStatus.ING_HAVE, missChunkList);
            return JSONObject.fromObject(resultVo);
        }
    }

    /**
     * 上传文件
     * @param param
     * @param request
     * @return
     */
    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity fileUpload(MultipartFileParam param, HttpServletRequest request) {

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            logger.info("上传文件start。");
            try {
                storageService.uploadFileRandomAccessFile(param,request);
            } catch (IOException e) {
                e.printStackTrace();
                logger.error("文件上传失败。{}", param.toString());
            }
            logger.info("上传文件end。");
        }
        //return ResponseEntity.ok().body("上传成功。");
        return  new ResponseEntity("上传成功。",HttpStatus.OK);
    }

    /**
     * 取消按钮点击时，删除库及本地conf文件
     * @param md5
     * @return
     */
    @RequestMapping(value = "deleteDb")
    @ResponseBody
    public String deleteDb(String md5){

        String res = "0";
        //如果完整标识是1,则说明上传完成，不删除，若不是，则上传部分，需要删除
        WjXxFkb wjXxFkb = (WjXxFkb)storageService.queryForObject("wjgl.queryWzbs",md5);
        if(wjXxFkb != null){
            if(("0").equals(wjXxFkb.getWzbs())){
                try {
                    storageService.delete("wjgl.deleteDb",md5);
                    File confFile = new File(wjXxFkb.getWjwz(), wjXxFkb.getMd5() + ".conf");
                    confFile.delete();
                    res = "1";
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }
        return res;
    }

    /**
     * 下载
     * @param md5
     * @param response
     * @param request
     * @return
     */
    @RequestMapping(value = "downLoadFile")
    public String downLoadFile(String md5, HttpServletResponse response,HttpServletRequest request){

        WjXxFkb wjXxFkb = (WjXxFkb)storageService.queryForObject("wjgl.queryWzbs",md5);
        //文件位置
        String downLoadPath = wjXxFkb.getWjwz()+md5;
        File file = new File(downLoadPath);
        //文件不存在，需数据库生成
        if(!file.exists()){
            if(!fileMergeService.fileMerge(md5)){
                return "数据损坏，请联系管理员！";
            }
        }
        //文件名
        String fileName = "";
        if(wjXxFkb.getLx() !=null &&!("").equals(wjXxFkb.getLx())){
            fileName = wjXxFkb.getWjm()+"."+wjXxFkb.getLx();
        }else{
            fileName = wjXxFkb.getWjm();
        }
        response.setContentType("text/html;charset=utf-8");
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }
        java.io.BufferedInputStream bis = null;
        java.io.BufferedOutputStream bos = null;
        try {
            long fileLength = new File(downLoadPath).length();
            response.setContentType("application/x-msdownload;");
            response.setHeader("Content-disposition", "attachment; filename=" + new String(fileName.getBytes("utf-8"), "ISO8859-1"));
            response.setHeader("Content-Length", String.valueOf(fileLength));
            bis = new BufferedInputStream(new FileInputStream(downLoadPath));
            bos = new BufferedOutputStream(response.getOutputStream());
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (bis != null)
                try {
                    bis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            if (bos != null)
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
        }
        return null;
    }

    /**
     * 删除
     * @param ids
     * @return
     */
    @RequestMapping("delBatchOrSingle")
    @ResponseBody
    public String delXwlbBatch(String[] ids,String md5Single){
        File file;
        WjXxFkb wjXxFkb;
        if(ids !=null && ids.length > 0){
            for(String md5 :ids){
                wjXxFkb = (WjXxFkb)storageService.queryForObject("wjgl.queryWzbs",md5);
                storageService.delete("wjgl.deleteDb",md5);
                file = new File(wjXxFkb.getWjwz(), wjXxFkb.getMd5());
                if(file.exists()){
                    file.delete();
                }
                file = new File(wjXxFkb.getWjwz(), wjXxFkb.getMd5() + ".conf");
                if(file.exists()){
                    file.delete();
                }
            }
        }else{
            wjXxFkb = (WjXxFkb)storageService.queryForObject("wjgl.queryWzbs",md5Single);
            storageService.delete("wjgl.deleteDb",md5Single);
            file = new File(wjXxFkb.getWjwz(), wjXxFkb.getMd5());
            if(file.exists()){
                file.delete();
            }
            file = new File(wjXxFkb.getWjwz(), wjXxFkb.getMd5() + ".conf");
            if(file.exists()){
                file.delete();
            }
        }
        return null;
    }

}
