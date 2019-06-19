package com.Music.back.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.Music.Bean.Artist;
import com.Music.Bean.Music;
import com.Music.Bean.MusicPojo;
import com.Music.Bean.Style;
import com.Music.back.Mapper.MusicMapper;
import com.Music.back.Mapper.UtilMapper;
import com.Music.util.FileUtils;

@Service
public class MusicService {

	@Autowired
	private MusicMapper QM;
	@Autowired
	private UtilMapper UM;

	public List<String> querytips(String tips) {

		return QM.querytips(tips);
	}

	public List<MusicPojo> query(String query) {

		List<MusicPojo> list = new ArrayList<>();
		int success = QM.queryMIdByName(query);
		int success2 = QM.queryAIdByName(query);
		if (success > 0) { // 歌曲列表存在
			list = QM.queryMByMId(success);
			return list;
		} else if (success2 > 0) { // 歌手列表存在
			list = QM.queryMByAid(success2);
			return list;
		} else
			return list;
	}

	public int saveMusic(HttpServletRequest req, HttpServletResponse re) {
		// 设置文件路径
		String MfilePath = "UploadFile/Musics"; // 歌曲文件
		String LfilePath = "UploadFile/Lyrics"; // 歌词文件
		String MIfilePath = "UploadFile/MusicImgs";// 歌曲图片
		// 数据库的最终路径
		String MFP = null;
		String LFP = null;
		String MIFP = null;
		// 获取普通表单项
		String Beard = req.getParameter("Beard"); // 发布类型
		String Size = req.getParameter("Size"); // 文件大小
		String Mname = req.getParameter("Mname"); // 歌曲名称
		String Aname = req.getParameter("Aname"); // 歌手名称
		String Style = req.getParameter("Style"); // 音乐曲风
		// 文件项
		MultipartHttpServletRequest fileupUploadRequest = (MultipartHttpServletRequest) req;
		Map<String, MultipartFile> Files = fileupUploadRequest.getFileMap();
		MultipartFile Mfile = Files.get("Mfile"); // 歌曲文件
		MultipartFile Lfile = Files.get("Lfile"); // 歌词文件
		MultipartFile MIfile = Files.get("MIfiles");// 歌曲图片

		// 获取存入数据库的路径
		MfilePath = MfilePath + "/" + Aname;
		if(Lfile.isEmpty()){
			LFP=null;
		}else{
			LFP = FileUtils.savefile(Lfile, Lfile.getOriginalFilename(), LfilePath);
		}
		MFP = FileUtils.savefile(Mfile, Mfile.getOriginalFilename(), MfilePath);
	
		MIFP = FileUtils.savefile(MIfile, MIfile.getOriginalFilename(), MIfilePath);
		// 数据库存储歌曲信息
		Music music = new Music();
		Artist artist = new Artist();
		int Aid = QM.getAidByAname(Aname);
		if (Aid == 0) { // 没有该歌手
			// 存储歌手
			artist.setAIPath(MIFP);
			artist.setAName(Aname);
			int savesrtist = QM.saveArtist(artist);
			music.setAid(artist.getId()); // 歌手id
		} else {
			music.setAid(Aid); // 歌手id
		}
		int beard;
		if (Beard.equals("单曲")) {
			beard = 0;
		} else {
			beard = 1;
		}
		// 存储专辑
		music.setMName(Mname); // 歌曲名称
		music.setMPath(MFP); // 歌曲文件
		music.setSize(Size);
		music.setLPath(LFP); // 歌词文件
		music.setMIPath(MIFP); // 歌曲图片
		music.setBeard(beard); // 发布类型
		// 存储歌曲信息
		QM.saveMusic(music);

		if (music.getId() > 0) {
			// 1.查询曲风表获取ID 2.向曲风-歌曲表中添加数据
			int Sid = UM.getSidBySname(Style);
			int saveStyle = QM.saveStyle(Sid, music.getId());
		}
		return 0;
	}

	/**
	 * 根据ID获取详细信息
	 * 
	 * @param id
	 *            歌曲ID
	 * @return music封装music信息
	 */
	public Music getInfo(int id) {
		Music music = QM.getMById(id);
		music.setStyle(QM.getStyle(id));
		return music;
	}

	/**
	 * 根据ID删除音乐信息
	 * 
	 * @param id
	 *            歌曲ID
	 * @return 0 失败 或 1 成功
	 * @throws IOException
	 */
	@Transactional
	public int deleteMusic(int id) throws IOException {
		// 1.删除文件
		Music music = UM.getFiles(id);
		String MPath = music.getMPath();
		String LPath = music.getLPath();
		String MIPath = music.getMIPath();
		// 删除歌词文件
		FileUtils.deleteFile(LPath);
		// 删除歌曲图片
		FileUtils.deleteFile(MIPath);
		// 删除歌曲文件
		FileUtils.deleteFile(MPath);
		// 2.删除数据库表
		// 判断歌手是否还有其他歌曲是否删除歌手
		int num = QM.getNum(id);
		// 删除曲风表
		QM.deleteStyle_M(id);
		// 删除歌曲表
		QM.deleteMusic(id);
		if (num == 1) {
			QM.deleteArtist(id);
		}
		return 1;
	}
   /**
    * 更新音乐信息
    * @param music
    * @return
    */
	public int updateMusic(HttpServletRequest req) {
		MultipartHttpServletRequest fileupUploadRequest = (MultipartHttpServletRequest) req;
    	Map<String, MultipartFile> files=fileupUploadRequest.getFileMap(); 
    	MultipartFile MIFile=files.get("MIFile");                    //歌曲图片
    	MultipartFile LFile=files.get("LFile");                      //歌词文件
    	String Mname = req.getParameter("Mname");                    //歌手名称
    	String Mtime = req.getParameter("MTime");                    //发布时间
    	String MDCount = req.getParameter("DCount");                  //下载量
    	String MPCount = req.getParameter("PCount");                  //播放量
    	String Mid=req.getParameter("id");                           //歌曲ID
    	String [] Styles=req.getParameterValues("style");
    	int id=Integer.parseInt(Mid);
    	int PCount=Integer.parseInt(MPCount);
    	int DCount=Integer.parseInt(MDCount);
    	List<Style> style=new ArrayList();
    	for (int i = 0; i < Styles.length; i++) {
    		 Style sty=new Style();
    		 int sid=QM.getSid(Styles[i]);
    		 sty.setMid(id);
    		 sty.setSid(sid);
    		 style.add(sty);
    		}
    	Music music=new Music();
    	music.setId(id);
    	music.setMtime(Mtime);
    	music.setPCount(PCount);
    	music.setDCount(DCount);
    	String MIFPath;
    	String LFPath;
    	String MIPath="UploadFile/MusicImgs";
    	String LPath="UploadFile/Lyrics";
    	if(LFile==null){
			LFPath=null;
		}else{
			LFPath = FileUtils.savefile(LFile, LFile.getOriginalFilename(), LPath);
			music.setLPath(LFPath);
		}
    	if(!MIFile.isEmpty()){   //不为空需要更新    	
    		String path=QM.getMIPath(id);
    		int success=QM.isExit(path);
    			if(success<0){   //不共享一张
    			try {
    				FileUtils.deleteFile(path);
    			} catch (IOException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    		}
    		MIFPath=FileUtils.savefile(MIFile,MIFile.getOriginalFilename(),MIPath);
    		music.setMIPath(MIFPath);		
    	}else{
    		String path=QM.getMIPath(id);
        	music.setMIPath(path);
    	}
    	int success=QM.updateMusic(music);
    	if(success>0){
    		int flag=QM.updateStyle(style);
    	}
		return 1;
	}
/**
 *  获取曲风列表
 * @return
 */
public List<String> getStylelist() {
	// TODO Auto-generated method stub
	return QM.getStylelist();
}

public List<MusicPojo> getMusicByStyle(String style) {
	int id=QM.getSid(style);
	return QM.getMusicByStyleId(id);
}

public List<Music> getMusicByAid(int aid) {
	
	return QM.getMusicByAid(aid);
}

}
