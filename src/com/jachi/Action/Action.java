package com.jachi.Action;


import javax.servlet.http.*;

import com.jachi.DTO.ActionForward;

public interface Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
	 //Action interface의 추상메소드 execute
}


