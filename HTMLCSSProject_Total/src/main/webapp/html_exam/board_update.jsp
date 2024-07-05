<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	String no=request.getParameter("no");
	BoardDAO dao=BoardDAO.newInstance();
	BoardVO vo=dao.boardUpdateData(Integer.parseInt(no));
%>
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
<body>
	<div class="container">
		<h3>수정하기</h3>
		<div class="row">
			<form method="POST" action="board_update_ok.jsp">
				<table class="table">
					<tr>
						<th width="25%" class="text-right">이름</th>
						<td width="75%">
							<input type="hidden" name="no" value="<%=no %>">
							<input type="text" name="name" size="20" class="input-sm" value="<%=vo.getName()%>" required>
						</td>
					</tr>
					<tr>
						<th width="25%" class="text-right">제목</th>
						<td width="75%">
							<input type="text" name="subject" size="55" class="input-sm" value="<%=vo.getSubject()%>" required>
						</td>
					</tr>
					<tr>
						<th width="25%" class="text-right">내용</th>
						<td width="75%">
							<textarea rows="10" cols="56" name="content" required><%=vo.getContent() %></textarea>
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
							<input type="submit" value="수정" class="btn-sm btn-success">
							<input type="button" value="취소" class="btn-sm btn-warning" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>