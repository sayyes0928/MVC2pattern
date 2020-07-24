package com.mvc2BBS.svc;

import static com.mvc2BBS.ConnectionDB.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import com.mvc2BBS.DAO.BoardDAO;
import com.mvc2BBS.Vo.BoardBean;

public class BoardListService {

	public int getListCount() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<BoardBean> getArticleList(int page, int limit) throws Exception{
		
		ArrayList<BoardBean> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectArticleList(page,limit);
		close(con);
		return articleList;
		
	}

}
