package com.Music.Bean;
/**
 * 用于查询显示
 * @author Mr.Cat
 *
 */
public class MusicPojo {
    
	private int id;          //歌曲ID
	private String MName;    //歌曲名字
	private String AName;    //歌手名字
	private String MPath;    //歌曲文件
    private String Mtime;     //发布时间
    private String MIPath;
	private int    PCount;   //播放量
	private int    DCount;   //下载量
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMName() {
		return MName;
	}
	public void setMName(String mName) {
		MName = mName;
	}
	public String getAName() {
		return AName;
	}
	public void setAName(String aName) {
		AName = aName;
	}
	public String getMPath() {
		return MPath;
	}
	public void setMPath(String mPath) {
		MPath = mPath;
	}
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
	public String getMtime() {
		return Mtime;
	}
	public void setMtime(String mtime) {
		Mtime = mtime;
	}
	@Override
	public String toString() {
		return "MusicPojo [id=" + id + ", MName=" + MName + ", AName=" + AName + ", MPath=" + MPath + ", Mtime=" + Mtime
				+ ", PCount=" + PCount + ", DCount=" + DCount + "]";
	}
	public String getMIPath() {
		return MIPath;
	}
	public void setMIPath(String mIPath) {
		MIPath = mIPath;
	}

	
}
