package com.mvc2BBS.svc;

import static com.mvc2BBS.ConnectionDB.JdbcUtil.*;
import java.sql.Connection;
import com.mvc2BBS.DAO.BoardDAO;
import com.mvc2BBS.Vo.BoardBean;

public class BoardReplyProService {

	public boolean replyArticle(BoardBean article) throws Exception{
		
		boolean isReplySuccess = false;
		int insertCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		insertCount = boardDAO.insertReplyArticle(article);
		
		if(insertCount > 0){
			commit(con);
			isReplySuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isReplySuccess;
		
	}

}
