package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.NoticeDTO;


public class NoticeService {
	
	SqlSession sqlsession = BoardDAO.getInstance();
	public List<NoticeDTO> getnotice(){
		
		List<NoticeDTO> noticelist = sqlsession.selectList("select_notice");
		
		return noticelist;
		
	}

}
