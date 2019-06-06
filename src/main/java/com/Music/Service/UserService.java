package com.Music.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.Music.Bean.Music;
import com.Music.Bean.MusicPojo;
import com.Music.Bean.User;
import com.Music.back.Mapper.UserMapper;

@Service
public class UserService {

	@Autowired
	private UserMapper UM;
	public Music getMPath(int id) {
		
		return UM.getMPath(id);
	}
	public void updateDcount(int num, int id) {
		UM.updateDcount(num,id);
	}
	public User getUserInfo(String name) {
		// TODO Auto-generated method stub
		return UM.getUserInfo(name);
	}
	public User getUserInfoById(int id) {
		// TODO Auto-generated method stub
		return UM.getUserInfoById(id);
	}
	public int UploadImg(HttpServletRequest req) {
		MultipartHttpServletRequest fileupUploadRequest = (MultipartHttpServletRequest) req;
    	MultipartFile file = fileupUploadRequest.getFile("img"); 
    	System.out.println(req.getParameterMap());
		return 0;
	}
	public int UpdatePwd(String password,HttpServletRequest req) {
		HttpSession session=req.getSession();
		String name=(String) session.getAttribute("userName");
		return UM.UpdatePwd(password,name);
	}
	public List<MusicPojo> CollectMusic(int id) {
		// TODO Auto-generated method stub
		return UM.CollectMusic(id);
	}
	public int getIdByName(String name) {
		// TODO Auto-generated method stub
		return UM.getIDByName(name);
	}
	public int deleteConllect(int id,HttpServletRequest req) {
		HttpSession session=req.getSession();
		String name=(String) session.getAttribute("userName");
		int u_id=UM.getIDByName(name);
		return UM.deleteConllect(id,u_id);
	}
}
