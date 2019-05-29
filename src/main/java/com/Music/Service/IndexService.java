package com.Music.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Music.Bean.Music;
import com.Music.Bean.MusicPojo;
import com.Music.back.Mapper.IndexMapper;
/**
 * 处理首页业务
 * @author Mr.Cat
 *
 */
@Service
public class IndexService {

	 @Autowired
	 private IndexMapper IM;

	public Music queryMusicMusicById(int p) {
	   
		return IM.queryMusicById(p);
	}

	public List<MusicPojo> queryNew() {
		//根据时间相查找
		
		return IM.queryNew();
	}

	public List<MusicPojo> queryHot() {
		//根据热度查找
		return IM.queryHot();
	}

	public List<MusicPojo> queryTop() {
		// 收听量查找
		
		return IM.queryTop();
	}

	public Music getMusicById(int id) {
		
		return IM.getMusicById(id);
	}
}
