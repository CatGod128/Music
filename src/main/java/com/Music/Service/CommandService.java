package com.Music.Service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Music.Bean.ArtShowCommentsBean;
import com.Music.back.Mapper.CommandMapper;

@Service
public class CommandService {
	@Autowired
	private CommandMapper cm;

	public List<ArtShowCommentsBean> showCommands(int id) {
		List<ArtShowCommentsBean> list=cm.showCommands(id);
		return list;
	}

}
