package com.Music.back.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Music.Bean.Music;
import com.Music.Bean.MusicPojo;
import com.Music.back.Service.MusicService;

@Controller
public class MusicController {
     
	@Autowired
	private  MusicService musicService;
	
	
	/**
	 * 根据关键字搜索歌曲或歌手
	 * @param query
	 * @return
	 */
	@RequestMapping("back/query")
	@ResponseBody()
	 public Map query(@RequestParam(value="query") String query ){
	    Map<String,Object> map=new HashMap<>();
	    List<MusicPojo> list=musicService.query(query);
	    map.put("data",list);
		return map; 
	 }
	 
	 /**
	  * 搜索框自动提示
	  * @param tips  
	  * @return  返回map搜索list结果集
	  */
	 @RequestMapping("back/ajax/tips")
	 @ResponseBody()
	 public Map querytips(@RequestParam(value="tips") String tips){
		 Map<String,Object> maplist=new HashMap<>();
		 List<String> list=musicService.querytips(tips);
		 maplist.put("s",list);
		 return maplist;
	 }
	 /**
	  * 上传文件等信息
	  * @param req
	  * @param re
	  * @return
	  * @throws IOException
	  */
	 @RequestMapping("back/ajax/saveMusic")
	 @ResponseBody()
	 public String saveMusic(HttpServletRequest req,HttpServletResponse re)throws IOException{
		 Map<String,Object> result=new HashMap<>();
		 int success=musicService.saveMusic(req, re);
		 return "/back/AddMusic";	 
	 }
	 
	 /**
	  * 查看音乐详细信息
	  * @param req
	  * @param re
	  * @return
	  */
	 @RequestMapping("back/getInfo")
	 public String getInfo(HttpServletRequest req,Model model){
		Music music=new Music();
		String param=req.getParameter("id");
		int id=Integer.parseInt(param);
		music=musicService.getInfo(id);
		model.addAttribute("music",music);
		return "back/MusicInfo";
	 }
	 /**
	  * 更新歌曲信息
	  * @param req
	  * @param re
	  * @return
	  */
	 @RequestMapping("back/updateMusic")
	 @ResponseBody()
	 public Map updateInfo(HttpServletRequest req){
		Map<String,Object> map=new HashMap();
		int success=musicService.updateMusic(req);
		String msg="更新成功";
		map.put("msg", msg);
		return map;
		 }
	 /**
	  *  删除音乐信息
	  * @param id
	  * @return  Msg  失败  或 成功
	 * @throws IOException 
	  */
	 @RequestMapping("back/deleteMusic")
	 @ResponseBody
	 public String deleteMusic(int id) throws IOException{
		 String Msg="成功";
		 int success=musicService.deleteMusic(id);
		 if(success==0){  //失败
			 Msg="失败";
		 }
		 return Msg;
	 }
	
}
