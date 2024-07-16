<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	String no=request.getParameter("no");
	SeoulDAO dao=SeoulDAO.newInstance();
	LocationVO vo=dao.seoulDetailData(Integer.parseInt(no));
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
		width:800px;
	}
</style>
</head>
<body>
	<div class="container">
		<h3 class="text-center"><%=vo.getTitle() %></h3>
		<div class="row">
			<table class="table">
				<tbody>
					<tr>
						<td class="text-center">
							<img src="<%=vo.getPoster()%>" alt="<%=vo.getTitle()%>" style="width:600px;height:400px;">
						</td>
					</tr>
					<tr>
						<td><%=vo.getMsg() %></td>
					</tr>
					<tr>
						<td><address><%=vo.getAddress() %></address></td>
					</tr>
					<tr>
						<td class="text-right">
							<a href="list.jsp" class="btn btn-xs btn-primary">목록</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>