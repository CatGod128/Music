package com.Music.back.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Music.Bean.Music;
import com.Music.Bean.MusicPojo;
import com.Music.Bean.Style;

/**
 * 处理首页
 * @author Mr.Cat
 *
 */
public interface IndexMapper {

	/**
	 * 根据ID查询歌曲
	 * @param p
	 * @return  封装歌曲信息的Music
	 */
	Music queryMusicById(int p);

	/**
	 * 批量查询新歌榜
	 * @return  List<MusicPojo>
	 */
	List<MusicPojo> queryNew();

	List<MusicPojo> queryHot();

	List<MusicPojo> queryTop();

	Music getMusicById(@Param("id")int id);

	List<String> getStyle();

	int getIdByStyle(String style);

	List<MusicPojo> getMusicByStyle(int s_id);


}
