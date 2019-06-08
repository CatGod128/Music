package com.Music.back.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Music.Bean.Music;
import com.Music.Bean.MusicPojo;
import com.Music.Bean.User;

public interface UserMapper {

	Music getMPath(int id);

	void updateDcount(@Param("num")int num,@Param("id") int id);

	User getUserInfo(String name);

	User getUserInfoById(int id);

	int UpdatePwd(@Param("password")String password,@Param("name")String name);

	List<MusicPojo> CollectMusic(int id);

	int getIDByName(String name);

	int deleteConllect(@Param("id")int id,@Param("u_id")int u_id);

	int Collect(@Param("id")int id, @Param("u_id")int u_id);

	int CancelCollect(@Param("id")int id, @Param("u_id")int u_id);

}
