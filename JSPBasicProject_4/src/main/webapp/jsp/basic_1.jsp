<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSP 동작 구조
	1. jsp파일 요청, URL주소
	   http://localhost/JSPBasicProject_4/jsp/basic_1.jsp
	2. 웹서버가 요청을 받는다
	   httpd : .html / .xml 해결, 처리
	           .jsp / servlet 처리 불가
	3. 처리불가한 jsp/servlet은 WAS(Tomcat)로 전송
	4. jsp파일을 java파일로 톰캣이 변경 ex) a.jsp => a_jsp.java
	   코딩한 내용을 public void _jspService()에 첨부
	5. 컴파일 => a_jsp.class
	6. 실행(인터프리터), out.write()에 있는 내용만 메모리에 저장
	7. 저장된 메모리에서 브라우저가 읽어서 출력
	   
	HTML주석은 페이지 소스에 노출
	가급적 주석 노출이 되지 않게 JSP주석 사용 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 화면에 출력하는 태그 -->
</body>
</html>