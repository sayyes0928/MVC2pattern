package com.mvc2BBS.Action;


import javax.servlet.http.*;

import com.mvc2BBS.Vo.ActionForward;

public interface Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
