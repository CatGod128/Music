package com.Music.back.Mapper;

import java.util.List;

import com.Music.Bean.Artist;

public interface ArtistMapper {

	List<Artist> query(String query);

	List<Artist> querylist();

	Artist getInfo(int id);

	String getAIPath(String aname);

	int isExit(String path);

	int update(Artist artist);

}
