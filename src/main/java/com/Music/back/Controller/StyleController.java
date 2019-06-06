package com.Music.back.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Music.Bean.MusicPojo;
import com.Music.back.Service.StyleService;

/**
 * 曲风管理
 * @author Mr.Cat
 *
 */
@Controller
public class StyleController {
	
	@Autowired
	private StyleService SS;
	
    /**
     * 获取所有曲风
     * @param model
     * @return
     */
	@RequestMapping("back/listStyle")
	public String listStyle(Model model){
		
		//获取所有曲风
		List<String> stylelist=SS.listStyle();
		model.addAttribute("stylelist",stylelist);
		return "back/StyleManage";
	}
	
	/**
	 * 获取曲风的歌曲
	 * @param sname
	 * @return
	 */
	@RequestMapping("back/showstyle_music")
	@ResponseBody
	public Map getStyle_M(String sname){
		Map<String,Object> map=new HashMap();
		List<MusicPojo> list=SS.getStyle_M(sname);
		List<MusicPojo> other=SS.getOther(sname);
		map.put("list", list);
		map.put("other", other);
		return map;
	}
	
	@RequestMapping("back/addStyle")
	@ResponseBody
	public void addStyle(String name){
		SS.saveStyle(name);
	}
}
