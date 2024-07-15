<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
	String strPage=request.getParameter("page");
	if(strPage==null){
		strPage="1";
	}
	int curpage=Integer.parseInt(strPage);
	
	//DB연동
	SeoulDAO dao=SeoulDAO.newInstance();
	List<LocationVO> list=dao.seoulLocationListData(curpage);
	
	int totalpage=dao.seoulLocationTotalPage();
	
	final int BLOCK=10;
	int startpage=((curpage-1)/BLOCK*BLOCK)+1;
	int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	if(endpage>totalpage){
		endpage=totalpage;
	}
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
		width:960px;
	}
	a{
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<% for(LocationVO vo:list){ %>
				<div class="col-sm-3">
					<div class="thumbnail">
						<a href="">
							<img src="<%=vo.getPoster() %>" style="width:240px;height:200px;" alt="<%=vo.getTitle()%>">
							<p class="a"><%=vo.getTitle() %></p>
						</a>
					</div>
				</div>
			<%} %>
		</div>
		<div class="row">
			<div class="text-center">
				<ul class="pagination">
				<% if(startpage>1) {%>
					<li><a href="list.jsp?page=<%=startpage-1%>">&lt;</a></li>
				<%} %>
					<% for(int i=startpage;i<=endpage;i++){ %>
						<li class="<%=i==curpage?"active":""%>"><a href="list.jsp?page=<%=i%>"><%=i %></a></li>
					<%} %>
				<% if(endpage<totalpage){ %>
					<li><a href="list.jsp?page=<%=endpage+1%>">&gt;</a></li>
				<%} %>
				</ul>
			</div>
		</div>
		<div style="height:20px;"></div>
		<div class="row">
			<h3>최근 방문 서울 여행</h3>
			<hr>
		</div>
	</div>
</body>
</html>