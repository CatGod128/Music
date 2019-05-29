package com.Music.back.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 曲风管理
 * @author Mr.Cat
 *
 */
@Controller
public class StyleController {

	@RequestMapping("back/listStyle")
	public String listStyle(){
		return "back/StyleManage";
	}
}
