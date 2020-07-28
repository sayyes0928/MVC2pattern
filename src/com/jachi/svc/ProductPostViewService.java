package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.ProductinfoDTO;

public class ProductPostViewService {
        public List<ProductinfoDTO> getArticle(String pro_code) {
        	
    		//
   		 SqlSessionFactory sqlfactory = BoardDAO.getConn();
   		 SqlSession sqlsession = sqlfactory.openSession();
   		 System.out.println(pro_code);
   		 List<ProductinfoDTO> productselect = sqlsession.selectList("select_productpostview", pro_code);
        
   	
   		sqlsession.close();
   		
   		return productselect;
        
        }

}
