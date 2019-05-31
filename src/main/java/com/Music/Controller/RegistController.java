package com.Music.Controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Music.Bean.User;
import com.Music.Service.RegistService;
import com.Music.util.EmailUtil;
/**
 * 用户注册的相关业务
 * @author Mr.Cat
 *
 */
@Controller
public class RegistController {
	
	@Autowired
	private RegistService RS;

	/**
	 * 验证用户名是否存在
	 * @param username
	 * @return
	 */
	@RequestMapping("view/checkName")
	@ResponseBody()
	public String checkName(String username){
		Map<String,Object> map=new HashMap();
		int id=RS.isExist(username);
		if(id>0){
			return "false";
		}
		return "true";
	}
	/**
	 * 验证邮箱是否已绑定
	 * @param email
	 * @return
	 */
	@RequestMapping("view/checkemail")
	@ResponseBody()
	public String checkmail(String email){
		Map<String,Object> map=new HashMap();
		int id=RS.isExistEmail(email);
		if(id>0){
			return "false";
		}
		return "true";
	}
	
	@RequestMapping("view/register")
	public String Register(String username,String password,
			String email,String phone_number,Model model  ){
		User user=new User();
		user.setUserName(username);
		user.setPassWord(password);
		user.setPhone(phone_number);
		user.setEmail(email);
		//LocalDate Date = LocalDate.now();
		Date date = new Date();
		user.setRegisterdate(date);
	    int success=RS.Regist(user);
		if(success>0){
			String subject="大风车音乐网";
			String content="欢迎"+username+"来到大风车音乐网";
			String toMail=email;
			EmailUtil e=new EmailUtil();
			e.sendMail(toMail, subject, content);
		} 	
		return "view/index";
	}
	@Test
	public void test(){
		LocalDate localDate = LocalDate.now();

		System.out.println("localDate :" + localDate);
	}
}
