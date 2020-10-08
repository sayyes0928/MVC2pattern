package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnABBS;

public class QnaSelectService {
	
	SqlSession sqlsession = BoardDAO.getInstance();
	//싱글턴 패턴 사용. 객체를 한번 생성하여 불필요한 로드작업을 없앰
		
		public List<QnABBS> getqnainfo(){
			
			List<QnABBS> qnalistall = sqlsession.selectList("select_qnaall");
			//Q&A 게시판에 등록된 게시물들을 mapper.xml을 통해 select 해온후 List<QnABBS>의 객체에 담아준다.
			
			return qnalistall;

		}
}
