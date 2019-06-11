package com.Music.back.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Music.Bean.Artist;
import com.Music.Bean.Music;
import com.Music.Bean.MusicPojo;
import com.Music.Bean.Style;

public interface MusicMapper {

	/**
	 * 自动提示框查询
	 * @param tips
	 * @return
	 */
	List<String> querytips(@Param("tips")String tips);

	/**
	 * 根据名称查询歌曲ID
	 * @param query   名称
	 * @return  id 或  -1 不存在
	 */
	int queryMIdByName(@Param("query")String query);

	/**
	 * 根据名称查询歌手ID
	 * @param query   名称
	 * @return  id 或  -1  不存在
	 */
	int queryAIdByName(@Param("query")String query);

	/**
	 * 根据歌曲ID查询歌曲
	 * @param success  歌曲id
	 * @return  MusicPojo歌曲信息
	 */
	List<MusicPojo> queryMByMId(@Param("success")int success);

	/**
	 * 根据歌手ID查询歌曲
	 * @param success
	 * @return  MusicPoji歌曲信息
	 */
	List<MusicPojo> queryMByAid(@Param("success2")int success);

	/**
	 * 根据歌手名字查询歌手id
	 * @param aname
	 * @return  id  或   -1  不存在
	 */
	int getAidByAname(@Param("Aname")String aname);

	/**
	 * 添加歌曲信息
	 * @param music
	 * @return -1  失败 或  0成功
	 */
	int saveMusic(Music music);

	/**
	 * 向曲风表中添加信息
	 * @param sid  曲风ID
	 * @param mid  歌曲ID
	 * @return   
	 */
	int saveStyle(@Param("Sid")int sid,@Param("Mid") int mid);
  
	/**
	 * 向数据库添加歌手信息
	 */
	int saveArtist(Artist artist);

	/**
	 * 根据歌曲ID获取歌曲详细信息
	 * @param id   歌曲ID
	 * @return  music
	 */
	Music getMById(@Param("id")int id);
	
	/**
	 * 根据发歌曲ID获取歌曲曲风
	 * @param id 歌曲ID
	 * @return   曲风列表
	 */
	List getStyle(@Param("id")int id);

	/**
	 * 删除曲风
	 * @param id  歌曲ID
	 */
	void deleteStyle_M(@Param("id")int id);

	/**
	 * 删除歌曲
	 * @param id
	 */
	void deleteMusic(@Param("id")int id);

	/**
	 * 获取歌手的歌曲数量
	 * @param id   歌曲ID
	 * @return    0 或 num 
	 */
	int getNum(@Param("id")int id);

	/**
	 * 删除歌手
	 * @param id  歌曲ID
	 */
	void deleteArtist(@Param("id")int id);

	/**
	 * 修改歌曲信息
	 * @param music  封装音乐信息的Bean
	 * @return    0  失败  或 1  成功
	 */
	int updateMusic(Music music);

	/**
	 * 获取图片路径
	 * @param id
	 * @return
	 */
	String getMIPath(int id);

	/**
	 * 是否存在
	 * @param path
	 * @return
	 */
	int isExit(String path);



	/**
	 * 根据曲风名获取id
	 * @param string
	 * @return
	 */
	int getSid(String string);

	/**
	 * 更新曲风表
	 * @param style
	 * @return
	 */
	int updateStyle(List<Style> style);

	List<String> getStylelist();

	List<MusicPojo> getMusicByStyleId(int id);
}
