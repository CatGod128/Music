package com.Music.back.Service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.Music.Bean.Artist;
import com.Music.back.Mapper.ArtistMapper;
import com.Music.util.FileUtils;

@Service
public class ArtistService {

	@Autowired
	private ArtistMapper AM;

	public List<Artist> querylist() {
		// TODO Auto-generated method stub
		return AM.querylist();
	}
	
	public Artist getInfo(int id) {
		// TODO Auto-generated method stub
		return AM.getInfo(id);
	}

	public int update(HttpServletRequest req) {
		MultipartHttpServletRequest fileupUploadRequest = (MultipartHttpServletRequest) req;
    	MultipartFile File = fileupUploadRequest.getFile("AIFile");  //歌手图片
    	String Aname = req.getParameter("Aname");                    //歌手名称
    	String birthday = req.getParameter("birthday");              //歌手生日
    	String summary = req.getParameter("summary");                //歌手描述
    	Artist artist=new Artist();
    	String AIFPath;
    	//判断歌手图片文件是否为空
    	if(!File.isEmpty()){   //不为空需要更新    	
    		String path=AM.getAIPath(Aname);
    		int success=AM.isExit(path);
    			if(success<0){   //不共享一张
    			try {
    				FileUtils.deleteFile(path);
    			} catch (IOException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    		}
    		String AIPath = "UploadFile/ArtistImgs";// 歌曲图片
    		AIFPath=FileUtils.savefile(File,File.getOriginalFilename(),AIPath);
    		artist.setAIPath(AIFPath);		
    	}else{
    		String path=AM.getAIPath(Aname);
        	artist.setAIPath(path);
    	}	
    	artist.setBirthday(birthday);
		artist.setSummary(summary);
		artist.setAName(Aname);
		int success=AM.update(artist);
		return success;
	}



}
