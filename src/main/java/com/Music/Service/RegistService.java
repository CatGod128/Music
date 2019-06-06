package com.Music.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Music.Bean.User;
import com.Music.back.Mapper.RegistMapper;

@Service
public class RegistService {
 
	@Autowired
	private RegistMapper RM;
	
	public int Regist(User user) {
		// TODO Auto-generated method stub
		return RM.Regist(user);
	}

	public int isExist(String username) {
		// TODO Auto-generated method stub
		return RM.isExit(username);
	}

	public int isExistEmail(String email) {
		// TODO Auto-generated method stub
		return RM.isExitEmail(email);
	}

}
