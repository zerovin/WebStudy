<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%--
	JSP에서 요청 : <a> <form>
	 => BoardDAO => BoardModel => update.jsp
 --%>
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
		<h3>수정하기</h3>
		<div class="row">
			<form method="POST" action="update_ok.jsp">
				<table class="table">
					<tr>
						<th width="20%" class="text-right">이름</th>
						<td width="80%">
							<input type="hidden" name="no" value="${vo.no}">
							<input type="text" name="name" size="20" class="input-sm" value="${vo.name}" required>
						</td>
					</tr>
					<tr>
						<th width="20%" class="text-right">제목</th>
						<td width="80%">
							<input type="text" name="subject" size="60" class="input-sm" value="${vo.subject}" required>
						</td>
					</tr>
					<tr>
						<th width="20%" class="text-right">내용</th>
						<td width="80%">
							<textarea rows="10" cols="52" name="content" required>${vo.content}</textarea>
						</td>
					</tr>
					<tr>
						<th width="20%" class="text-right">비밀번호</th>
						<td width="80%">
							<input type="password" name="pwd" size="10" class="input-sm" required>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<button class="btn-sm btn-danger">수정</button>
							<input type="button" value="취소" class="btn-sm btn-primary" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>