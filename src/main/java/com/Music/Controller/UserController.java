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

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Music.Bean.ArtShowCommentsBean;
import com.Music.Bean.Music;
import com.Music.Bean.MusicPojo;
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
			List<ArtShowCommentsBean> list=CS.showCommands(id);
			model.addAttribute("music",music);
			model.addAttribute("commands",list);
			return "view/PlayMusic";
		}
		/**
		 * 下载歌曲
		 * @param id
		 * @param response
		 * @throws UnsupportedEncodingException 
		 */
		@RequestMapping("download")
		public void download(int id ,HttpServletResponse response) throws UnsupportedEncodingException{
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
		@RequestMapping("Collect")
		@ResponseBody
		public Map Collect(int id){
			String msg="添加收藏";
			Map<String,Object> map=new HashMap();
			
			map.put("msg", msg);
			return map;
		}
}
