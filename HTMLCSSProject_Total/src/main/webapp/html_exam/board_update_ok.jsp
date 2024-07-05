<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	String no=request.getParameter("no");
	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	
	BoardVO vo=new BoardVO();
	vo.setNo(Integer.parseInt(no));
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	//데이터베이스 연동 DAO
	BoardDAO dao=BoardDAO.newInstance();
	
	//화면이동
	boolean bCheck=dao.boardUpdate(vo);
	if(bCheck==false){
	//수정페이지로 이동
%>
	<script>
		alert("비밀번호가 틀립니다");
		history.back();
	</script>
<%
	//상세페이지로 이동
	}else{
		response.sendRedirect("board_detail.jsp?no="+no);	
	}
%>