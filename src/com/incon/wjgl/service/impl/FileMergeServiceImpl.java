package com.incon.wjgl.service.impl;

import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.wjgl.pojo.WjXxFkb;
import com.incon.wjgl.service.FileMergeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 *@author:zh
 *@description:文件块合并公共类
 *@date:2018/11/16
 */
@Service(value="fileMergeService")
public class FileMergeServiceImpl extends CommServiceImpl implements FileMergeService {

    @Value("${breakpoint.upload.chunkSize}")
    private long CHUNK_SIZE;
    @Value("${breakpoint.upload.dir}")
    private String finalDirPath;

    private final Logger logger = LoggerFactory.getLogger(StorageServiceImpl.class);

    /**
     * 合并文件块
     * @param md5
     * @throws Exception
     */
    public boolean fileMerge(String md5){
        Long ss1 = new Date().getTime();
        try{
            int flag = 1;
            //查询文件信息
            WjXxFkb wjxx = (WjXxFkb)dbDao.queryForObject("wjgl.queryWjxxbByMd5",md5);
            WjXxFkb wjXxFkb = new WjXxFkb();
            if(!"0".equals(wjxx.getStwjscbz())){
                synchronized (this){
                    wjxx = (WjXxFkb)dbDao.queryForObject("wjgl.queryWjxxbByMd5",md5);
                    if(!"0".equals(wjxx.getStwjscbz())){
                        wjXxFkb.setStwjscbz("0");
                        wjXxFkb.setMd5(md5);
                        dbDao.update("wjgl.updWjxxStatus",wjXxFkb);
                    }else{
                        //等待生成其他线程生成完毕
                        flag = 0;
                    }
                }
            }
            if(flag == 1){
                //查询分块信息
                List<WjXxFkb> fkxxList = dbDao.query("wjgl.queryWjfkbByMd5Sx",md5);
                if(wjxx != null && fkxxList.size()>0){
                    //String tempFileNameReal = wjxx.getWjm()+"."+wjxx.getLx();
                    //String tempDirPath = finalDirPath + md5;
                    //String tempFileName = tempFileNameReal + "_tmp";
                    File tmpDir = new File(finalDirPath);
                    File tmpFile = new File(finalDirPath, md5);
                    if (!tmpDir.exists()) {
                        tmpDir.mkdirs();
                    }
                    for(WjXxFkb wjfkb : fkxxList){
                        RandomAccessFile accessTmpFile = new RandomAccessFile(tmpFile, "rw");
                        long offset = CHUNK_SIZE * wjfkb.getWjksx();
                        //定位到该分片的偏移量
                        accessTmpFile.seek(offset);
                        //写入该分片数据
                        accessTmpFile.write(wjfkb.getWj());
                        // 释放
                        accessTmpFile.close();
                    }
                    //可以使用线程生成文件，经测试，时间差不多
                    /*list2Str(fkxxList,4,tmpFile);
                    boolean bool = false;
                    while(!bool) {
                        if (tmpFile.exists()) {
                            bool = true;
                        }
                    }*/
                    //boolean bool = renameFile(tmpFile, tempFileNameReal);
                    wjXxFkb.setStwjscbz("1");
                    dbDao.update("wjgl.updWjxxStatus",wjXxFkb);
                    Long ss2 = new Date().getTime();
                    System.out.println("时间"+(ss2-ss1)+"----------------------------------------------------");
                    return true;
                }
                return false;
            }else{
                Boolean result = false;
                while(!result) {
                    try {
                        Thread.currentThread().sleep(5 * 1000); //设置暂停的时间5秒
                        wjxx = (WjXxFkb)dbDao.queryForObject("wjgl.queryWjxxbByMd5",md5);
                        if("1".equals(wjxx.getStwjscbz())){
                            break ;
                        }
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                return true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    /**
     * 文件重命名
     * @param toBeRenamed   将要修改名字的文件
     * @param toFileNewName 新的名字
     * @return
     */
    public boolean renameFile(File toBeRenamed, String toFileNewName) {
        //检查要重命名的文件是否存在，是否是文件
        if (!toBeRenamed.exists() || toBeRenamed.isDirectory()) {
            logger.info("文件不存在: " + toBeRenamed.getName());
            return false;
        }
        String p = toBeRenamed.getParent();
        File newFile = new File(p + File.separatorChar + toFileNewName);
        //修改文件名
        return toBeRenamed.renameTo(newFile);
    }

    /**
     * 多线程文件生成
     * @param list
     * @param nThreads
     * @param tmpFile
     * @throws Exception
     */
    public void list2Str(List<WjXxFkb> list, int nThreads,File tmpFile) throws Exception {
        int len=list.size()/nThreads;//平均分割List
        if(len==0){
            nThreads=list.size();//采用一个线程处理List中的一个元素
            len=list.size()/nThreads;//重新平均分割List
        }
        List<WjXxFkb> subListTemp;
        for (int i = 0; i < nThreads; i++) {
            if(i==nThreads-1){
                subListTemp =list.subList(i*len,list.size());
            }else{
                subListTemp =list.subList(i*len, len*(i+1)>list.size()?list.size():len*(i+1));
            }
            final List<WjXxFkb> subList = subListTemp;
            final File _tmpFile = tmpFile;
            new Thread() {
                public void run() {
                    for (WjXxFkb wjfkb : subList) {
                        try {
                            //sb.append(str);
                            RandomAccessFile accessTmpFile = new RandomAccessFile(_tmpFile, "rw");
                            long offset = CHUNK_SIZE * wjfkb.getWjksx();
                            //定位到该分片的偏移量
                            accessTmpFile.seek(offset);
                            //写入该分片数据
                            accessTmpFile.write(wjfkb.getWj());
                            // 释放
                            accessTmpFile.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }.start();

        }
    }

}
