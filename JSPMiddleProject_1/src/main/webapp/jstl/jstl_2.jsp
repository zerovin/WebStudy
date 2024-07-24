<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="row">
			<h3>자바 구구단</h3>
			<table class="table">
				<tr class="success">
				<% for(int i=2;i<=9;i++){ %>
					<th class="text-center"><%=i %>단</th>
				<%} %>
				</tr>
				<% for(int i=1;i<=9;i++){ %>
					<tr>
					<% for(int j=2;j<=9;j++){ %>
						<td class="text-center"><%=j%> * <%=i %> = <%=j*i %></td>
					<%} %>
					</tr>
				<%} %>
			</table>
		</div>
		<%--
			javascript
			var i=10; => int
			var i=10.5; => double
			var i="a"; => String
			var i={} => Object
			var i=[] => Array
			
			JSTL
			=> XML 형식
			   여는태그 닫는태그 주의
			   속성값 반드시 ""
			   지정된 속성만 사용가능
		 --%>
		<div class="row">
			<h3>JSTL 구구단</h3>
			<table class="table">
				<tr class="danger">
					<c:forEach var="i" begin="2" end="9">
						<th class="text-cetner">${i}단</th>
					</c:forEach>
				</tr>
				<c:forEach var="i" begin="1" end="9">
					<tr>
						<c:forEach var="j" begin="2" end="9">
							<td class="text-center">${j} * ${i} = ${j*i}</td>
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>