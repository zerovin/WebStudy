<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//배열
	String[] colors={"green", "blue", "yellow", "pink", "orange"};
	request.setAttribute("colors", colors);
	// or session 이용
	// 일반 자바변수 출력 불가능
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Java | 향상된 for => forEach</h3>
	<ul>
		<%
		int i=1;
		for(String color:colors){ %>
			<li><%=i%>. <%=color %></li>
		<%
			i++;
		} 
		%>
	</ul>
	<h3>JSTL forEach</h3>
	<ul>
		<%--
			varStatus="s" : 배열, 컬렉션의 인덱스번호
			                0번부터 시작
		 --%>
		<c:forEach var="color" items="${colors}" varStatus="s"> <%-- ${} 일반변수 출력 불가, request/session에 값을 넣어줘야 가져올 수 있음 --%>
			<li>${s.index+1}. ${color}</li>
		</c:forEach>
	</ul>
</body>
</html>