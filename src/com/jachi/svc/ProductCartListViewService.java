package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.OrderDTO;
import com.jachi.DTO.Product_cartDTO;
import com.jachi.DTO.ProductinfoDTO;

public class ProductCartListViewService {
        public List<Product_cartDTO> getArticle(OrderDTO orderDTO) {
        	
    		
   		 SqlSessionFactory sqlfactory = BoardDAO.getConn();
   		 SqlSession sqlsession = sqlfactory.openSession();
   		 List<Product_cartDTO> productselect = sqlsession.selectList("select_productCartList", orderDTO);
        
   	
   		sqlsession.close();
   		
   		return productselect;
        
        }

}
