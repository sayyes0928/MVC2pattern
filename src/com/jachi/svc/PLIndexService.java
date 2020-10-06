package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.ProductinfoDTO;

public class PLIndexService {

	SqlSession sqlsession = BoardDAO.getInstance();

	public List<ProductinfoDTO> getproindexinfo() {

		List<ProductinfoDTO> ProListAll = sqlsession.selectList("select_listall");

		

		return ProListAll;

	}
}
