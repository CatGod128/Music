package com.Music.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Music.back.Mapper.LoginMapper;
/**
 *  用户登录业务处理 
 * @author Mr.Cat
 *
 */
@Service
public class UserLoginService {
    @Autowired
	private  LoginMapper LoginM;
    
	public  int login(String log,String pwd){
		int id=LoginM.UserLogin(log,pwd);
		return id;
	}
}
