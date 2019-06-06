package com.Music.back.Mapper;

import java.util.List;

import com.Music.Bean.MusicPojo;

public interface StyleMapper {

	List<String> listStyle();

	int getIdBySname(String name);

	List<MusicPojo> getStyle_M(int id);
	
	List<MusicPojo> getOther(int id);

	int saveStyle(String name);

}
