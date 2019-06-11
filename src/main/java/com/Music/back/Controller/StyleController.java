package com.Music.back.Controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Music.Bean.MusicPojo;
import com.Music.back.Service.StyleService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 曲风管理
 * @author Mr.Cat
 *
 */
@Controller
public class StyleController {
	
	private static final JsonParser Integer = null;
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
	@RequestMapping("back/gets_music")
	@ResponseBody
	public Map getStyle_M(String sname){
		Map<String,Object> map=new HashMap();
		List<MusicPojo> list=SS.getStyle_M(sname);
		List<MusicPojo> other=SS.getOther(sname);
		map.put("list", list);
		map.put("other", other);
		return map;
	}
	/**
	 * 显示曲风的歌曲
	 * @param sname
	 * @param model
	 * @return
	 */
	@RequestMapping("back/showstyle")
	public String getStyle(String sname,Model model){
		int id=SS.getIdByname(sname);
		model.addAttribute("styleId", id);
		model.addAttribute("stylename",sname);
		return "back/styleMusic";
	}
	/**
	 * 添加曲风
	 * @param name
	 */
	@RequestMapping("back/addStyle")
	@ResponseBody
	public void addStyle(String name){
		SS.saveStyle(name);
	}
	@RequestMapping("back/AlterStyleMusic")
	@ResponseBody
	public Map AlterStyleMusic(int StyleId,String IdStr) {
		String msg="操作成功";
		Map<String,Object> map=new HashMap();
		int flag=SS.AlterStyleMusic(StyleId,IdStr);
		map.put("msg", msg);
		return map;
	}
}
