<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper row3">
	  <main class="container clear"> 
	    <div class="content"> 
	      <div id="gallery">
	        <figure>
	          <header class="heading">${title}</header>
	          <ul class="nospace clear">
	          	<c:forEach var="vo" items="${gList}" varStatus="s">
	            <li class="one_quarter ${s.index%4==0?'first':''}"><a href="../goods/detail.do?no=${vo.no}&cno=${cno}"><img src="${vo.goods_poster}" title="${vo.goods_name}"></a></li>	          	
	          	</c:forEach>
	          </ul>
	        </figure>
	      </div>
	      <nav class="pagination">
	        <ul>
	        	<c:if test="${startpage>1}">
		          <li><a href="../goods/list.do?page=${startpage-1}&cno=${cno}">&laquo; Previous</a></li>
	          	</c:if>
	          	<c:forEach var="i" begin="${startpage}" end="${endpage}">
		          	<li ${i==curpage?"class=current":""}><a href="../goods/list.do?page=${i}&cno=${cno}">${i}</a></li>
	          	</c:forEach>
	          	<c:if test="${curpage<totalpage}">
		          <li><a href="../goods/list.do?page=${endpage+1}&cno=${cno}">Next &raquo;</a></li>
	          	</c:if>
	        </ul>
	      </nav>
	    </div>
	    <div class="clear"></div>
	  </main>
	</div>
</body>
</html>