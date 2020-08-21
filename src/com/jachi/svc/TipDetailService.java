package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.TipDTO;

public class TipDetailService {
	
    public List<TipDTO> getTipinfo(int tip_num) {
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<TipDTO> Tipselectall = sqlsession.selectList("select_TipDetail", tip_num);
		
		sqlsession.close();
		
		return Tipselectall;
 }

}
