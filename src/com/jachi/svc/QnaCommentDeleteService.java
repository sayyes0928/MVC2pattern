package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnABBS;
import com.jachi.DTO.QnA_Comment;

public class QnaCommentDeleteService {

	SqlSession sqlsession = BoardDAO.getInstance();

	public List<QnA_Comment> isArticleWriter(int qna_num) throws Exception{
		List<QnA_Comment> qnadelete = sqlsession.selectList("delete_qnacmall",qna_num);
		
		
		return qnadelete;
		
	}
}
