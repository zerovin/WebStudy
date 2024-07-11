<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.ReplyDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String fno=request.getParameter("fno");
	String rno=request.getParameter("rno");
	String msg=request.getParameter("msg");
	String type=request.getParameter("type");
	
	ReplyVO vo=new ReplyVO();
	vo.setRno(Integer.parseInt(rno));
	vo.setMsg(msg);
	
	dao.replyUpdate(vo);
	
	int intType=Integer.parseInt(type);
	//이동
	if(intType==1){
		response.sendRedirect("../main/main.jsp?mode=1&fno="+fno);
	}else if(intType==2){
		response.sendRedirect("../main/main.jsp?mode=4&no="+fno);
	}
%>
