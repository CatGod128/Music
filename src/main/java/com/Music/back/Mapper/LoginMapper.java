package com.Music.back.Mapper;

import org.apache.ibatis.annotations.Param;

public interface LoginMapper {

	/**
	 * 根据用户名和密码查询ID
	 * @param log   用户名
	 * @param pwd   密码
	 * @return   用户ID 或  0
	 */
	int UserLogin(@Param("log")String log,@Param("pwd")String pwd);
}
