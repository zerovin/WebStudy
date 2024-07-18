<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
	1. <c:set> : 변수설정 request.setAttribute()
	2. <c:out> : 화면출력
	===> 자바스크립트에서 자바 데이터 출력
	     제이쿼리, EL 전부 $를 쓰기 때문에 EL도 제이쿼리로 인식 => <c:out> 사용
 --%>
 <%
 	List<String> names=new ArrayList<String>();
	for(char a='A';a<='Z';a++){
		names.add(String.valueOf(a));
	}
 %>
 <c:set var="names" value="<%=names%>"/>
 <%--
 	request.setAttribute("names", names)
 	${}
 	#{} => getXxx()
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL 변수설정 &lt;c:set&gt;</h1>
	<c:forEach var="alpha" items="${names}">
		${alpha}&nbsp;
	</c:forEach>
	<h1>출력 형식</h1>
	<c:forEach var="alpha" items="${names}">
		<c:out value="${alpha}"></c:out>&nbsp;
	</c:forEach>
</body>
</html>