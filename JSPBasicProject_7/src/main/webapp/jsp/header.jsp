<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">내부객체</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="basic_2.jsp?mode=1">Request</a></li>
	      <li><a href="basic_2.jsp?mode=2">Response</a></li>
	      <li><a href="basic_2.jsp?mode=3">Session</a></li>
	      <li><a href="basic_2.jsp?mode=4">Application</a></li>
	      <li><a href="basic_2.jsp?mode=5">Out</a></li>
	      <li><a href="basic_2.jsp?mode=6">PageContext</a></li>
	      <li><a href="basic_2.jsp?mode=7">Cookie</a></li>
	      <li><a href="basic_2.jsp?mode=8">JavaBean</a></li>
	      <li><a href="basic_2.jsp?mode=9">데이터베이스(DBCP)</a></li>
	    </ul>
	  </div>
	</nav>
</body>
</html>