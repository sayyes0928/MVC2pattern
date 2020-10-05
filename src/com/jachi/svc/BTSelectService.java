package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.QnABBS;
import com.jachi.DTO.TipDTO;

public class BTSelectService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public List<BeautyRoomDTO> getbeautyinfo() {

		List<BeautyRoomDTO> beautylistall = sqlsession.selectList("select_beautyall");
		System.out.println(beautylistall.size());
		

		
		return beautylistall;
		
	}
	public List<QnABBS> getQnaListAll(String or_id) {


		
		String us_id = or_id;
		
		List<QnABBS> qanListAll = sqlsession.selectList("qna_getList",us_id);

		

		
		return qanListAll;
		
	}
	public List<TipDTO> getTipListAll(String or_id) {

		
		String us_id = or_id;
		
		List<TipDTO> postingListAll = sqlsession.selectList("tip_getList",us_id);

		

		
		return postingListAll;
		
	}
	public List<BeautyRoomDTO> getPostList(String us_id) {

		String post_nickname = us_id;

		List<BeautyRoomDTO> posting = sqlsession.selectList("posting_getList",post_nickname);
		
		

		return posting;
		
	}
	
	public int getCountLike (String us_id) {


		int counting_Like = sqlsession.selectOne("counting_Like",us_id);

		return counting_Like;
		
	}
	
	public int getCountScrap (String us_id) {


		int Counting_Scrap = sqlsession.selectOne("Counting_Scrap",us_id);


		return Counting_Scrap;
		
	}
}
