package com.jachi.svc;

import static com.jachi.ConnectionDB.JdbcUtil.*;

import java.sql.Connection;

import com.jachi.DAO.BoardDAO;

public class BoardLoginService {


	public Boolean getArticleList(String userID, String userPW) throws Exception{
		
		Boolean articleList = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.checkUserLoginBoard(userID,userPW);
		close(con);
		return articleList;
		
	}

}
