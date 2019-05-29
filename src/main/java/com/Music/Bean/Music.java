package com.Music.Bean;

import java.util.List;

public class Music {
      private int id;           //歌曲Id
      private int Aid;          //歌手ID
      private String Aname;     //歌手姓名
      private String MPath;     //歌曲文件
      private String MName;     //歌曲名字
      private String LPath;     //歌词路径
      private String Size;      //文件大小
      private String MIPath;    //音乐图片
      private String Mtime;     //发布时间
      private int    Beard;     //发布类型  1 单曲  0 专辑  
      private List<String> Style;     //曲风
      private int    PCount;    //播放量
      private int    DCount;    //下载量
      public int getPCount() {
		return PCount;
	}
	public void setPCount(int pCount) {
		PCount = pCount;
	}
	public int getDCount() {
		return DCount;
	}
	public void setDCount(int dCount) {
		DCount = dCount;
	}      
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAid() {
		return Aid;
	}
	public void setAid(int aid) {
		Aid = aid;
	}
	public String getMPath() {
		return MPath;
	}
	public void setMPath(String mPath) {
		MPath = mPath;
	}
	public String getMName() {
		return MName;
	}
	public void setMName(String mName) {
		MName = mName;
	}
	public String getLPath() {
		return LPath;
	}
	public void setLPath(String lPath) {
		LPath = lPath;
	}
	public String getSize() {
		return Size;
	}
	public void setSize(String size) {
		Size = size;
	}
	public String getMIPath() {
		return MIPath;
	}
	public void setMIPath(String mIPath) {
		MIPath = mIPath;
	}
	public String getMtime() {
		return Mtime;
	}
	public void setMtime(String mtime) {
		Mtime = mtime;
	}
		public int getBeard() {
		return Beard;
	}
	public void setBeard(int beard) {
		Beard = beard;
	}
	public List<String> getStyle() {
		return Style;
	}
	public void setStyle(List<String> style) {
		Style = style;
	}
	public String getAname() {
		return Aname;
	}
	public void setAname(String aname) {
		Aname = aname;
	}
	@Override
	public String toString() {
		return "Music [id=" + id + ", Aid=" + Aid + ", Aname=" + Aname + ", MPath=" + MPath + ", MName=" + MName
				+ ", LPath=" + LPath + ", Size=" + Size + ", MIPath=" + MIPath + ", Mtime=" + Mtime + ", Beard=" + Beard
				+ ", Style=" + Style + ", PCount=" + PCount + ", DCount=" + DCount + "]";
	}
}
