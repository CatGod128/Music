package com.Music.back.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Music.Bean.MusicPojo;
import com.Music.back.Mapper.StyleMapper;

@Service
public class StyleService {
	
	@Autowired
	private StyleMapper SM;
	

	public List<String> listStyle() {
		// TODO Auto-generated method stub
		return SM.listStyle();
	}


	public List<MusicPojo> getStyle_M(String name) {
		int id=SM.getIdBySname(name);
		List<MusicPojo> list=SM.getStyle_M(id);
		return list;
	}


	public List<MusicPojo> getOther(String sname) {
		int id=SM.getIdBySname(sname);
		List<MusicPojo> other=SM.getOther(id);
		return other;
	}


	public int saveStyle(String name) {
		// TODO Auto-generated method stub
		return SM.saveStyle(name);
	}
  
	
}
