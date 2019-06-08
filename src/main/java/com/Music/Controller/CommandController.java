package com.Music.Controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Music.Bean.ArtShowCommentsBean;
import com.Music.Service.CommandService;

/**
 * 评论相关的类
 * @author Mr.Cat
 *
 */
@Controller
public class CommandController {
      
	@Autowired
	private CommandService cs;
	
	/**
	 * 显示评论
	 * @param id
	 * @return
	 */
	@RequestMapping("show")
	@ResponseBody
	public List<ArtShowCommentsBean> showCommands(int id){
		List<ArtShowCommentsBean> list=cs.showCommands(id);
		return list;
	}
	/**
	 * 添加评论
	 * @param m_id
	 * @param content
	 * @param req
	 * @return
	 */
	@RequestMapping("Comment")
	@ResponseBody
	public int  saveComment(int m_id,String content,HttpServletRequest req){
		int flag=1;
		HttpSession session=req.getSession();
		int u_id=(int) session.getAttribute("userId");
		flag=cs.saveComment(m_id,content,u_id);
		return flag;
	}
	/**
	 * 点赞
	 * @param id
	 * @param num
	 * @return
	 */
	@RequestMapping("addlike")
	@ResponseBody
	public int addlike(int id,int num){
		int flag=cs.addlike(id,num);
		return flag;
	}
	@RequestMapping("deleteCommand")
	@ResponseBody
	public String deleteCommand(int id){
		String msg="1";
	    int flag=cs.deleteCommand(id);
		return msg;
	}
}
