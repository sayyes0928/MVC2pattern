package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.QnABBS;

public class QnaSearchService {

	
		public List<QnABBS> getsearchinfo(String search) {
			System.out.println("���񽺿Գ�");
			System.out.println(search+"��������ǲ");
			SqlSessionFactory sqlfactory = BoardDAO.getConn();
			SqlSession sqlsession = sqlfactory.openSession();
			List<QnABBS> qnasch = sqlsession.selectList("select_qnasearch", search);
			sqlsession.close();
			
			return qnasch;
			
			
		}
}
