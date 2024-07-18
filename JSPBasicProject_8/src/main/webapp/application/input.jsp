<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Application-RealPath</title>
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
		<h3>파일 업로드</h3>
		<div class="row">
			<form method="POST" action="save.jsp" enctype="multipart/form-data">
			<%-- enctype="multipart/form-data" - 파일 업로드시 사용, 파일업로드 프로토콜, 반드시 POST기반에서 사용 --%>
				<input type="file" name="upload" size="25" style="float:left;" class="input-sm">
				<button class="btn-sm btn-danger">전송</button>
			</form>
		</div>
	</div>
</body>
</html>