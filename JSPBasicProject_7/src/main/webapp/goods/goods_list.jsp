<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.GoodsDAO"></jsp:useBean>
<%
	String strpage=request.getParameter("page");
	if(strpage==null){
		strpage="1";
	}
	int curpage=Integer.parseInt(strpage);
	List<GoodsVO> list=dao.goodsListData(curpage);
	int totalpage=dao.goodsTotalPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<ul class="goods_list">
			<%
				for(GoodsVO vo:list){
			%>
				<li class="goods_li">
					<a href="../main/main.jsp?mode=4&no=<%=vo.getNo()%>">
						<img src="<%=vo.getPoster() %>" alt="<%=vo.getName() %>">
						<div class="text_box">
							<p class="name"><%=vo.getName() %></p>
							<p class="price"><span><%=vo.getDiscount() %>%</span> <%=vo.getPrice() %></p>
							<p class="delivery"><%=vo.getDelivery() %></p>
						</div>				
					</a>
				</li>
			<%
				}
			%>
		</ul>
		<div class="row">
			<div class="text-center">
				<a href="../main/main.jsp?page=<%=curpage>1?curpage-1:curpage%>" class="btn btn-sm btn-danger">이전</a>
				<%=curpage%> page / <%=totalpage %> pages
				<a href="../main/main.jsp?page=<%=curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-primary">다음</a>
			</div>
		</div>
	</div>
</body>
</html>