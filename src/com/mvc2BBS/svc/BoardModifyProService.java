package com.mvc2BBS.svc;

import static com.mvc2BBS.ConnectionDB.JdbcUtil.*;
import java.sql.Connection;
import com.mvc2BBS.Vo.BoardBean;
import com.mvc2BBS.DAO.BoardDAO;

public class BoardModifyProService {

	public boolean isArticleWriter(int board_num, String pass) throws Exception {
		boolean isArticleWriter = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		isArticleWriter = boardDAO.isArticleBoardWriter(board_num, pass);
		close(con);
		return isArticleWriter;
		
	}

	public boolean modifyArticle(BoardBean article) throws Exception {
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateArticle(article);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

}
