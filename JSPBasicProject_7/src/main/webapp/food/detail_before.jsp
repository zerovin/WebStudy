<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fno=request.getParameter("fno");
	Cookie cookie=new Cookie("food_"+fno, fno);
	cookie.setPath("/");
	cookie.setMaxAge(60*60*24); //저장기간, 초단위 하루만 저장 setMaxAge(0)=>삭제
	//브라우저 전송
	response.addCookie(cookie);
	
	//화면이동
	response.sendRedirect("../main/main.jsp?mode=1&fno="+fno);
%>