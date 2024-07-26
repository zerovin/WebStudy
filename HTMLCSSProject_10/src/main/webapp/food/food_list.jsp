<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
	/*
		1.웹 출력 => 데이터를 가지고 온다, 오라클(자바)
		2.데이터를 HTML에 출력
	*/
	String type=request.getParameter("type");
	if(type==null){
		type="1";
	}
	String strPage=request.getParameter("page");
	if(strPage==null){
		strPage="1";
	}
	int curpage=Integer.parseInt(strPage);
	FoodDAO dao=FoodDAO.newInstance();
	List<FoodVO> list=dao.foodListData(Integer.parseInt(type), curpage);
	int totalpage=dao.foodListTotalPage(Integer.parseInt(type));
	
	//블럭별 페이지 나누기
	/*
		이동페이지 10개
		현재페이지 1~10
		        11~20 
	*/
	final int BLOCK=10;
	int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	
	//조건 처리 안해주면 페이지가 10단위로 나와서 빈페이지 출fur
	if(endPage>totalpage){
		endPage=totalpage;
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
	.a{
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<!-- Ajax, JSON -->
				<a href="food_list.jsp?type=1" class="btn btn-lg btn-success">한식</a>
				<a href="food_list.jsp?type=2" class="btn btn-lg btn-info">중식</a>
				<a href="food_list.jsp?type=3" class="btn btn-lg btn-warning">양식</a>
				<a href="food_list.jsp?type=4" class="btn btn-lg btn-primary">일식</a>
			</div>
		</div>
		<div style="height:20px;"></div>
		<div class="row">
		<%-- 이미지출력 --%>
		<%
			for(FoodVO vo:list){	
		%>
			<div class="col-sm-3">
				<a href="#">
					<div class="thumbnail">
						<img src="<%=vo.getPoster() %>" style="width:240px;height:240px;" class="img-rounded">
						<p class="a"><%=vo.getName() %></p>
					</div>
				</a>
			</div>
		<%
			}
		%>
		</div>
		<div style="height:20px;"></div>
		<div class="row">
			<div class="text-center">
				<ul class="pagination">
				<%
					if(startPage>1){
				%>
					<li><a href="food_list.jsp?type=<%=type%>&page=<%=startPage-1%>">&lt;</a></li>
				<%
					}
				%>
				<%
					for(int i=startPage;i<=endPage;i++){
				%>
					<li class=<%=i==curpage?"active":""%>><a href="food_list.jsp?type=<%=type%>&page=<%=i%>"><%=i%></a></li>
				<%
					}
				%>
				<%
					if(endPage<totalpage){
				%>
					<li><a href="food_list.jsp?type=<%=type%>&page=<%=endPage+1%>">&gt;</a></li>
				<%
					}
				%>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>