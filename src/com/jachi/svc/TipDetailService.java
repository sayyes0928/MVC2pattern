package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.TipDTO;
import com.jachi.DTO.TipReplyDTO;

public class TipDetailService {
	
    public List<TipDTO> getTipinfo(int tip_num) {
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<TipDTO> Tipselectall = sqlsession.selectList("select_TipDetail", tip_num);
		
		sqlsession.close();
		
		return Tipselectall;
    }
    
    public int getListcount() throws Exception {
    	int listcount = 0;
    	
    	SqlSessionFactory sqlfactory = BoardDAO.getConn();
    	SqlSession sqlsession = sqlfactory.openSession();
    	listcount = sqlsession.selectOne("select_tip_comment_count");
    	
    	return listcount;
    }
    
    public List<TipReplyDTO> getArticleList(int page, int limit) throws Exception{
    	
    	int Startrow = (page-1)*12;
    	
    	SqlSessionFactory sqlfactory = BoardDAO.getConn();
    	SqlSession sqlsession = sqlfactory.openSession();
    	
    	List<TipReplyDTO> selectlist = sqlsession.selectList("select_tip_Commentlist", Startrow);
    	
    	return selectlist;
    }

}
