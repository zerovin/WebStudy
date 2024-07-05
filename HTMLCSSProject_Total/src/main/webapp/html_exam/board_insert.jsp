<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
	.container{
		margin-top:30px;
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
<!-- 
	JSP
	1. 브라우저에 출력
	2. 사용자가 보내준 데이터를 받아서 오라클 연결 => 기능만처리 보여주는 창X
	   ~_ok.jsp
 -->
<body>
	<div class="container">
		<h3>글쓰기</h3>
		<div class="row">
			<form method="POST" action="board_insert_ok.jsp">
				<table class="table">
					<tr>
						<th width="25%" class="text-right">이름</th>
						<td width="75%">
							<input type="text" name="name" size="20" class="input-sm" required>
							<!--
								name : 자바에 보내주는 데이터를 받을 때 사용되는 속성명
								id, class : 자바스크립트, CSS 구분자 
							 -->
						</td>
					</tr>
					<tr>
						<th width="25%" class="text-right">제목</th>
						<td width="75%">
							<input type="text" name="subject" size="55" class="input-sm" required>
						</td>
					</tr>
					<tr>
						<th width="25%" class="text-right">내용</th>
						<td width="75%">
							<textarea rows="10" cols="56" name="content" required></textarea>
						</td>
					</tr>
					<tr>
						<th width="25%" class="text-right">비밀번호</th>
						<td width="75%">
							<input type="password" name="pwd" size="10" class="input-sm" required>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="submit" value="글쓰기" class="btn-sm btn-success">
							<input type="button" value="취소" class="btn-sm btn-warning" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>