<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	EL : 표현식, 데이터를 화면에 출력
	     <%= %> 대체
	     ${값}
	     연산자, 내장객체
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name="홍길동";
		
		// EL 사용시
		request.setAttribute("name","홍길동"); //request/session 중에 request가 우선순위
		session.setAttribute("gender","남자");
		request.setAttribute("name","심청이");
	%>
	<h1>EL : ${requestScope.name }</h1> <%-- requestScope / sessionScope 는 생략가능, 지금같은 상황에서는 sessionScope 생략불가 --%>
	<h1>EL : ${sessionScope.name }</h1>
	<h1>EL : ${gender }</h1>
	<h1><%=name %></h1>
</body>
</html>