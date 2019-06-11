package com.Music.back.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Music.Bean.MusicPojo;

public interface StyleMapper {

	List<String> listStyle();

	int getIdBySname(String name);

	List<MusicPojo> getStyle_M(int id);
	
	List<MusicPojo> getOther(int id);

	int saveStyle(String name);

	int IsExit(@Param("styleId")int styleId,@Param("fID")int i);

	void deleteStyleMusic(@Param("styleId")int styleId, @Param("m_id")int m_id);

	void saveStyleMusic(@Param("styleId")int styleId,@Param("m_id") int m_id);

}
