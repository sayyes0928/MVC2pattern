package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnABBS;

public class QnaSearchListService {
	public int getListCount() throws Exception{
		
		int listCount = 0;
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		listCount = sqlsession.selectOne("qna_search_select_list");
		
		return listCount;
		
	}
	
	public List<QnABBS> getArticleList(int page, int limit) throws Exception{
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		
		int startrow=(page-1)*8;
		
		List<QnABBS> selectList = sqlsession.selectList("qna_search_select_listall",startrow);
		
		return selectList;
		
	}
}
