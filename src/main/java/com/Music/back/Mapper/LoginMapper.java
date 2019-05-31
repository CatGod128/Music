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

	/**
	 * 查询用户名
	 * @param id
	 * @return
	 */
	String getNameById(int id);

	/**
	 * 通过邮箱生成随机密码
	 * @param pwd   随机密码
	 * @param email  邮箱
	 * @return
	 */
	int findPwd(@Param("passwd")String passwd,@Param("email")String email);
}
