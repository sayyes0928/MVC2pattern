package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnA_Comment;

public class QnaCommentService {
	
	public List<QnA_Comment> cm_list(int qnanum){
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession =sqlfactory.openSession();
		List<QnA_Comment> getcmlist = sqlsession.selectList("qna_select_comment",qnanum);
		sqlsession.close();
		
		return getcmlist;
		
	}

}
