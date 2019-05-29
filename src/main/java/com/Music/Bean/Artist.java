package com.Music.Bean;

import javax.xml.crypto.Data;

public class Artist {
    private int id;
    private String AName;   //歌手姓名
    private String AIPath;  //歌手图片
    private int Sex;     //歌手性别
    private String Birthday;//歌手生日   
    private String Summary; //歌手简介  
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAName() {
		return AName;
	}
	public void setAName(String aName) {
		AName = aName;
	}
	public String getAIPath() {
		return AIPath;
	}
	public void setAIPath(String aIPath) {
		AIPath = aIPath;
	}
	public String getBirthday() {
		return Birthday;
	}
	public void setBirthday(String birthday2) {
		Birthday = birthday2;
	}
	public int getSex() {
		return Sex;
	}
	public void setSex(int sex) {
		Sex = sex;
	}
	public String getSummary() {
		return Summary;
	}
	public void setSummary(String summary) {
		Summary = summary;
	}
	@Override
	public String toString() {
		return "Artist [id=" + id + ", AName=" + AName + ", AIPath=" + AIPath + ", Sex=" + Sex + ", Birthday="
				+ Birthday + ", Summary=" + Summary + "]";
	}
	
}
