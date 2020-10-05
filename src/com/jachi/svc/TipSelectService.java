package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.TipDTO;

public class TipSelectService {

	public List<TipDTO> getTipinfo() {
		SqlSession sqlsession = BoardDAO.getInstance();
		List<TipDTO> Tipselectall = sqlsession.selectList("select_Tipinfo");

		

		return Tipselectall;
	}
}
