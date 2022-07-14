<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("id"); //세션에 id를 담았고
	if (id == null || id.equals("")) { 				// id 알수없거나 없을 경우
		response.sendRedirect("stuLoginForm.do"); 	// login페이지로 이동하라
	}
%>	
