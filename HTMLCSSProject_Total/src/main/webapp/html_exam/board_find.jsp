<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	//사용자가 보내준 값을 받는다 => request.getParameter()
	String strPage=request.getParameter("page");
	//보내준 값을 이용해서 오라클 연결
	//오라클로부터 사용자가 요청한 데이터를 받는다
	
	if(strPage==null){
		strPage="1";
	}
	int curpage=Integer.parseInt(strPage); //현재 보여주는 페이지 번호
	//데이터를 화면에 출력
	BoardDAO dao=BoardDAO.newInstance();
	String cate=request.getParameter("cate");
	String word=request.getParameter("word");
	List<BoardVO> findlist=dao.boardFindData(cate, word, curpage);
	//총페이지
	int count=dao.boardFindTotalPage(cate, word);
	int totalpage=(int)(Math.ceil(count/10.0));
	if(totalpage==0){
		totalpage=1;
	}
	count=count-((curpage*10)-10);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>검색</title>
<style type="text/css">
	.container{
		margin-top:30px;
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
		<h3>자유 게시판</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td>
						<a href="board_insert.jsp" class="btn btn-xs btn-danger">새글</a>
					</td>
				</tr>
			</table>
			<table class="table table-striped">
				<tr>
					<th width="10%" class="text-center">번호</th>
					<th width="45%" class="text-center">제목</th>
					<th width="15%" class="text-center">이름</th>
					<th width="20%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
				</tr>
				<%
					if(count==0){
				%>
					<tr>
						<td colspan="5" class="text-center">검색 결과가 없습니다</td>
					</tr>
				<%
					}else{
						for(BoardVO vo:findlist){
					%>
						<tr>
							<td width="10%" class="text-center"><%=count-- %></td>
							<td width="45%"><a href="board_detail.jsp?no=<%=vo.getNo()%>"><%=vo.getSubject() %></a>
								<%
									String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
									if(today.equals(vo.getDb_day())){
								%>
									&nbsp;<sup style="color:red;">new</sup>
								<%
									}
								%>
							</td>
							<td width="15%" class="text-center"><%=vo.getName() %></td>
							<td width="20%" class="text-center"><%=vo.getDb_day() %></td>
							<td width="10%" class="text-center"><%=vo.getHit() %></td>
						</tr>
					<%
						}
					}
				%>
			</table>
			<table class="table">
				<tr>
					<td class="text-left">
						<form method="GET" action="board_find.jsp">
							<select class="input-sm" name="cate">
								<option value="name">이름</option>
								<option value="subject">제목</option>
								<option value="content">내용</option>
							</select>
							<input type="text" name="word" size="15" class="input-sm">
							<input type="submit" value="검색" class="btn-sm btn-success">
						</form>
					</td>
					<td class="text-right">
						<a href="board_find.jsp?cate=<%=cate %>&word=<%=word %>&page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-primary">이전</a>
						<%=curpage %> page / <%=totalpage %>pages
						<a href="board_find.jsp?cate=<%=cate %>&word=<%=word %>&page=<%=curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-primary">다음</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
