<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	RequestDispatcher rd=request.getRequestDispatcher("output.jsp");
	rd.forward(request, response);
	
	/*
		HTML 화면이동 - <a>, <form> => 데이터 전송, 화면변경
		Java 화면이동 - 서버에서 변경
		            - pageContext.forward()
		              RequestDispatcher.forward()
		              ============================== request 유지
		              response.sendRedirect() - request 초기화
		JavaScript 화면이동 - location.href="파일명"
	*/
%>