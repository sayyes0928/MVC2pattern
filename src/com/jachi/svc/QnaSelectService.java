package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnABBS;

public class QnaSelectService {
	SqlSession sqlsession = BoardDAO.getInstance();
		public List<QnABBS> getqnainfo(){
			
			List<QnABBS> qnalistall = sqlsession.selectList("select_qnaall");
			
			return qnalistall;
			
		}
}
