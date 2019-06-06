package com.Music.Controller;

import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Music.Bean.MusicPojo;
import com.Music.Bean.User;
import com.Music.Service.IndexService;
import com.Music.Service.UserLoginService;
import com.Music.util.EmailUtil;
import com.jayway.jsonpath.Configuration;

import freemarker.template.Template;
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
	    	String userName=UserLS.getNameById(id);
	    	HttpSession session=re.getSession();
	    	session.setAttribute("userName",userName);
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
	@RequestMapping("logout")
	public String logout(HttpServletRequest request,Model model){
	   HttpSession	 httpSession = request.getSession();
	     httpSession.removeAttribute("userName");
	     httpSession.invalidate();
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
	@RequestMapping("view/find")
	@ResponseBody
	public Map findPwd(String email) throws MailException, MessagingException{
		Map<String,Object> map=new HashMap();
		String Pwd=getRandomString(6);
		int success=UserLS.findPwd(Pwd,email);
		if(success>0){
			String subject="大风车音乐网";
			 String content =  "<html>" +
	                    "<body>" + "<BR>" +
	                    "<span> 你好 </span>"+ "<BR>" +
	                    "<span> 你在大风车音乐网，正在通过邮箱找回密码，随机密码为</span>"+ "<BR>" +
	                    "<div align='center'><h3>" +Pwd + "</h3><BR>" +
	                    "</div>" +
	                    "<span>请及时更改您的密码</span>"+
	                    "</body>" +
	                    "</html>";
			String toMail=email;
			EmailUtil e=new EmailUtil();
			e.sendMimeMessageMail(toMail, subject, content);		
			String Msg="我们已将随机密码发送到邮箱，请注意查收";
			map.put("msg",Msg);       
		}	
		return map;
	}
	//length用户要求产生字符串的长度
	 public static String getRandomString(int length){
	     String str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	     Random random=new Random();
	     StringBuffer sb=new StringBuffer();
	     for(int i=0;i<length;i++){
	       int number=random.nextInt(62);
	       sb.append(str.charAt(number));
	     }
	     return sb.toString();
	 }
}
