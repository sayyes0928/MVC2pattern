package com.jachi.svc;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.Posting_replyDTO;

public class MyhomeDetailService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public List<BeautyRoomDTO> getArticle(int board_num) throws Exception{
		
		List<BeautyRoomDTO> beautylistall = sqlsession.selectList("select_beautyall_Detail",board_num);
		
		

		return beautylistall;
		
	}
	
	public List<Posting_replyDTO> getReply(int page, int limit, int board_num) throws Exception{
		
		
		
		int starrow=(page-1)*5;
		Map<String, Object> m = new HashMap<>();
		m.put("board_num", board_num);
		m.put("starrow", starrow);
		
		List<Posting_replyDTO> comentAll = sqlsession.selectList("select_beautyall_Detail_coment",m);
		
		

		return comentAll;
		
	}
	
	public int setReply(Posting_replyDTO posting_replyDTO) throws Exception{
		
		int comentAll = sqlsession.insert("insert_beautyall_Detail_coment",posting_replyDTO);
		sqlsession.commit();
		

		return comentAll;
		
	}
	public int getListCount(int post_num) throws Exception{
		
		int listCount = 0;
		
		listCount = sqlsession.selectOne("myhome_comment_list",post_num);
		
		return listCount;
		
	}

}
