package com.Music.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Music.Bean.Music;
import com.Music.Bean.MusicPojo;
import com.Music.Bean.Style;
import com.Music.Service.IndexService;
import com.Music.back.Service.MusicService;

@Controller
public class IndexController {

	@Autowired
   private MusicService MS;	
	
	@Autowired
	private IndexService IS;
	/**
	 * 首页初始化
	 * @return  
	 */
	@RequestMapping("/")
	public String initIndex(Model model){
		//最新推荐
		List<MusicPojo> New=IS.queryNew();
		//最热推荐
		List<MusicPojo> Hot=IS.queryHot();
		//巅峰榜
		List<MusicPojo> Top=IS.queryTop();
		//曲风集合
		List<String> Style=IS.queryStyle();
		//返回页面
		model.addAttribute("New",New);
		model.addAttribute("Hot",Hot);
		model.addAttribute("Top",Top);
		model.addAttribute("Style",Style);
		return "view/index";
	}
	
	@RequestMapping("/get")
	public String queryMusicById(int p,Model model){
		Music music=IS.queryMusicMusicById(p);
		model.addAttribute("music",music);
		return "view/index";
	}
	/**
	 * 搜索框查询歌曲
	 * @param query
	 * @param model
	 * @return
	 */
	@RequestMapping("/query")
	 public String query(@RequestParam(value="query") String query ,Model model){
	    List<MusicPojo> list=MS.query(query);
	  //曲风集合
	   List<String> Style=IS.queryStyle();
	    model.addAttribute("result",list);
		model.addAttribute("Style",Style);
		return "view/searchresult"; 
	 }
	
	@RequestMapping("/getMusicById")
	@ResponseBody
	public Music getMusicById(int id){
		Music music=IS.getMusicById(id);
		return music;
	}
	/**
	 * 获取曲风歌曲
	 */
	@RequestMapping("/getStyleMusic")
	public String getMusicByStyle(String style,Model model){
	   List<MusicPojo> list=IS.getMusicByStyle(style);
	   model.addAttribute("result",list);
		return "view/searchresult";
	}
}
