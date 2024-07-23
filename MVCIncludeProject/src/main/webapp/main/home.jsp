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
	<div class="row">
		<c:forEach var="vo" items="${list}">
			<div class="col-sm-3">
					<a href="../food/detail.do?fno=${vo.fno}">
						<div class="thumbnail">
							<img src="${vo.poster}" style="width:240px;height:200px;">
							<p class="a">${vo.name}</p>
						</div>
					</a>
				</div>
		</c:forEach>
		<table class="table">
			<tr>
				<td class="text-center">
					<a href="../main/main.do?page=${curpage>1?curpage-1:curpage}" class="btn btn-sm btn-success">이전</a>
					${curpage} page / ${totalpage} pages
					<a href="../main/main.do?page=${curpage<totalpage?curpage+1:curpage}" class="btn btn-sm btn-success">다음</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>