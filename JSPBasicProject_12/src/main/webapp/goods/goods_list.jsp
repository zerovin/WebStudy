<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
	//사용자가 요청한 값을 받는다
	String strPage=request.getParameter("page");
	if(strPage==null){
		strPage="1";
	}
	int curpage=Integer.parseInt(strPage);
	
	GoodsDAO dao=GoodsDAO.newInstance();
	List<GoodsVO> list=dao.goodsListData(curpage);
	int totalpage=dao.goodsTotalPage();
	
	//BLOCK
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
			<a href="cart_list.jsp" class="btn btn-sm btn-danger">장바구니 목록 보기</a>
		</div>
		<div style="height:20px"></div>
		<div class="row">
			<% for(GoodsVO vo:list){ %>
				<div class="col-sm-3">
					<div class="thumbnail">
						<img src="<%=vo.getPoster()%>" alt="<%=vo.getName()%>" style="width:240px;height:200px;">
						<p class="a"><%=vo.getName()%></p>
						<p>
							<form method="POST" action="cart_insert.jsp">
								수량 : 
								<select class="input-sm" name="account">
									<% for(int i=1;i<=10;i++){ %>
										<option value="<%=i%>"><%=i%>개</option>
									<%} %>
								</select>
								<input type="hidden" name="poster" value="<%=vo.getPoster() %>">
								<input type="hidden" name="name" value="<%=vo.getName() %>">
								<input type="hidden" name="price" value="<%=vo.getPrice() %>">
								<input type="hidden" name="no" value="<%=vo.getNo() %>">
								<button class="btn-sm btn-primary">장바구니</button>
							</form>
						</p>
					</div>
				</div>
			<%} %>
		</div>
		<div class="row">
			<div class="text-center">
				<ul class="pagination">
				<% if(startpage>1){ %>
					<li><a href="goods_list.jsp?page=<%=startpage-1%>">&laquo;</a></li>
				<%} %>
				<% for(int i=startpage;i<=endpage;i++){ %>
					<li class="<%=i==curpage?"active":""%>"><a href="goods_list.jsp?page=<%=i%>"><%=i%></a></li>
				<%} %>
				<% if(endpage<totalpage){ %>
					<li><a href="goods_list.jsp?page=<%=endpage+1%>">&raquo;</a></li>
				<%} %>
				</ul>			
			</div>
		</div>
	</div>
</body>
</html>