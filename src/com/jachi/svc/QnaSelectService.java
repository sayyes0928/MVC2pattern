package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnABBS;

public class QnaSelectService {

		public List<QnABBS> getqnainfo(){
			
			SqlSessionFactory sqlfactory = BoardDAO.getConn();
			SqlSession sqlsession = sqlfactory.openSession();
			List<QnABBS> qnalistall = sqlsession.selectList("select_qnaall");
			sqlsession.close();
			return qnalistall;
			
		}
}
