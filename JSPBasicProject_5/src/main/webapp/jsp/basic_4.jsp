<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	include 지시자 : JSP안 특정부분에 다른 JSP를 추가해서 사용가능
	               <%@ include file="파일명 지정" %>
	               각 JSP에서 공통으로 사용되는 파일이 있는 경우에 주로 사용
	                ex) header, menu, footer 
	               정작파일
	               동적 <jsp:include>
	               
	a.jsp
	  <html>
	  	<body>
	  		<%
	  			int a=100;
	  		%>
	  		<%@ include file="b.jsp"%> => b.jsp 파일 소환, 소스가 합쳐짐 => 변수a 충돌
	  	</body>
	  </html>
	  
	b.jsp
	  <html>
	  	<body>
	  		<%
	  			int a=10;
	  		%>
	  	</body>
	  </html>
	  
	<jsp:include page="b.jsp">
	a.jsp => 컴파일 HTML로 변환
	b.jsp => 컴파일 HTML로 변환
	==> 변환된 HTML들을 통합 => 컴파일을 따로 하기 때문에 변수충돌, 에러 없음
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="table.css">
<title>Insert title here</title>
</head>
<body>
	<table class="table_content" width=800 height=700>
		<tr>
			<td colspan="2" height=100>
				<%@ include file="header.jsp"%>
			</td>
		</tr>
		<tr>
			<td width=300 height=500>
				<%@ include file="aside.jsp" %>
			</td>
			<td width=500 height=500>
				<%@ include file="section.jsp" %>
			</td>
		</tr>
		<tr>
			<td colspan="2" height=100>
				<%@ include file="footer.jsp" %>
			</td>
		</tr>
	</table>
</body>
</html>