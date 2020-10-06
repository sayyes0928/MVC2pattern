package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.OrderDTO;
import com.jachi.DTO.Product_cartDTO;
import com.jachi.DTO.ProductinfoDTO;

public class ProductCartListViewService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public List<Product_cartDTO> getArticle(OrderDTO orderDTO) {

		List<Product_cartDTO> productselect = sqlsession.selectList("select_productCartList", orderDTO);

		

		return productselect;

	}

}
