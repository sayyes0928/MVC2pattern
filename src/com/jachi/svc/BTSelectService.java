package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;

public class BTSelectService {

	public List<BeautyRoomDTO> getbeautyinfo() {
		System.out.println("���񽺵���");
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<BeautyRoomDTO> beautylistall = sqlsession.selectList("select_beautyall");
		
		sqlsession.close();
		System.out.println("�����ߴٳ��");
		
		return beautylistall;
		
	}
}
