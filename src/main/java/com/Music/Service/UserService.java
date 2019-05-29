package com.Music.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Music.Bean.Music;
import com.Music.back.Mapper.UserMapper;

@Service
public class UserService {

	@Autowired
	private UserMapper UM;
	public Music getMPath(int id) {
		
		return UM.getMPath(id);
	}

}
