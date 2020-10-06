package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnA_Comment;

public class QnaCommentService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public List<QnA_Comment> cm_list(int qnanum){
		
		List<QnA_Comment> getcmlist = sqlsession.selectList("qna_select_comment",qnanum);
		
		
		return getcmlist;
		
	}

}
