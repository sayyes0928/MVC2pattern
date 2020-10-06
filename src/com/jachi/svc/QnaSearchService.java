package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.QnABBS;

public class QnaSearchService {
	SqlSession sqlsession = BoardDAO.getInstance();
	
		public List<QnABBS> getsearchinfo(String search) {

			List<QnABBS> qnasch = sqlsession.selectList("select_qnasearch", search);
			
			
			return qnasch;
			
			
		}
}
