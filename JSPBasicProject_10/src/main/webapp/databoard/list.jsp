<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%-- 자바로부터 데이터를 읽어온다 --%>
<%
	//1.사용자로부터 페이지 번호를 받는다
	String strPage=request.getParameter("page");
	if(strPage==null){ //실행시에는 사용자로부터 페이지를 받지 못한다 => 디폴트 페이지 설정
		strPage="1";
	}
	//현재 페이지 설정
	int curpage=Integer.parseInt(strPage);
	//오라클로부터 해당 페이지의 데이터를 읽어 온다
	//<jsp:useBean id="dao" class="DataBoardDAO"> MVC에서는 사용하지 않는다 => Spring=MVC
	DataBoardDAO dao=DataBoardDAO.newInstance();
	List<DataBoardVO> list=dao.dataBoardListData(curpage);
	int count=dao.dataBoardRowCount(); //순차적 번호출력 목적
	int totalpage=(int)(Math.ceil(count/10.0)); //실제 총페이지
	
	//변호변경
	count=count-((curpage*10)-10); //다음페이지마다 10씩 감소 => 게시물을 삭제하더라도 번호는 순차적
	
	/*
	  Model (Java파일에서 메소드화) => Controller(브라우저로 전송) => View(받아서 화면출력)
	  소스는 변경사항이 없다, 자바/HTML 분리됨
	  JSP에서 사용된 자바는 태그형으로 변경 예정
	   => JSTL > taglib
	   ex) for() => <c:forEach>
	       if() => <c:if>
	       switch => <c:choose>
	       sendRedirect() => <c:redirect>
	   
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
	.container{
		margin-top:50px;
	}
	.row{
		margin:0px auto;
		width:800px;
	}
	h3{
		text-align:center;
	}
</style>
</head>
<body>
	<div class="container">
		<h3>자료실</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td>
						<a href="insert.jsp" class="btn btn-sm btn-primary">새글</a>
					</td>
				</tr>
			</table>
			<table class="table table-hover">
				<thead>
					<tr class="danger">
						<th width="10%" class="text-center">번호</th>
						<th width="45%" class="text-center">제목</th>
						<th width="15%" class="text-center">이름</th>
						<th width="20%" class="text-center">작성일</th>
						<th width="10%" class="text-center">조회수</th>
					</tr>
				</thead>
				<tbody>
				<% for(DataBoardVO vo:list){ %>
					<tr>
						<td width="10%" class="text-center"><%=count-- %></td>
						<td width="45%">
							<a href="detail.jsp?no=<%=vo.getNo()%>"><%=vo.getSubject() %></a>
							<%--
								실제 게시물번호 전송 - 번호에 해당되는 데이터를 가지고 와서 출력
								상세보기 => 무조건 primary key 전송
								primary key - row를 구분하는 구분자
							--%>
							<%
								String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
								if(today.equals(vo.getDbday())){
							%>
									&nbsp;<sup style="color:red;">new</sup>
							<% 
								}
							%>
						</td>
						<td width="15%" class="text-center"><%=vo.getName() %></td>
						<td width="20%" class="text-center"><%=vo.getDbday() %></td>
						<td width="10%" class="text-center"><%=vo.getHit() %></td>
					</tr>
				<% } %>
				</tbody>
			</table>
			<table class="table">
				<tr>
					<td class="text-center">
						<a href="list.jsp?page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-success">이전</a>
						<%=curpage %> page / <%=totalpage %> pages
						<a href="list.jsp?page=<%=curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-info">다음</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>