<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 
	prefix="c" => <c:~>
	prefix="core => <core:~>
	prefix는 마음대로 지정가능 하나 실무에서 주로
	 - core => c
	 - fmt(format) => fmt
	 - function => fn
 --%>
<%--
	JSTL (JSP Standard Tab Library)
	 - 태그로 제어문, String, 날짜, 숫자, 화면이동 ...
	 - jstl-1.2.jar
	 - 자바문법을 태그로 제작, 사용자정의도 있지만 사용X
	 - EL/JSTL => JSP 화면 출력
	 1. core : 제어문, 변수선언, 화면이동
	     제어문
	       - 반복문 <c:forEach>
	                - 속성 - begin 시작
	                      - end 끝, 작성 수 포함(이하)
	                      - step 증가 (감소는 없음), 1일 경우 생략가능
	                - 일반 for문 
	                    for(int i=1;i<=10;i++)
	                      => <c:forEach var="i" begin="1" end="10" step="1">
	                - forEach문
	                    for(FoodVO vo:list)
	                      => <c:forEach var="vo" items="list">
	                - StringTokenizer
	                    StringTokenizer st=new StringTokenizer()
	                      => <c:forTokens var="st" value="read,blue,black" delims",">
	                          value => data
	                          delims => 구분자
	       - 조건문 <c:if> => 단점-else가 없다
	       - 선택문 <c:choose> => switch/if
	                 <c:when></c:when> => case/else if
	                 <c:when></c:when>
	                 <c:otherwise></c:otherwise> => default
	              </c:choose>
	 2. fmt : 날짜변환, 숫자변환
	 3. fn : String 메소드 처리
	 ========
	 4. xml 
	 5. sql
	 ===> 노출 방지를 위해 순수자바 DAO로 사용
	 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>일반 자바 For문</h3>
	<% for(int i=1;i<=10;i++){%>
		<%=i %>&nbsp;
	<%} %>
	
	<h3>JSTL forEach문</h3>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i}&nbsp;
	</c:forEach>
</body>
</html>