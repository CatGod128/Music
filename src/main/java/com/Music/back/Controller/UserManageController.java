package com.Music.back.Controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Music.Bean.User;
import com.Music.back.Service.UserManageService;

@Controller
public class UserManageController {

	 @Autowired
	 private UserManageService UMS;
	 
	 @RequestMapping("back/userlist")
	 @ResponseBody
	 public Map userList(Model model){
	    	Map<String,Object> map=new HashMap<>();
	 	    List<User> list=UMS.querylist();
	 	    map.put("data",list);
			return map;
		 }
	 /**
	  * 获取用户信息
	  * @param id
	  * @param model
	  * @return
	  */
	  @RequestMapping("back/getUserInfo")
	    public String getInfo(int id ,Model model){
	         User user=UMS.getInfo(id);
	          model.addAttribute(user);
	    	  return "back/UserInfo";
	    }
}
