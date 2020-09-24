package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnABBS;

public class QnaDetailService {

	public List<QnABBS> getqnalistall(int qnanum){
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession =sqlfactory.openSession();
		List<QnABBS> getlistall = sqlsession.selectList("qnalistall_detail",qnanum);
		sqlsession.close();
		
		
		return getlistall;
		
	}
}
