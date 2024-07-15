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
		margin-top:50px;
	}
	.row{
		margin:0px auto;
		width:800px;
	}
	h3{
		text-align:center;
	}
</style>
</head>
<body>
	<div class="container">
		<h3>글쓰기</h3>
		<div class="row">
		<%--
			POST 기반
			multipart/form-data : 파일업로드 프로토콜
			                      반드시 포함, 없는 경우 파일업로드 불가
		 --%>
			<form method="POST" action="insert_ok.jsp" enctype="multipart/form-data">
				<table class="table">
					<tbody>
						<tr>
							<th width="15%" class="text-right">이름</th>
							<td width="85%">
								<input type="text" name="name" size="20" class="input-sm" required>
							</td>
						</tr>
						<tr>
							<th width="15%" class="text-right">제목</th>
							<td width="85%">
								<input type="text" name="subject" size="60" class="input-sm" required>
							</td>
						</tr>
						<tr>
							<th width="15%" class="text-right">내용</th>
							<td width="85%">
								<textarea rows="10" cols="60" name="content"></textarea>
							</td>
						</tr>
						<tr>
							<th width="15%" class="text-right">첨부파일</th>
							<td width="85%">
								<input type="file" class="input-sm" name="upload" size="20">
							</td>
						</tr>
						<tr>
							<th width="15%" class="text-right">비밀번호</th>
							<td width="85%">
								<input type="password" name="pwd" size="10" class="input-sm" required>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center">
								<button class="btn-sm btn-danger">글쓰기</button>
								<input type="button" value="취소" class="btn-sm btn-primary" onclick="javascript:history.back()">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>