package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnABBS;

public class QnaListService {

	public int getListCount() throws Exception{
		
		int listCount = 0;
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		listCount = sqlsession.selectOne("qnaselect_list");
		
		return listCount;
		
	}
	
	public List<QnABBS> getArticleList(int page, int limit) throws Exception{
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		
		int startrow=(page-1)*8;
		
		List<QnABBS> selectList = sqlsession.selectList("qnaselect_listall",startrow);
		
		return selectList;
		
	}
}
