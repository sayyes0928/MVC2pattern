package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnABBS;

public class QnaDeleteService {

	public List<QnABBS> isArticleWriter(int qna_num) throws Exception{
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<QnABBS> qnadelete = sqlsession.selectList("delete_qnaall",qna_num);
		sqlsession.close();
		
		return qnadelete;
		
	}
	
}
