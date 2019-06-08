package com.Music.back.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Music.Bean.ArtShowComments;
import com.Music.Bean.ArtShowCommentsBean;

public interface CommandMapper {

	List<ArtShowCommentsBean> showCommands(int id);

	int saveCommand(ArtShowComments command);

	int addlike(@Param("id")int id, @Param("num")int num);

	int deleteCommand(int id);



}
