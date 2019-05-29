package com.Music.Controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Music.Bean.ArtShowCommentsBean;
import com.Music.Service.CommandService;

/**
 * 品论相关的类
 * @author Mr.Cat
 *
 */
@Controller
public class CommandController {
      
	@Autowired
	private CommandService cs;
	
	@RequestMapping("show")
	@ResponseBody
	public List<ArtShowCommentsBean> showCommands(int id){
		List<ArtShowCommentsBean> list=cs.showCommands(id);
		return list;
	}
}
