<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	application : 서버관리 => ServletContext
	  1. 서버관련정보
	     - 서버 이름 : tomcat => getServerInfo()
	     - 버전 확인 : getMajorVersion(), getMinorVersion()
	                 servlet 버전을 읽어온다
	  2. log정보 - log파잀(서버 정보 저장)
	     - log() : 보안이 필요한 경우, web.xml에 저장
	  3. 자원관리(resouce - 파일)
	    ***getRealPath() : 실제 경로명
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>서버명 : <%= application.getServerInfo() %></h3>
	<h3>서블릿버전 : <%=application.getMajorVersion() %></h3>
	<h3>서블릿버전 : <%=application.getMinorVersion() %></h3>
	<h3>서블릿버전 : <%=application.getMajorVersion()+"."+application.getMinorVersion() %></h3>
	<h3>log읽기</h3>
	<%
		//web.xml에 있는 데이터 읽기, 도스창에 출력
		//application.getInitParameter("<param-name>");
		String driver=application.getInitParameter("driver");
		String url=application.getInitParameter("url");
		String username=application.getInitParameter("username");
		String password=application.getInitParameter("password");
		
		application.log("driver:"+driver);
		application.log("url:"+url);
		application.log("username:"+username);
		application.log("password:"+password);
	%>
	<h3>실제 프로젝트 저장 위치 : <%=application.getRealPath("/") %></h3>
</body>
</html>

