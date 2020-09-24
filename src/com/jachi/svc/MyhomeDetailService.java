package com.jachi.svc;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.Posting_replyDTO;

public class MyhomeDetailService {

	public List<BeautyRoomDTO> getArticle(int board_num) throws Exception{
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<BeautyRoomDTO> beautylistall = sqlsession.selectList("select_beautyall_Detail",board_num);
		
		sqlsession.close();

		return beautylistall;
		
	}
	
	public List<Posting_replyDTO> getReply(int posting_reply_post_num) throws Exception{
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<Posting_replyDTO> comentAll = sqlsession.selectList("select_beautyall_Detail_coment",posting_reply_post_num);
		
		sqlsession.close();

		return comentAll;
		
	}
	
	public int setReply(Posting_replyDTO posting_replyDTO) throws Exception{
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		int comentAll = sqlsession.insert("insert_beautyall_Detail_coment",posting_replyDTO);
		sqlsession.commit();
		sqlsession.close();

		return comentAll;
		
	}

}
