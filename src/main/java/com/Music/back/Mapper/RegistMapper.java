package com.Music.back.Mapper;

import com.Music.Bean.User;

public interface RegistMapper {

	/**
	 * 注册用户
	 * @param user  
	 * @return
	 */
	int Regist(User user);

	/**
	 * 用户名是否可用
	 * @param username  用户名
	 * @return  -1 可用  或  已存在的id
	 */
	int isExit(String username);

	/**
	 * 邮箱是否已绑定
	 * @param email   邮箱
	 * @return  -1 可用  或  已存在的id
	 */
	int isExitEmail(String email);

}
