<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>

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
		width:600px;
	}
	h3{
		text-align:center;
	}
</style>
</head>
<body>
	<div class="container">
		<h3>내용보기</h3>
		<div class="row">
			<table class="table">
				<tr>
					<th width="20%" class="text-center">번호</th>
					<td width="30%" class="text-center">${vo.no}</td>
					<th width="20%" class="text-center">작성일</th>
					<td width="30%" class="text-center">${vo.dbday}</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">이름</th>
					<td width="30%" class="text-center">${vo.name}</td>
					<th width="20%" class="text-center">조회수</th>
					<td width="30%" class="text-center">${vo.hit}</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">제목</th>
					<td colspan="3">${vo.subject}</td>
				
				</tr>
				<tr>
					<td colspan="4" class="text-left" valign="top" height="200">
						<pre style="white-space:wrap;border:none;background-color:white;">${vo.content}</pre>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="text-right">
						<a href="update.jsp?no=${vo.no}" class="btn btn-xs btn-success">수정</a>
						<a href="delete.jsp?no=${vo.no}" class="btn btn-xs btn-info">삭제</a>
						<a href="list.do" class="btn btn-xs btn-warning">목록</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>