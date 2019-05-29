package com.Music.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileUtils {
	/**
	 * 根据不同文件名将文件写入不同文件夹
	 * @param file  文件
	 * @param filename   文件名
	 * @param filepath   要写入的文件的路径   
	 * @return   path  带有文件名的路径
	 */
	// 根据文件名，存入不同的文件夹里
		public static String savefile(MultipartFile file, String filename, String filepath) {
			
			//解决文件名重复问题
			filename=UUID.randomUUID().toString()+"_"+filename;
			new File(filepath).mkdirs();
			String path = filepath+"/"+filename;
			try {
				InputStream in=file.getInputStream();
			    FileOutputStream fos=new FileOutputStream(path);
			    byte[] b=new byte[2048];
			    int len=in.read(b);
			    while(len!=-1){
			    	fos.write(b,0,len);
			    	len=in.read(b);
			    }
			    //关流
			    in.close();
			    fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return path;
		}
		/**
		 * 根据路径名删除文件
		 * @param path
		 * @throws IOException 
		 */
		public static void deleteFile(String path) throws IOException{
			File file=new File(path);
			file.getAbsoluteFile().delete();
		}
}
