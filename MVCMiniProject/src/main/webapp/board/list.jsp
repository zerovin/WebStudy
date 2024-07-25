<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
	.brow{
		margin:0px auto;
		width: 800px;
	}
</style>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<div class="brow">
				<h2 class="sectiontitle">자유 게시판</h2>
				<table class="table">
					<tr>
						<td>
							<a href="../board/insert.do" class="btn btn-sm btn-primary">새글</a>
						</td>
					</tr>
				</table>
				<table class="table">
					<tr>
						<th width="10%" class="text-center">번호</th>
						<th width="45%" class="text-center">제목</th>
						<th width="15%" class="text-center">이름</th>
						<th width="20%" class="text-center">작성일</th>
						<th width="10%" class="text-center">조회수</th>
					</tr>
					<%-- for(BoardVO vo:list) --%>
					<c:set var="count" value="${count}"/> <!-- 순차적 번호출력 -->
					<c:forEach var="vo" items="${list}">
						<tr>
							<td width="10%" class="text-center">${count}</td>
							<td width="45%">
								<a href="../board/detail.do?no=${vo.no}">${vo.subject}</a>
								&nbsp;
								<c:if test="${today==vo.dbday}"><sup><img src="../board/new.gif"></sup></c:if>
							</td> <!-- vo.getSubject -->
							<td width="15%" class="text-center">${vo.name}</td>
							<td width="20%" class="text-center">${vo.dbday}</td>
							<td width="10%" class="text-center">${vo.hit}</td>
						</tr>
					<c:set var="count" value="${count-1}"/> <!-- 반복문 끝나기 전에 1씩 감소 -->
					</c:forEach>
				</table>
				<table class="table">
					<tr>
						<td class="text-left inline">
							<input type="checkbox" value="name">이름
							<input type="checkbox" value="subject">제목
							<input type="checkbox" value="content">내용
							<input type="text" name="ss" class="input-sm" size="15">
							<input type="submit" class="btn-sm btn-success" value="검색">
						</td>
						<td class="text-right">
							<a href="../board/list.do?page=${curpage>1?curpage-1:curpage}" class="btn btn-sm btn-info">이전</a>
							${curpage} page / ${totalpage} pages
							<a href="../board/list.do?page=${curpage<totalpage?curpage+1:curpage}" class="btn btn-sm btn-warning">다음</a>
						</td>
					</tr>
				</table>
			</div>
		</main>
	</div>
</body>
</html>