<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String strPage=request.getParameter("page");
	if(strPage==null){
		strPage="1";
	}
	int curpage=Integer.parseInt(strPage);
	
	GoodsDAO dao=GoodsDAO.newInstance();
	List<GoodsVO> list=dao.goodsListData(curpage);
	int totalpage=dao.goodsTotalPage();
	for(GoodsVO vo:list){
		String s=vo.getName();
		if(s.length()>25){
			s=s.substring(0, 25)+"...";
			vo.setName(s);
		}
		vo.setName(s);
	}
	request.setAttribute("list", list);
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
			width: 960px;
		}
		.row img{
			transition:.3s;
			opacity:.6;
		}
		.row img:hover{
			opacity:1;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<c:forEach var="vo" items="${list}">
				<div class="col-md-3">
					<div class="thumbnail">
						<a href="#">
							<img src="${vo.poster} " alt="Lights" style="width:100%">
							<div class="caption">
								<p>${vo.name}</p>
							</div>
						</a>
				    </div>
				</div>
			</c:forEach>
		</div>
		<div class="row">
			<div class="text-center">
				<a href="goods.jsp?page=<%= curpage>1?curpage-1:curpage%>" class="btn btn-sm btn-danger">이전</a>
				<span><%=curpage %> page / <%=totalpage %> pages</span>
				<a href="goods.jsp?page=<%= curpage<totalpage?curpage+1:curpage%>" class="btn btn-sm btn-success">다음</a>
			</div>
		</div>
	</div>
</body>
</html>