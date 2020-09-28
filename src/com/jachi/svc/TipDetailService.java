package com.jachi.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    
    public List<TipReplyDTO> getArticleList(int page, int limit, int tip_num) throws Exception{
    	
    	int Startrow = (page-1)*12;
    	    	
    	Map<String,Object> map = new HashMap<>();
		map.put("Startrow", Startrow);
		map.put("limit", limit);
		map.put("rep_tup_num", tip_num);
		
    	SqlSessionFactory sqlfactory = BoardDAO.getConn();
    	SqlSession sqlsession = sqlfactory.openSession();
    	
    	List<TipReplyDTO> selectlist = sqlsession.selectList("select_tip_Commentlist", map);
    	
    	return selectlist;
    }

}
