package com.Music.Bean;
/**
 * 封装歌曲曲风
 * @author Mr.Cat
 *
 */
public class Style {

	private int id;   //主键
	private int Sid;  //曲风ID
	private int Mid;  //歌曲ID
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSid() {
		return Sid;
	}
	public void setSid(int sid) {
		Sid = sid;
	}
	public int getMid() {
		return Mid;
	}
	public void setMid(int mid) {
		Mid = mid;
	}
	
}
