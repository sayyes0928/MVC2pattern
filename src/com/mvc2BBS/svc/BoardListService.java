package com.mvc2BBS.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.mvc2BBS.DAO.BoardDAO;
import com.mvc2BBS.Vo.BoardBean;

public class BoardListService {

	public int getListCount() throws Exception{
		
		int listCount = 0;
		//Mybatis 구문
		 SqlSessionFactory sqlfactory = BoardDAO.getConn();
		 SqlSession sqlsession = sqlfactory.openSession();
		 listCount = sqlsession.selectOne("select_list");

		return listCount;
		
	}

	public List<BoardBean> getArticleList(int page, int limit) throws Exception{
		
		//Mybatis 구문
		 SqlSessionFactory sqlfactory = BoardDAO.getConn();
		 SqlSession sqlsession = sqlfactory.openSession();
		 
		 int startrow=(page-1)*10;
		 
		 List<BoardBean> selectList = sqlsession.selectList("select_qnaList_all",startrow);

		return selectList;
		
	}

}
