package com.incon.framework.util;

import java.io.File;
import java.util.List;

public class ConvertSingleVideo {

	private static String ffmpeg_home = "D:\\test\\ffmpeg.exe";	// ffmpeg.exe所放的路径

	public static String inputFile_home  = "D:\\test\\";		// 需转换的文件的位置
	public static String outputFile_home = "D:\\test\\";		// 转换后的flv文件所放的文件夹位置

	public ConvertSingleVideo() {
	}
	public ConvertSingleVideo(String ffmpegFile,String inputFile,String outputFile) {
		ffmpeg_home = ffmpegFile;	// ffmpeg.exe所放的路径
		inputFile_home  = inputFile;// 需转换的文件的位置
		outputFile_home = outputFile;// 转换后的flv文件所放的文件夹位置
	}

	/**
	 * 功能函数
	 * 
	 * @param inputFile
	 *            待处理视频，需带路径
	 * @param outputFile
	 *            处理后视频，需带路径
	 * @return
	 */
	public boolean convert(String inputFile, String outputFile) {
		if (!checkfile(inputFile)) {
			System.out.println(inputFile + " is not file");
			return false;
		}
		if (process(inputFile, outputFile)) {
			System.out.println("ok");
			return true;
		}
		return false;
	}

	// 检查文件是否存在
	private boolean checkfile(String path) {
		File file = new File(path);
		if (!file.isFile()) {
			return false;
		}
		return true;
	}

	/**
	 * 转换过程
	 * @param inputFile
	 * @param outputFile
	 * @return
	 */
	private boolean process(String inputFile, String outputFile) {
		int type = checkContentType(inputFile);
		boolean status = false;
		if (type == 0) {
			status = processFLV(inputFile, outputFile);// 直接将文件转为flv文件
			processJPG(inputFile, inputFile.substring(0,inputFile.lastIndexOf(".") + 1)+"jpg");
		}
		return status;
	}

	/**
	 * 检查视频类型
	 * 
	 * @param inputFile
	 * @return ffmpeg 能解析返回0，不能解析返回1
	 */
	private int checkContentType(String inputFile) {
		String type = inputFile.substring(inputFile.lastIndexOf(".") + 1,inputFile.length()).toLowerCase();
		// ffmpeg能解析的格式：（asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv，rmvb，rm等）
		if (type.equals("avi")) {
			return 0;
		} else if (type.equals("mpg")) {
			return 0;
		} else if (type.equals("mpeg")) {
			return 0;
		} else if (type.equals("wmv")) {
			return 0;
		} else if (type.equals("3gp")) {
			return 0;
		} else if (type.equals("mov")) {
			return 0;
		} else if (type.equals("mp4")) {
			return 0;
		} else if (type.equals("asf")) {
			return 0;
		} else if (type.equals("asx")) {
			return 0;
		} else if (type.equals("flv")) {
			return 0;
		} else if (type.equals("rm")) {
			return 0;
		} else if (type.equals("rmvb")) {
			return 0;
		} else if (type.equals("wmv9")) {
			return 1;
		}
		return 9;
	}

	/**
	 * ffmepg: 能解析的格式：（asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv等）
	 * 
	 * @param inputFile
	 * @param outputFile
	 * @return
	 */
	private boolean processFLV(String inputFile, String outputFile) {
		if (!checkfile(inputFile)) {
			System.out.println(inputFile + " is not file");
			return false;
		}
		File file = new File(outputFile);
		if (file.exists()) {
			System.out.println("flv文件已经存在！无需转换");
			return true;
		} else {
			System.out.println("正在转换成flv文件……");

			List<String> commend = new java.util.ArrayList<String>();
			// 低精度
			commend.add(ffmpeg_home);
			commend.add("-i");
			commend.add(inputFile);
			commend.add("-ab");
			commend.add("128");
			commend.add("-acodec");
			commend.add("libmp3lame");
			commend.add("-ac");
			commend.add("1");
			commend.add("-ar");
			commend.add("22050");
			commend.add("-r");
			commend.add("29.97");
			// 清晰度 -qscale 4 为最好但文件大, -qscale 6就可以了
			commend.add("-qscale");
			commend.add("4");
			commend.add("-y");
			commend.add(outputFile);
			StringBuffer test = new StringBuffer();
			for (int i = 0; i < commend.size(); i++)
				test.append(commend.get(i) + " ");
			System.out.println(test);
			try {
				ProcessBuilder builder = new ProcessBuilder();
				builder.command(commend);
				builder.start();
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}

		}

	}

	
	private boolean processJPG(String inputFile, String outputFile) {
		if (!checkfile(inputFile)) {
			System.out.println(inputFile + " is not file");
			return false;
		}
		File file = new File(outputFile);
		if (file.exists()) {
			System.out.println("jpg文件已经存在！无需转换");
			return true;
		} else {
			System.out.println("正在转换成jpg文件……");

			List<String> commend = new java.util.ArrayList<String>();
			// ffmpeg -i test.asf -y -f  image2  -ss 00:01:00 -vframes 1  test1.jpg
			commend.add(ffmpeg_home);
			commend.add("-i");
			commend.add(inputFile);
			commend.add("-y");
			commend.add("-f");
			commend.add("image2");
			commend.add("-ss");
			commend.add("00:00:01");
			commend.add("-vframes");
			commend.add("1");
			commend.add(outputFile);
			StringBuffer test = new StringBuffer();
			for (int i = 0; i < commend.size(); i++)
				test.append(commend.get(i) + " ");
			System.out.println(test);
			try {
				ProcessBuilder builder = new ProcessBuilder();
				builder.command(commend);
				builder.start();
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}

		}

	}
	
	
	//public static void main(String[] args) {
		//ConvertSingleVideo conver = new ConvertSingleVideo("D:\\oracle\\Middleware\\user_projects\\domains\\base_domain_new\\autodeploy\\ispace3.0\\WEB-INF\\cgi-bin\\ffmpeg.exe","D:\\oracle\\Middleware\\user_projects\\domains\\base_domain_new\\autodeploy\\ispace3.0\\upload\\1\\","D:\\oracle\\Middleware\\user_projects\\domains\\base_domain_new\\autodeploy\\ispace3.0\\upload\\1\\");
		//conver.convert(ConvertSingleVideo.inputFile_home + "aaa.mp4", ConvertSingleVideo.outputFile_home + "aaa.flv");
	//}
	
}