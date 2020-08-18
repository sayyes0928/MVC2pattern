package com.jachi.svc;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.Product_cartDTO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ProductCartInsertService {

	public void registArticle(Product_cartDTO product_cartDTO) throws Exception {

		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		int insert = sqlsession.insert("insert_cart_orderinfo", product_cartDTO);

		sqlsession.commit();
		sqlsession.close();

	}

}
