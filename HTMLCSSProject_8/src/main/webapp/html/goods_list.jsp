<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
	GoodsDAO dao=GoodsDAO.newInstance();
	
	String strPage=request.getParameter("page");
	if(strPage==null){
		strPage="1";
	}
	int curpage=Integer.parseInt(strPage);
	List<GoodsVO> list=dao.goodsListData(curpage);
	int totalpage=dao.goodsTotalPage();
	
	final int PAGEBLOCK=10;
	int startPage=((curpage-1)/PAGEBLOCK*PAGEBLOCK)+1;
	int endPage=((curpage-1)/PAGEBLOCK*PAGEBLOCK)+PAGEBLOCK;
	if(endPage>totalpage){
		endPage=totalpage;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="goods_list.css">
</head>
<body>
	<div class="container">
		<ul class="goods_list">
		<%
			for(GoodsVO vo:list){
		%>
			<li class="goods_li">
				<a href="goods_detail.jsp?no=<%=vo.getNo()%>">
					<img src="<%=vo.getPoster() %>" alt="<%=vo.getName()%>">
					<div class="text_box">
						<p class="name"><%=vo.getName() %></p>
						<div class="prices">
							<p class="discount"><%=vo.getDiscount() %>%</p>
							<p class="price"><%=vo.getPrice() %></p>
						</div>
						<p class="delivery"><%=vo.getDelivery() %></p>
					</div>
				</a>
			</li>
		<%
			}
		%>
		</ul>
		<ul class="page">
		<%
			if(startPage>=1){
		%>
				<li><a href="goods_list.jsp?page=<%=startPage-1%>">&lt;</a></li>
		<%
			}
		%>
		<%
			for(int i=startPage;i<=endPage;i++){
		%>
			<li class="<%=curpage==i?"active":""%>"><a href="goods_list.jsp?page=<%=i%>"><%=i %></a></li>
		<%
			}
		%>
		<%
			if(endPage<totalpage){
		%>
			<li><a href="goods_list.jsp?page=<%=endPage+1%>">&gt;</a></li>
		<%
			}
		%>
		</ul>
	</div>
</body>
</html>