package com.Music.back.Mapper;

import org.apache.ibatis.annotations.Param;

import com.Music.Bean.Music;

/**
 * 前后台通用的方法
 * @author Mr.Cat
 *
 */
public interface UtilMapper {

	/**
	 * 根据曲风名称获取ID
	 * @param style   曲风名称 
	 * @return  ID
	 */
	int getSidBySname(@Param("Style")String style);

	/**
	 * 根据ID获取文件路径
	 * @param id
	 * @return
	 */
	Music getFiles(int id);

}
