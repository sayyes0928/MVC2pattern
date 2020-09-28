package com.jachi.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.Qna_comment_reply;

public class QnaCommentReplyListService {
	
public List<Qna_comment_reply> getreply(int qnanum, int qnaconum){
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession =sqlfactory.openSession();
		Map<String,Object> renum = new HashMap<>();
		renum.put("qnanum", qnanum);
		renum.put("qnaconum", qnaconum);
		List<Qna_comment_reply> getcmlist = sqlsession.selectList("qna_select_comment_reply",renum);
		sqlsession.close();
		
		return getcmlist;
		
	}

}
