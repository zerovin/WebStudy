<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.ReplyDAO"/>
<%
	//rno=1&fno=2
	String rno=request.getParameter("rno"); //댓글번호
	String fno=request.getParameter("fno"); //맛집번호
	String type=request.getParameter("type");
	
	dao.replyDelete(Integer.parseInt(rno));
	
	int intType=Integer.parseInt(type);
	//이동
	if(intType==1){
		response.sendRedirect("../main/main.jsp?mode=1&fno="+fno);	
	}else if(intType==2){
		response.sendRedirect("../main/main.jsp?mode=4&no="+fno);
	}
%>