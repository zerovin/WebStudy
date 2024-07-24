<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../food/food.css">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper row3">
	  <main class="container clear"> 
		<div id="a">
			<img src="../food/map/1111.png" id="seoul_1">
			<c:forEach var="i" begin="1" end="25">
				<a href="../food/find.do?gu=${i}">
					<img id="gu${i}" src="../food/map/gu_${i}_off.png" onmouseover="this.src='../food/map/gu_${i}_on.png'" onmouseout="this.src='../food/map/gu_${i}_off.png'">
				</a>
			</c:forEach>
		</div>
	    <div class="content"> 
	      <div id="gallery">
	        <figure>
	          <header class="heading">
	     		<h3>${fd} 맛집은 총 <span style="color:orange;">${count}</span>개 있습니다</h3>
	          </header>
	          <ul class="nospace clear">
	          	<c:forEach var="vo" items="${list}" varStatus="s">
	            	<li class="one_quarter ${s.index%4==0?'first':''}"><a href="../food/detail.do?fno=${vo.fno}"><img src="${vo.poster}" alt="${vo.name}" title="${vo.address}"></a></li>
	            </c:forEach>
	          </ul>
	        </figure>
	      </div>
	      <nav class="pagination">
	       <ul>
	          <c:if test="${startpage>1}">
	          	<li><a href="../food/find.do?page=${startpage-1}&gu=${gu}">&laquo; Previous</a></li>
	          </c:if>
	          <c:forEach var="i" begin="${startpage}" end="${endpage}">
	          	<li ${curpage==i?"class=current":""}><a href="../food/find.do?page=${i}&gu=${gu}">${i}</a></li>
	          </c:forEach>
	          <c:if test="${endpage<totalpage}">
	          	<li><a href="../food/find.do?page=${endpage+1}&gu=${gu}">Next &raquo;</a></li>
	          </c:if>
	        </ul>
	      </nav>
	    </div>
	    <div class="clear"></div>
	  </main>
	</div>
</body>
</html>