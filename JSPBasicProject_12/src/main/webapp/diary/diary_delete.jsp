<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	// diary_delete.jsp?no=
	String no=request.getParameter("no");
	DiaryService dao=DiaryService.newInstance();
	//delete 요청
	dao.diaryDelete(Integer.parseInt(no));
	//화면 이동
	response.sendRedirect("diary.jsp");
%>