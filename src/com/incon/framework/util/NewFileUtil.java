package com.incon.framework.util;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

 /**
  * 
  * @author zhaoxi
  *
  */
public class NewFileUtil {
	/**
	 * File转比特
	 * @param f
	 * @return
	 */
	public static byte[] getBytesFromFile(File f){
	     if (f == null){
	         return null;
	    }
	     try {
	         FileInputStream stream = new FileInputStream(f);
	         ByteArrayOutputStream out = new ByteArrayOutputStream(1000);
	         byte[] b = new byte[1000];
	         int n;
	         while ((n = stream.read(b)) != -1)
	             out.write(b, 0, n);
	          stream.close();
	          out.close();
	          return out.toByteArray();
	      } catch (IOException e){
	     }
	      return null;
	   }
	public static byte[] getBytesFromFile(InputStream inputStream){
	    if (inputStream == null){
	         return null;
	    }
	     try {
	         FileInputStream stream = (FileInputStream) inputStream;
	         ByteArrayOutputStream out = new ByteArrayOutputStream(1000);
	         byte[] b = new byte[1000];
	         int n;
	         while ((n = stream.read(b)) != -1)
	             out.write(b, 0, n);
	          stream.close();
	          out.close();
	          return out.toByteArray();
	      } catch (IOException e){
	     }
	      return null;
	   }
    public static final byte[] input2byte(InputStream inStream)  
            throws IOException {  
        ByteArrayOutputStream swapStream = new ByteArrayOutputStream();  
        byte[] buff = new byte[100];  
        int rc = 0;  
        while ((rc = inStream.read(buff, 0, 100)) > 0) {  
            swapStream.write(buff, 0, rc);  
        }  
        byte[] in2b = swapStream.toByteArray();  
        return in2b;  
    } 
    public static final InputStream byte2Input(byte[] buf) {  
        return new ByteArrayInputStream(buf);  
    }  
      
	/**
	 * 比特转文件
	 * @param b
	 * @param outputFile
	 * @return
	 */
	 public static File getFileFromBytes(byte[] b, String outputFile) {
	      BufferedOutputStream stream = null;
	       File file = null;
	       try {
	      file = new File(outputFile);
	           FileOutputStream fstream = new FileOutputStream(file);
	           stream = new BufferedOutputStream(fstream);
	           stream.write(b);
	       } catch (Exception e) {
	           e.printStackTrace();
	      } finally {
	          if (stream != null) {
	               try {
	                  stream.close();
	               } catch (IOException e1) {
	                  e1.printStackTrace();
	              }
	          }
	      }
	       return file;
	   }
}
