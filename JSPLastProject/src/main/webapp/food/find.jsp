<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<div class="wrapper row3">
	  <main class="container clear"> 
	    <div class="content"> 
	      <div id="gallery">
	        <figure>
	          <header class="heading inline">
	          	<form method="post" action="../food/find.do">
		          	<input type="text" name="ss" class="input-sm" size="20" value="${ss}">
		          	<input type="submit" value="검색" class="btn-sm btn-primary">
	          	</form>
	          </header>
	          <ul class="nospace clear">
	          	<c:forEach var="vo" items="${fList}" varStatus="s">
		            <li class="one_quarter ${s.index%4==0?'first':''}"><a href="../food/detail_before.do?fno=${vo.fno}&type=1"><img src="http://menupan.com${vo.poster}" title="${vo.name}"></a></li>	          	
	          	</c:forEach>
	          </ul>
	        </figure>
	      </div>
	      <nav class="pagination">
	        <ul>
	        	<c:if test="${startpage>1}">
		          <li><a href="../food/find.do?page=${startpage-1}&ss=${ss}">&laquo; Previous</a></li>
	          	</c:if>
	          	<c:forEach var="i" begin="${startpage}" end="${endpage}">
		          	<li ${i==curpage?"class=current":""}><a href="../food/find.do?page=${i}&ss=${ss}">${i}</a></li>
	          	</c:forEach>
	          	<c:if test="${curpage<totalpage}">
		          <li><a href="../food/find.do?page=${endpage+1}&ss=${ss}">Next &raquo;</a></li>
	          	</c:if>
	        </ul>
	      </nav>
	    </div>
	    <div class="clear"></div>
	  </main>
	</div>
</body>
</html>