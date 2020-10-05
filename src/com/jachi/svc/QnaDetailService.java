package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnABBS;

public class QnaDetailService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public List<QnABBS> getqnalistall(int qnanum){
		
		List<QnABBS> getlistall = sqlsession.selectList("qnalistall_detail",qnanum);
		
		
		
		return getlistall;
		
	}
}
