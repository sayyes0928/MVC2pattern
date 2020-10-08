package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnABBS;

public class QnaListService {
	SqlSession sqlsession = BoardDAO.getInstance();
	//�̱��� ������ ����� ��ü�� �ѹ��� �����Ͽ� ���ʿ��� �ε带 ����
	
	public int getListCount() throws Exception{ 
		
		int listCount = 0;	
		listCount = sqlsession.selectOne("qnaselect_list");
		//Q&A ���̺� ����� ����Ʈ ������ select
		
		return listCount;
		
	}
	
	public List<QnABBS> getArticleList(int page, int limit) throws Exception{
		
		int startrow=(page-1)*8;
		//���� �������� �˼��ְ� ���ִ� ����
		List<QnABBS> selectList = sqlsession.selectList("qnaselect_listall",startrow);
		//�ش� �������� ����Ʈ select
		return selectList;
		
	}
}
