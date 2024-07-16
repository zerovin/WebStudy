<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String year=request.getParameter("year");
	String month=request.getParameter("month");
	String day=request.getParameter("day");
%>
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
		width:500px;
	}
	h3{
		text-align:center;
	}
</style>
</head>
<body>
	<div class="container">
		<h3>일정 등록</h3>
		<div class="row">
			<form method="POST" action="input_ok.jsp">
				<table class="table">
					<tbody>
						<tr>
							<td colspan="2">
								년도 : <input type="text" size="10" class="input-sm" name="year" value="<%=year %>" readonly>&nbsp;
								월 : <input type="text" size="10" class="input-sm" name="month" value="<%=month %>" readonly>&nbsp;
								일 : <input type="text" size="10" class="input-sm" name="day" value="<%=day %>" readonly>
							</td>
						</tr>
						<tr>
							<th width="10%">제목</th>
							<td width="90%">
								<input type="text" name="subject" class="input-sm" size="55">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea rows="10" cols="60" name="msg"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center">
								<button class="btn-sm btn-primary">등록</button>
								<input type="button" class="btn-sm btn-info" value="취소" onclick="javascript:history.back()">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>