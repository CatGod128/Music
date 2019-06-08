package com.Music.Service;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Music.Bean.ArtShowComments;
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

	public int saveComment(int m_id, String content, int u_id) {
		ArtShowComments Command=new ArtShowComments();
        Date date=new Date(); 
		Command.setUserId(u_id);
		Command.setShowId(m_id);
		Command.setContent(content);
		Command.setCreateTime(date);
		Command.setState(1);
		return cm.saveCommand(Command);
	}

	public int addlike(int id, int num) {
		return cm.addlike(id,num);
	}

	public int deleteCommand(int id) {
		return cm.deleteCommand(id);
	}

}
