<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	GoodsDAO dao=GoodsDAO.newInstance();

	String cate_num=request.getParameter("cate");
	if(cate_num==null){
		cate_num="1";
	}
	String strPage=request.getParameter("page");
	if(strPage==null){
		strPage="1";
	}
	String word=request.getParameter("word");
	
	int curpage=Integer.parseInt(strPage);
	int table_num=Integer.parseInt(cate_num);
	List<GoodsVO> list=dao.goodsListData(table_num, curpage, word);
	int totalPage=dao.goodsListTotalPage(table_num, word);
	
	//List<GoodsVO> findList=dao.goodsFindData(word, curpage);
	
	final int BLOCK=10;
	int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	if(endPage>totalPage){
		endPage=totalPage;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="goods_list.css">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="top">
			<div class="btns">
				<a href="goods_list.jsp?cate=1">전체</a>
				<a href="goods_list.jsp?cate=2">베스트</a>
				<a href="goods_list.jsp?cate=3">신상품</a>
				<a href="goods_list.jsp?cate=4">특가</a>
			</div>
			<form action="goods_list.jsp" method="GET">
				<input type="text" name="word" placeholder="상품명을 입력하세요">
				<input type="submit" value="검색">
			</form>
		</div>
		<ul class="goods_list">
		<%
			for(GoodsVO vo:list){
		%>
			<li class="goods_li">
				<a href="goods_detail.jsp?no=<%=vo.getNo()%>">
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
		<ul class="pagination">
		<%
			if(startPage>1){
		%>
			<li><a href="goods_list.jsp?table_num=<%=table_num%>&page=<%=startPage-1%>">&lt;</a></li>
		<%
			}
		%>
		<%
			for(int i=startPage;i<=endPage;i++){
		%>
			<li class=<%=i==curpage?"active":"" %>><a href="goods_list.jsp?table_num=<%=table_num%>&page=<%=i%>"><%=i %></a></li>
		<%
			}
		%>
		<%
			if(endPage<totalPage){
		%>
			<li><a href="goods_list.jsp?table_num=<%=table_num%>&page=<%=endPage+1%>">&gt;</a></li>
		<%
			}
		%>
		</ul>
	</div>
</body>
</html>