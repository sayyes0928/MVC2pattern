package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.TipDTO;

public class TipListService {
	SqlSession sqlsession = BoardDAO.getInstance();
	public int getListcount() throws Exception {
    	
		int listCount = 0;
		
		
		listCount = sqlsession.selectOne("select_tipcount");
		
		return listCount;
    }
	
	public List<TipDTO> getArticleList(int page, int limit) throws Exception {
		
		int Startrow = (page-1)*12;
		
        
	    List<TipDTO> selectlist = sqlsession.selectList("select_TipListAll", Startrow);
	    
	    return selectlist;
	}
}
