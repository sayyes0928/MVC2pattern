package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnABBS;

public class QnaDeleteService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public List<QnABBS> isArticleWriter(int qna_num) throws Exception {
		List<QnABBS> qnadelete = sqlsession.selectList("delete_qnaall", qna_num);
		

		return qnadelete;

	}

}
