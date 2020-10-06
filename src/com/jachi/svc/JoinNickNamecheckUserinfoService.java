package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DTO.ProductinfoDTO;
import com.jachi.DAO.BoardDAO;

public class JoinNickNamecheckUserinfoService {
	
	public String checkUserNickName(String us_nkname) {
		  SqlSession sqlsession = BoardDAO.getInstance();
		  String nick_se = sqlsession.selectOne("us_Nickname_select", us_nkname);
		  

		return nick_se;
		
	}
}
