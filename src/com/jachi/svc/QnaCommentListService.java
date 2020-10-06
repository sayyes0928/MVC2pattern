package com.jachi.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnA_Comment;

public class QnaCommentListService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public int getListCount(int qnanum) throws Exception{
		
		int listCount = 0;
		
		listCount = sqlsession.selectOne("qna_comment_list",qnanum);
		System.out.println(listCount +"리스트카운트");
		
		return listCount;
		
	}
	
	public List<QnA_Comment> getArticleList(int page, int limit, int qnanum) throws Exception{
		
		int starrow=(page-1)*5;
		Map<String, Object> m = new HashMap<>();
		m.put("qnanum", qnanum);
		m.put("starrow", starrow);
		
		List<QnA_Comment> selectList = sqlsession.selectList("qna_comment_listall",m);
		
		System.out.println(selectList +"셀렉트리스트");
		return selectList;
		
	}
}
