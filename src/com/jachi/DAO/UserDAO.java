package com.jachi.DAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.java.dto.UserDTO;

public class UserDAO {
	private static SqlSessionFactory sqlfactory;
	private static UserDAO instance;
	
	public static UserDAO getinstance () {
		if(instance==null) { //이미 실행된 적이 없으면,
			synchronized(UserDAO.class) {
				instance = new UserDAO(); //연결객체 생성
				
			}
		}
		return instance;
	}
	
	public List<UserDTO> select_all() { //mapper 연결
		SqlSession sqlsession = sqlfactory.openSession();
		try {
			 List<UserDTO> selectList = sqlsession.selectList("select_all"); //sql 문장으로 가져온 값을 List에 담는다
			 return selectList;
		} finally {
			 sqlsession.close();

		}
		
		
		 	
	}
	
	

	public void insert_data(UserDTO userDTO) {
		SqlSession sqlsession = sqlfactory.openSession();
		try {
			int insert = sqlsession.insert("insert_data",userDTO);
			sqlsession.commit();
		} finally {
			sqlsession.close();
		}
		
		
	}
	
	public void update_data(UserDTO userDATA) {
		SqlSession sqlsession = sqlfactory.openSession();
		try {
			int update = sqlsession.update("update_data",userDATA);
			sqlsession.commit();
		} finally {
			sqlsession.close();

		}
		
		
	}
	public void delete_data(UserDTO userDTO) {
		SqlSession sqlsession = sqlfactory.openSession();
		try {
			int delete = sqlsession.delete("delete_data", userDTO);
			sqlsession.commit();
		} finally {
			sqlsession.close();
		}
		
		
	}
	
	public static SqlSessionFactory getConn() { // xml 읽는 생성자
		//연결
		try {
			//sqlfactory 인스턴스를 사용하기 위해 SqlSessionFactoryBuilder() 를 통해 빌드한다.
			//이때, mybatis-config.xml 의 설정 파일에서 sqlfactory 를 빌드한다
			Reader reader = Resources.getResourceAsReader("mybatis/java/dao/mybatis-config.xml"); //xml 파일(mybatis.xml 파일)
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return sqlfactory;
	}


}
