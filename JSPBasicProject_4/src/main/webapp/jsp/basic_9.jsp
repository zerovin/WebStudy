<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	while : 반복문, 슬라이드, 채팅
	for : 출력회수 지정
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int i=1;
		String s="";
		while(true){
			if(i>5) break;
			s+="★";
			i++;
		}
	%>
	<font color=red><%=s %></font>
</body>
</html>