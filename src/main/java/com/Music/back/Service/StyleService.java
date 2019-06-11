package com.Music.back.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Music.Bean.MusicPojo;
import com.Music.back.Mapper.StyleMapper;

@Service
public class StyleService {
	
	@Autowired
	private StyleMapper SM;
	

	public List<String> listStyle() {
		// TODO Auto-generated method stub
		return SM.listStyle();
	}


	public List<MusicPojo> getStyle_M(String name) {
		int id=SM.getIdBySname(name);
		List<MusicPojo> list=SM.getStyle_M(id);
		return list;
	}


	public List<MusicPojo> getOther(String sname) {
		int id=SM.getIdBySname(sname);
		List<MusicPojo> other=SM.getOther(id);
		return other;
	}


	public int saveStyle(String name) {
		// TODO Auto-generated method stub
		return SM.saveStyle(name);
	}


	public int getIdByname(String sname) {
		return SM.getIdBySname(sname);
	}


	public int AlterStyleMusic(int styleId, String idStr) {
		//对Id串进行处理
		String[] ids=idStr.split(",");
		int[] m_ids=new int[ids.length-1];
		for(int i=1;i<ids.length;i++){
			m_ids[i-1]=Integer.parseInt(ids[i]);
		}
		//判断ID是添加还是移除
		int fID=m_ids[0];
		int id=SM.IsExit(styleId,fID);
		if(id>0){
			//存在则移除
			for(int m_id:m_ids){
				SM.deleteStyleMusic(styleId,m_id);
			}	
		}else{
			//不存在则添加
			for(int m_id:m_ids){
				SM.saveStyleMusic(styleId,m_id);
			}
		}
	    return 1;
	}
  
	
}
