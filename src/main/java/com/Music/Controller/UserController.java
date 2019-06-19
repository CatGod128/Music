package com.Music.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Music.Bean.ArtShowCommentsBean;
import com.Music.Bean.Music;
import com.Music.Bean.MusicPojo;
import com.Music.Bean.User;
import com.Music.Service.CommandService;
import com.Music.Service.IndexService;
import com.Music.Service.UserService;
import com.Music.back.Service.MusicService;

@Controller
public class UserController {
	
	@Autowired
	private  MusicService musicService;
	
	@Autowired
	private IndexService IS;
	
	@Autowired
	private CommandService CS;
	
	@Autowired
	private UserService US;
	 /**
	  * 搜索框自动提示
	  * @param tips  
	  * @return  返回map搜索list结果集
	  */
	 @RequestMapping("ajax/tips")
	 @ResponseBody()
	 public Map querytips(@RequestParam(value="tips") String tips){
		 Map<String,Object> maplist=new HashMap<>();
		 List<String> list=musicService.querytips(tips);
		 maplist.put("s",list);
		 return maplist;
	 }
	 /**
		 * 根据关键字搜索歌曲或歌手
		 * @param query
		 * @return
		 */
		@RequestMapping("queryMusic")
		@ResponseBody()
		 public String query(@RequestParam(value="query") String query,Model model ){
		    List<MusicPojo> list=musicService.query(query);
		    model.addAttribute("result",list);
			return "view/searchresult"; 
		 }
		/**
		 * 获取音乐详情
		 * @param id
		 * @param model
		 * @return
		 */
		@RequestMapping("getInfo")
		public String getInfo(int id,Model model,Music music){
			music=IS.getMusicById(id);
			List<Music> songs=musicService.getMusicByAid(music.getAid());
			List<ArtShowCommentsBean> list=CS.showCommands(id);
			model.addAttribute("music",music);
			model.addAttribute("Songs",songs);
			model.addAttribute("commands",list);
			return "view/PlayMusic";
		}
		/**
		 * 下载歌曲
		 * @param id
		 * @param response
		 * @throws UnsupportedEncodingException 
		 */
		@RequestMapping("*/download")
		public void download(int id ,HttpServletResponse response) throws UnsupportedEncodingException{
			//增加该歌曲的下载数量
			Random random = new Random();
			// 0-99
			int num = random.nextInt(100);
			US.updateDcount(num,id);
			Music music=US.getMPath(id);
			// 1.获取要下载的文件的绝对路径		
			String path=music.getMPath();
			File file = new File(path).getAbsoluteFile();	 
			// 2.获取要下载的文件名		 
			String fileName =music.getAname()+"-"+music.getMName()+".mp3";
			// 3.设置content-disposition响应头控制浏览器以下载的形式打开文件		 
				response.setHeader("content-disposition", "attachment;filename="+URLEncoder.encode(fileName, "UTF-8"));	 
			// 4.根据文件路径获取要下载的文件输入流
			try {
				InputStream in = new FileInputStream(file);
				int len = 0;
				// 5.创建数据缓冲区
				byte[] buffer = new byte[1024];
				// 6.通过response对象获取OutputStream流
				OutputStream out = response.getOutputStream();
				// 7.将FileInputStream流写入到buffer缓冲区
				while ((len = in.read(buffer)) > 0) { 
					// 8.使用OutputStream将缓冲区的数据输出到客户端浏览器 
					out.write(buffer, 0, len);		
				}
				in.close(); 
				out.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		/**
		 * 添加收藏
		 * @param id
		 * @return
		 */
		@RequestMapping("Collect")
		@ResponseBody
		public int Collect(int m_id,HttpServletRequest req){
			HttpSession session=req.getSession();
			int u_id=(int) session.getAttribute("userId");
			System.out.println(m_id);
			int flag=US.Collect(m_id,u_id);
			return flag;
		}
		/**
		 * 取消收藏
		 * @param id
		 * @return
		 */
		@RequestMapping("CancelCollect")
		@ResponseBody
		public int CancelCollect(int m_id,HttpServletRequest req){
			int flag=US.deleteConllect(m_id, req);
			if(flag>0){
				flag=0;
			}
			return flag;
		}
		/**
		 * 个人中心
		 * @param model
		 * @param req
		 * @return
		 */
		@RequestMapping("MyInfo")
		public String MyMusic(Model model,HttpServletRequest req){
			HttpSession session= req.getSession();
			String name=(String) session.getAttribute("userName");
			User user=US.getUserInfo(name);
			model.addAttribute("user", user);
			return "view/MyMusic";
		}
		/**
		 * 获取资料
		 * @param id
		 * @param model
		 * @return
		 */
		@RequestMapping("UserInfo")
		public String UserInfo(int id,Model model){
			User user =US.getUserInfoById(id);
			model.addAttribute("userInfo",user);
			return "view/MyInfo";
		}
		
		@RequestMapping("uploadImg")
		@ResponseBody
		public Map UploadImg(HttpServletRequest req){
			Map<String,Object> map=new HashMap();
			String msg="头像上传成功";
			int success=US.UploadImg(req);
			map.put("data", msg);
			return map;
		}
		@RequestMapping("view/updatePwd")
		@ResponseBody
		public Map UpdatePwd(String password,HttpServletRequest req){
			Map<String,Object> map=new HashMap();
			int success=US.UpdatePwd(password,req);
			String msg="密码修改成功";
			map.put("data", msg);
			return map;
		}
		/**
		 * 获取收藏歌曲
		 * @param req
		 * @return
		 */
		@RequestMapping("view/CollectMusic")
		@ResponseBody
		public Map CollectMusic(HttpServletRequest req){
			HttpSession session=req.getSession();
			String name=(String) session.getAttribute("userName");
			Map<String,Object> map=new HashMap();
			int id=US.getIdByName(name);
			List<MusicPojo> list=US.CollectMusic(id);
			map.put("data", list);
			return map;
		}
		/**
		 * 取消收藏
		 * @param id
		 * @param req
		 * @return
		 */
		@RequestMapping("view/deleteConllect")
		@ResponseBody
		public String deleteConllect(int id,HttpServletRequest req){
		      Map<String,Object> map=new HashMap();
		      int success=US.deleteConllect(id,req);
		      String msg="成功";
		      if(success<0){
		    	  msg="失败";
		      }
		      return msg;
		}
		/**
		 * 播放收藏歌曲
		 * @param id
		 * @param model
		 * @param music
		 * @return
		 */
		@RequestMapping("view/getInfo")
		public String playConllect(int id,Model model,Music music){
			return getInfo(id,model,music);
		}
		@RequestMapping("view/playAllConllect")
		public String playAllConllect(HttpServletRequest req,Model model){
			HttpSession session=req.getSession();
			String name=(String) session.getAttribute("userName");
			int id=US.getIdByName(name);
			List<MusicPojo> list=US.CollectMusic(id);
			model.addAttribute("musiclist",list);
			return "view/PlayMusic";
		}
}
