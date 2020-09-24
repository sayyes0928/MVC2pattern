package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.QnABBS;
import com.jachi.DTO.TipDTO;

public class BTSelectService {

	public List<BeautyRoomDTO> getbeautyinfo() {

		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<BeautyRoomDTO> beautylistall = sqlsession.selectList("select_beautyall");
		System.out.println(beautylistall.size());
		sqlsession.close();

		
		return beautylistall;
		
	}
	public List<QnABBS> getQnaListAll(String or_id) {

		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		
		String us_id = or_id;
		
		List<QnABBS> qanListAll = sqlsession.selectList("qna_getList",us_id);

		sqlsession.close();

		
		return qanListAll;
		
	}
	public List<TipDTO> getTipListAll(String or_id) {

		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		
		String us_id = or_id;
		
		List<TipDTO> postingListAll = sqlsession.selectList("tip_getList",us_id);

		sqlsession.close();

		
		return postingListAll;
		
	}
	public List<BeautyRoomDTO> getPostList(String us_id) {

		String post_nickname = us_id;
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<BeautyRoomDTO> posting = sqlsession.selectList("posting_getList",post_nickname);
		
		sqlsession.close();

		return posting;
		
	}
}
