package com.incon.framework.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.Locale;

import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;
import org.apache.tools.zip.ZipOutputStream;

/**
 * @类名：com.incon.common.util.FileUtil
 * @作者：Linls
 * @时间：2012-10-11
 * @版本：
 * @描述：文件操作工具类
 * @修改人员：
 * @修改时间：2012-10-11
 * @修改说明：
 */
public class FileUtil {
	
	private static final int BUFFER_SIZE = 2 * 1024;
	/**
	 * 文件复制
	 * @param resourceFileName 源文件的路径名称
	 * @param targetFileName 目的文件的路径名称
	 * @return
	 * @throws IOException
	 */
	public static boolean copyFile( String resourceFileName, String targetFileName) throws IOException {
		return copyFile(new File(resourceFileName), new File(targetFileName));
	}

	/**
	 * 文件复制
	 * @param resourceFimeName 源文件的路径名称
	 * @param targetFile 目的文件
	 * @return
	 * @throws IOException
	 */
	public static boolean copyFile( String resourceFimeName, File targetFile) throws IOException {
		return copyFile(new File(resourceFimeName), targetFile);
	}

	/**
	 * 文件复制
	 * @param resourceFile 源文件
	 * @param targetFileName 目的文件的路径名称
	 * @return
	 * @throws IOException
	 */
	public static boolean copyFile( File resourceFile, String targetFileName) throws IOException {
		return copyFile( resourceFile, new File(targetFileName));
	}

	/**
	 * 文件复制
	 * @param resourceFile 源文件
	 * @param targetFile 目的文件
	 * @return
	 * @throws IOException
	 */
	public static boolean copyFile(File resourceFile, File targetFile) throws IOException {
		if (resourceFile == null || targetFile == null) return false;
		if (resourceFile.exists()) {
			if (!targetFile.exists()) {
				File parentFile = targetFile.getParentFile();
				if (!parentFile.exists())
					parentFile.mkdirs();
				targetFile.createNewFile();
			}
			FileInputStream in = new FileInputStream(resourceFile);
			FileOutputStream out = new FileOutputStream(targetFile);
			byte[] buffer = new byte[1024 * 8];
			int i = 0;
			while ((i = in.read(buffer)) != -1) {
				out.write(buffer, 0, i);
			}
			out.flush();
			return true;
		} else {
			return false;
		}
	}
	/**
	 * 分段复制文件
	 * @param resourceFile 源文件
	 * @param targetFile 目的文件
	 * @throws IOException 
	 */
	public static void copyChunkFile(File resourceFile, File targetFile) throws IOException {
		InputStream in = new BufferedInputStream(new FileInputStream(resourceFile), BUFFER_SIZE);
		OutputStream out = null;
		if (targetFile.exists()) {
			out = new BufferedOutputStream(new FileOutputStream(targetFile, true), BUFFER_SIZE);
		} else {
			out = new BufferedOutputStream(new FileOutputStream(targetFile), BUFFER_SIZE);
		}
		byte[] buffer = new byte[BUFFER_SIZE];
		int len = 0;
		while ((len = in.read(buffer)) > 0) {
			out.write(buffer, 0, len);
		}
		if (null != in) {
			in.close();
		}
		if (null != out) {
			out.close();
		}
	}
	
	/**
	 * 文件删除 
	 * @param fileName 文件的路径
	 */
	public static void deleteFile(String fileName) {
		if (fileName != null) {
			deleteFile(new File(fileName));
		}
	}

	/**
	 * 文件删除
	 * @param file 文件
	 */
	public static void deleteFile(File file) {
		if (file != null && file.exists()) {
			file.delete();
		}
	}

	/**
	 * 获取当前时间获取文件名
	 */
	public static String getFileNameByTime() {
		int i = 0;
		Calendar date = Calendar.getInstance(Locale.CHINESE);
		StringBuffer fileName = new StringBuffer();
		if (i == 100)
			i = 0;
		if (i <= 9) {
			fileName.append(date.get(Calendar.YEAR))
					.append(date.get(Calendar.MONTH) + 1)
					.append(date.get(Calendar.DAY_OF_MONTH))
					.append(date.get(Calendar.HOUR_OF_DAY))
					.append(date.get(Calendar.MINUTE))
					.append(date.get(Calendar.MILLISECOND)).append("00")
					.append(i);
		} else {
			fileName.append(date.get(Calendar.YEAR))
					.append(date.get(Calendar.MONTH) + 1)
					.append(date.get(Calendar.DAY_OF_MONTH))
					.append(date.get(Calendar.HOUR_OF_DAY))
					.append(date.get(Calendar.MINUTE))
					.append(date.get(Calendar.MILLISECOND)).append("0")
					.append(i);
		}
		return fileName.toString();
	}
	
	/**
	 * 压缩文件
	 * @param inputFileName 要压缩的文件或文件夹路径，例如：c://a.txt,c://a/
	 * @param outputFileName 输出zip文件的路径，例如：c://a.zip
	 */
	public static void zip(String inputFileName, String outputFileName) throws Exception {
		ZipOutputStream out = new ZipOutputStream(new FileOutputStream(outputFileName));
		zip(out, new File(inputFileName), "");
		out.setEncoding("gbk");
		out.closeEntry();
		out.close();
	}

	/**
	 * 压缩文件
	 * @param out org.apache.tools.zip.ZipOutputStream
	 * @param file 待压缩的文件
	 * @param base 压缩的根目录
	 */
	private static void zip(ZipOutputStream out, File file, String base) throws Exception {
		if (file.isDirectory()) {
			File[] fl = file.listFiles();
			base = base.length() == 0 ? "" : base + File.separator;
			for (int i = 0; i < fl.length; i++) {
				zip(out, fl[i], base + fl[i].getName());
			}
		} else {
			out.putNextEntry(new ZipEntry(base));
			FileInputStream in = new FileInputStream(file);
			int b;
			while ((b = in.read()) != -1) {
				out.write(b);
			}
			in.close();
		}
	}

	/**
	 * 解压zip文件
	 * @param zipFileName 待解压的zip文件路径，例如：c://a.zip
	 * @param outputDirectory 解压目标文件夹,例如：c://a/
	 */
	public static void unZip(String zipFileName, String outputDirectory) throws Exception {
		ZipFile zipFile = new ZipFile(zipFileName);
		try {
			Enumeration<?> e = zipFile.getEntries();
			ZipEntry zipEntry = null;
			createDirectory(outputDirectory, "");
			while (e.hasMoreElements()) {
				zipEntry = (ZipEntry) e.nextElement();
				if (zipEntry.isDirectory()) {
					String name = zipEntry.getName();
					name = name.substring(0, name.length() - 1);
					File f = new File(outputDirectory + File.separator + name);
					f.mkdir();
				} else {
					String fileName = zipEntry.getName();
					fileName = fileName.replace("//", "/");
					if (fileName.indexOf("/") != -1) {
						createDirectory(outputDirectory, fileName.substring(0, fileName.lastIndexOf("/")));
						fileName = fileName.substring(fileName.lastIndexOf("/") + 1, fileName.length());
					}
					File f = new File(outputDirectory + File.separator + zipEntry.getName());
			        File parent = f.getParentFile();  
			        if(parent!=null&&!parent.exists()){  
			            parent.mkdirs();  
			        } 
					f.createNewFile();
					InputStream in = zipFile.getInputStream(zipEntry);
					FileOutputStream out = new FileOutputStream(f);
					byte[] by = new byte[1024];
					int c;
					while ((c = in.read(by)) != -1) {
						out.write(by, 0, c);
					}
					in.close();
					out.close();
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex.getMessage());
		} finally {
			zipFile.close();
		}
	}
	
	/**
	 * 创建文件夹
	 * @param directory
	 * @param subDirectory
	 */
	private static void createDirectory(String directory, String subDirectory) {
		String dir[];
		File fl = new File(directory);
		try {
			if (subDirectory == "" && fl.exists() != true) {
				fl.mkdir();
			} else if (subDirectory != "") {
				dir = subDirectory.replace("//", "/").split("/");
				for (int i = 0; i < dir.length; i++) {
					File subFile = new File(directory + File.separator + dir[i]);
					if (subFile.exists() == false)
						subFile.mkdir();
					directory += File.separator + dir[i];
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	/**
	 * 拷贝文件夹中的所有文件到另外一个文件夹
	 * @param srcDirector 源文件夹
	 * @param desDirector 目标文件夹
	 */
	public static void copyFileWithDirector(String srcDirector, String desDirector) throws IOException {
		(new File(desDirector)).mkdirs();
		File[] file = (new File(srcDirector)).listFiles();
		for (int i = 0; i < file.length; i++) {
			if (file[i].isFile()) {
				FileInputStream input = new FileInputStream(file[i]);
				FileOutputStream output = new FileOutputStream(desDirector + "/" + file[i].getName());
				byte[] b = new byte[1024 * 5];
				int len;
				while ((len = input.read(b)) != -1) {
					output.write(b, 0, len);
				}
				output.flush();
				output.close();
				input.close();
			}
			if (file[i].isDirectory()) {
				copyFileWithDirector(srcDirector + "/" + file[i].getName(), desDirector + "/" + file[i].getName());
			}
		}
	}

	/**
	 * 删除文件夹
	 * @param folderPath folderPath 文件夹完整绝对路径
	 */
	public static void delFolder(String folderPath) throws Exception {
		//删除完里面所有内容
		delAllFile(folderPath);
		String filePath = folderPath;
		filePath = filePath.toString();
		File myFilePath = new File(filePath);
		//删除空文件夹
		myFilePath.delete();
	}

	/**
	 * 删除指定文件夹下所有文件
	 * @param path 文件夹完整绝对路径
	 */
	public static boolean delAllFile(String path) throws Exception {
		boolean flag = false;
		File file = new File(path);
		if (!file.exists()) {
			return flag;
		}
		if (!file.isDirectory()) {
			return flag;
		}
		String[] tempList = file.list();
		File temp = null;
		for (int i = 0; i < tempList.length; i++) {
			if (path.endsWith(File.separator)) {
				temp = new File(path + tempList[i]);
			} else {
				temp = new File(path + File.separator + tempList[i]);
			}
			if (temp.isFile()) {
				temp.delete();
			}
			if (temp.isDirectory()) {
				//先删除文件夹里面的文件
				delAllFile(path + "/" + tempList[i]);
				//再删除空文件夹
				delFolder(path + "/" + tempList[i]);
				flag = true;
			}
		}
		return flag;
	}
	/**
	 * File转比特
	 * @param file 文件路径
	 * @return
	 */
	public static byte[] getBytesFromFile(File file){
		if (file == null){
			return null;
		}
		try {
			FileInputStream stream = new FileInputStream(file);
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
	
	/**
	 * 比特转文件
	 * @param b byte流文件
	 * @param outputFile 输出路径
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
	
	/**
	 * 过滤特殊字符
	 * @param str 需要过滤字符串
	 * @return
	 */
	public static String replace(String str) {
		String[] charArr= {"\\","/",":","*","?","\"","<",">","|"," "};
		for (int i = 0; i < charArr.length; i++) {
			str = str.replace(charArr[i], "-");
		}
		return str;
	}
	
	public static void main(String[]args) throws Exception{
		//FileUtil.unZip("e:"+File.separator+"abcd.zip", "e:"+File.separator+"TEST-1");	
		FileUtil.unZip("e:"+File.separator+"websites-TEST-1-upload.zip", "e:"+File.separator+"TEST-1");	
	}
	
	/**
	 * 读取到字节数组2
	 * 
	 * @param filePath
	 * @return
	 * @throws IOException
	 */
	public static byte[] toByteArray2(String filePath) throws IOException {

		File f = new File(filePath);
		if (!f.exists()) {
			throw new FileNotFoundException(filePath);
		}

		FileChannel channel = null;
		FileInputStream fs = null;
		try {
			fs = new FileInputStream(f);
			channel = fs.getChannel();
			ByteBuffer byteBuffer = ByteBuffer.allocate((int) channel.size());
			while ((channel.read(byteBuffer)) > 0) {
				// do nothing
				// System.out.println("reading");
			}
			return byteBuffer.array();
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				channel.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				fs.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}