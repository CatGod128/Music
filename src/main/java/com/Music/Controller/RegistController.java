package com.Music.Controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Music.util.EmailUtil;

@Controller
public class RegistController {

	@RequestMapping("Verification")
	@ResponseBody()
	public Map Verification(){
		Map<String,Object> map=new HashMap();
		//String subject, String content,String toMail
		String subject="风车乐栈音乐网站";
		String content="http://localhost:8090/";
		String toMail="13001460106@163.com";
		EmailUtil e=new EmailUtil();
		e.sendMail(toMail, subject, content);
		String msg="我们已将激活地址发送到您的邮箱";
		map.put("msg", msg);
		return map;
	}
}
