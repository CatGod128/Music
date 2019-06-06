package com.Music.back.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Music.Bean.User;
import com.Music.back.Mapper.UserManageMapper;

@Service
public class UserManageService {

	 @Autowired
	 private UserManageMapper UMM;

	public List<User> querylist() {
		// TODO Auto-generated method stub
		return UMM.querylist();
	}

	public User getInfo(int id) {
		// TODO Auto-generated method stub
		return UMM.getInfo(id);
	}
}
