package com.Music.back.Controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.Music.Bean.Artist;
import com.Music.back.Service.ArtistService;

@Controller
public class ArtistController {

   @Autowired
   private ArtistService AS;
    /**
     * 获取所有歌手信息
     * @param model
     * @return
     */
    @RequestMapping("back/artistlist")
    @ResponseBody()
	 public Map ArtistList(Model model){
    	Map<String,Object> map=new HashMap<>();
 	    List<Artist> list=AS.querylist();
 	    map.put("data",list);
		return map;
	 }
    /**
     * 获取歌手详细信息
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("back/getArtistInfo")
    public String getInfo(int id ,Model model){
          Artist artist=AS.getInfo(id);
          model.addAttribute(artist);
    	  return "back/ArtistInfo";
    }
    
    @RequestMapping("back/update")
    @ResponseBody()
    public Map update(HttpServletRequest req){
    	Map<String,Object> map=new HashMap();
    	int success=AS.update(req);
    	String Msg="修改成功";
    	map.put("msg",Msg);
    	return map;
    }
}
