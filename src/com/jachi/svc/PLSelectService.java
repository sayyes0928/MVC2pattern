package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DTO.ProductinfoDTO;
import com.jachi.DAO.BoardDAO;

public class PLSelectService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public List<ProductinfoDTO> getproinfo() {

		List<ProductinfoDTO> ProListAll = sqlsession.selectList("select_listall");
		
		
		return ProListAll;
		
	}
}
