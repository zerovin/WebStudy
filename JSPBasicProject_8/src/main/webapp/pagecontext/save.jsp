<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.forward("output.jsp"); // request를 output.jsp에 전송
	//save.jsp주소 유지 output.jsp 내용
	
	/*
		forward는 다른 파일이동시 request 유지 => URL 동일 => MVC에서 주로 사용
		sendRedirect는 request 초기화 후 파일 이동 => URL변경
	*/
%>