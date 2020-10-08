package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnABBS;

public class QnaListService {
	SqlSession sqlsession = BoardDAO.getInstance();
	//싱글톤 패턴을 사용해 객체를 한번만 생성하여 불필요한 로드를 없앰
	
	public int getListCount() throws Exception{ 
		
		int listCount = 0;	
		listCount = sqlsession.selectOne("qnaselect_list");
		//Q&A 테이블에 담겨진 리스트 갯수를 select
		
		return listCount;
		
	}
	
	public List<QnABBS> getArticleList(int page, int limit) throws Exception{
		
		int startrow=(page-1)*8;
		//현재 페이지를 알수있게 해주는 변수
		List<QnABBS> selectList = sqlsession.selectList("qnaselect_listall",startrow);
		//해당 페이지의 리스트 select
		return selectList;
		
	}
}
