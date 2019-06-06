package com.Music.back.Mapper;

import java.util.List;

import com.Music.Bean.User;

public interface UserManageMapper {

	List<User> querylist();

	User getInfo(int id);

}
