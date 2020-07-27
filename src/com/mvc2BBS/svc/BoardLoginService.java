package com.mvc2BBS.svc;

import static com.mvc2BBS.ConnectionDB.JdbcUtil.*;
import java.sql.Connection;
import com.mvc2BBS.DAO.BoardDAO;

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
