package com.incon.wjgl.service.impl;

import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.wjgl.param.MultipartFileParam;
import com.incon.wjgl.pojo.WjXxFkb;
import com.incon.wjgl.service.FileMergeService;
import com.incon.wjgl.service.StorageService;
import com.incon.wjgl.utils.IpMacUtil;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 *@author:zh
 *@description:大文件上传及下载实现
 *@date:2018/11/12
 */
@Service(value= "storageService")
public class StorageServiceImpl extends CommServiceImpl implements StorageService {

    private final Logger logger = LoggerFactory.getLogger(StorageServiceImpl.class);
    // 保存文件的根目录
    /*private Path rootPaht;*/

    @Autowired
    private FileMergeService fileMergeService;

    //这个必须与前端设定的值一致
    @Value("${breakpoint.upload.chunkSize}")
    private long CHUNK_SIZE;

    @Value("${breakpoint.upload.dir}")
    private String finalDirPath;

    /*@Autowired
    public StorageServiceImpl(@Value("${breakpoint.upload.dir}") String location) {
        this.rootPaht = Paths.get(location);
    }*/

    /*@Override
    public void deleteAll() {
        logger.info("开发初始化清理数据，start");
        FileSystemUtils.deleteRecursively(rootPaht.toFile());
        stringRedisTemplate.delete(Constants.FILE_UPLOAD_STATUS);
        stringRedisTemplate.delete(Constants.FILE_MD5_KEY);
        logger.info("开发初始化清理数据，end");
    }*/

    /*@Override
    public void init() {
        try {
            Files.createDirectory(rootPaht);
        } catch (FileAlreadyExistsException e) {
            logger.error("文件夹已经存在了，不用再创建。");
        } catch (IOException e) {
            logger.error("初始化root文件夹失败。", e);
        }
    }*/

    @Override
    public   void uploadFileRandomAccessFile(MultipartFileParam param, HttpServletRequest request) throws IOException {
        String fileName = param.getName();
        String tempDirPath = finalDirPath;
        File tmpDir = new File(tempDirPath);
        if (!tmpDir.exists()) {
            tmpDir.mkdirs();
        }

        //写入文件信息表，判断是否存在实体
        try {
            String ip = IpMacUtil.getIpAddr(request);
            String mac = IpMacUtil.getMACAddress(ip);
            WjXxFkb wjXxFkb = new WjXxFkb();
            wjXxFkb.setMd5(param.getMd5());
            wjXxFkb.setCzrip(ip);
            wjXxFkb.setCzrmac(mac);
            WjXxFkb wjxx = (WjXxFkb)dbDao.queryForObject("wjgl.queryWjxxbByMd5",param.getMd5());
            if(wjxx == null){
                synchronized(this){
                    wjxx = (WjXxFkb)dbDao.queryForObject("wjgl.queryWjxxbByMd5",param.getMd5());
                    if(wjxx == null){
                        String lx = "";
                        String fileNameReal = "";
                        if(fileName.contains(".")){
                            lx = fileName.substring(fileName.lastIndexOf(".")+1);
                            fileNameReal = fileName.substring(0,fileName.lastIndexOf("."));
                        }else{
                            fileNameReal = fileName;
                        }
                        wjXxFkb.setLx(lx);
                        wjXxFkb.setWjm(fileNameReal);
                        wjXxFkb.setCrsj(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                        dbDao.insert("wjgl.saveWjxx",wjXxFkb);
                    }
                }
            }
            //写入文件分块表
            wjXxFkb.setWjksx(param.getChunk());
            wjXxFkb.setWjkmd5(param.getMd5()+"_"+param.getChunk());
            wjXxFkb.setWj(param.getFile().getBytes());
            wjXxFkb.setCzsj(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            dbDao.insert("wjgl.saveWjfkb",wjXxFkb);

        } catch (Exception e) {
            e.printStackTrace();
        }

        boolean isOk = checkAndSetUploadProgress(param, tempDirPath);
        //数据库上传完毕，调用文件合成公共类
        if (isOk) {
            final MultipartFileParam _param = param;
            new Thread() {
                @Override
                public void run() {
                    fileMergeService.fileMerge(_param.getMd5());
                }
            }.start();

            //测试并发的情况
            /*int count = 3;
            for (int i = 0; i < count; i++) {
                new Thread() {
                    public void run() {
                        fileMergeService.fileMerge(_param.getMd5());
                    }
                }.start();
            }*/
        }
    }
    /**
     * 检查并修改文件上传进度
     *
     * @param param
     * @param uploadDirPath
     * @return
     * @throws IOException
     */
    private boolean checkAndSetUploadProgress(MultipartFileParam param, String uploadDirPath) throws IOException {
        /*String fileName = param.getName();
        File confFile = new File(uploadDirPath, fileName + ".conf");*/
        File confFile = new File(uploadDirPath, param.getMd5() + ".conf");
        RandomAccessFile accessConfFile = new RandomAccessFile(confFile, "rw");
        //把该分段标记为 true 表示完成
        System.out.println("set part " + param.getChunk() + " complete");
        accessConfFile.setLength(param.getChunks());
        accessConfFile.seek(param.getChunk());
        accessConfFile.write(Byte.MAX_VALUE);

        //completeList 检查是否全部完成,如果数组里是否全部都是(全部分片都成功上传)
        byte[] completeList = FileUtils.readFileToByteArray(confFile);
        byte isComplete = Byte.MAX_VALUE;
        for (int i = 0; i < completeList.length && isComplete == Byte.MAX_VALUE; i++) {
            //与运算, 如果有部分没有完成则 isComplete 不是 Byte.MAX_VALUE
            isComplete = (byte) (isComplete & completeList[i]);
            System.out.println("check part " + i + " complete?:" + completeList[i]);
        }
        accessConfFile.close();
        WjXxFkb wjXxFkb = new WjXxFkb();
        if (isComplete == Byte.MAX_VALUE) {
            wjXxFkb.setMd5(param.getMd5());
            wjXxFkb.setWzbs("1");
            wjXxFkb.setWjwz(uploadDirPath);
            dbDao.update("wjgl.updWjxxStatus",wjXxFkb);
            //删除临时conf
            confFile.delete();
            return true;
        } else {
            //查询是否需要更新
            WjXxFkb wjxx = (WjXxFkb)dbDao.queryForObject("wjgl.queryWjxxbByMd5",param.getMd5());
            if(wjxx != null && wjxx.getWzbs()==null){
                wjXxFkb.setWzbs("0");
            }
            if(wjxx != null && wjxx.getWjwz()==null){
                wjXxFkb.setWjwz(uploadDirPath);
            }
            wjXxFkb.setMd5(param.getMd5());
            dbDao.update("wjgl.updWjxxStatus",wjXxFkb);
            return false;
        }
    }
}
