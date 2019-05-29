package com.Music.Controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Music.Bean.MusicPojo;
import com.Music.Bean.User;
import com.Music.Service.IndexService;
import com.Music.Service.UserLoginService;
/**
 * 用户登录
 * @author Mr.Cat
 *
 */
@Controller	
public class UserLoginController {

	@Autowired
	 private  UserLoginService UserLS;
	@Autowired
	private IndexService IS;
	
	@RequestMapping("login")
	public String Login(String log,String pwd,String rememberme,Model model,HttpServletRequest re){
		User user=new User();
		user.setUserName(log);
		user.setPassWord(pwd);
	    int id=UserLS.login(log,pwd);
	    if(id!=0){
	    	//判断是否记住密码
	    	
	    	//用户名存入session
	    	HttpSession session=re.getSession();
	    	session.setAttribute("userName",log);
	    }
		List<MusicPojo> New=IS.queryNew();
		//最热推荐
		List<MusicPojo> Hot=IS.queryHot();
		//巅峰榜
		List<MusicPojo> Top=IS.queryTop();
		//返回页面
		model.addAttribute("New",New);
		model.addAttribute("Hot",Hot);
		model.addAttribute("Top",Top);
		return "view/index";
	}
	
}
