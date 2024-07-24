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
	          <header class="heading">명소 목록</header>
	          <ul class="nospace clear">
	          	<c:forEach var="vo" items="${list}" varStatus="s">
	            	<li class="one_quarter ${s.index%4==0?'first':''}">
	            		<a href="#" style="display:flex;justify-content:center;background:#fff;">
	            			<img src="${vo.poster}" title="${vo.title}" alt="${vo.title}" onerror="this.src='no_img.jpg'" style="height:160px;">
	            		</a>
	            	</li>
	            </c:forEach>
	          </ul>
	        </figure>
	      </div>
	      <nav class="pagination">
	        <ul>
	          <c:if test="${startpage>1}">
	          	<li><a href="../food/list.do?page=${startpage-1}">&laquo; Previous</a></li>
	          </c:if>
	          <c:forEach var="i" begin="${startpage}" end="${endpage}">
	          	<li ${curpage==i?"class=current":""}><a href="../food/list.do?page=${i}">${i}</a></li>
	          </c:forEach>
	          <c:if test="${endpage<totalpage}">
	          	<li><a href="../food/list.do?page=${endpage+1}">Next &raquo;</a></li>
	          </c:if>
	        </ul>
	      </nav>
	    </div>
	    <div class="clear"></div>
	  </main>
	</div>
</body>
</html>