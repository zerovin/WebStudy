<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	EL - 표현식, 브라우저에 데이터 출력
	     <%= %> 대체
	JSTL - 자바 제어문, 변수선언, 화면이동
	       태그형으로 변경
	JSP - 태그로 제작 (자바사용X)
	      HTML + Java => HTML / Java 분리
	       => HTML - 결과값만 출력 (Front)
	          Java - 요청처리 => 결과값 전송 (Back) => 보안(컴파일), 분산, 재사용가능
	                 태그형(수정이 편리)
	          MV - 소스는 동일 => 피일이 많아진다 => 여러명이 동시작업
	EL - ${값}
	     일반 데이터 사용가능 (자바 변수는 출력불가)
	       ex)${1234}, ${"Hello"}
	          String name="";
	          ${name} => 변수출력불가
	           => request.setAttribute()
	              session.setAttribute()
	              둘 중 하나 이용해서 키, 값 등록해야 출력가능
	          request.setAttribute("name","홍길동")
	          session.setAttribute("name","홍길동")
	          => ${name} - request, session에 설정한 키의 값을 출력
	             ${requestScope.name} => requestScope 생략가능
	             ${sessionScope.name} => sessionScope 생략가능
	          => request와 session의 키가 동일 할 경우 request 우선, request값 적용
	             이 경우 requestScope는 생략가능, sessionScope는 생략 불가
	          param : request.getParameter() => 사용빈도 거의 없
	          paramValues : request.getParameterValues() => 사용빈도 거의 없
	   
	     JSP => 요청 => Java => 요청처리 ===> JSP
	                                   |
	                  request/session에 결과값을 담아서 넘겨준다
	                                   |
	                             setAttribute()
	                                   |
	                                  ${}
	연산자
	  산술연산자
	    + : 산술만 처리
	    += : 문자열 결합
	    ${"10"+10} => Interger.parseInt()
	    ${null+10} => null은 0으로 취급
	    / (div) => 정수/정수=실수
	    % (mod) => 나누고 나머지 값
	  --------- 
	  비교연산자 - 숫자 외에 문자열, 날짜도 비교가능
	    == eq 
	    != ne
	    < lt
	    > gt
	    <= le
	    >= ge
	  논리연산자
	    && and
	    || or
	  --------- <c:if test="">, <c:when test="">
	  
	객체단위 출력
	  ${객체명.변수명}
	  => 객체명 - key명
	     변수명 - getXxx()
	      ex) ${vo.ename} => ${vo.getEname()}
	   
	JSTL : 태그로 자바 문법사항을 만듦
	       제어문, 화면이동, 변수선언, 날짜변환, 숫자변환, String 메소드 제어
	       --------------------  -------------  ----------------
	              core                fmt           functions
	                              대부분 자바에서 처리 후 결과값 전달
	       <c:set> : request.setAttribute(var, value) 생성
	                 var - 키
	                 value - 값
	       <c:out value=""> : JavaScript와 충돌방지
	                          자바스크립트에서 $=함수
	       <c:if test="조건문">
	       <c:chosse>
	         <c:when test=""></c:when>
	         <c:when test=""></c:when>
	         ...
	         <c:when test=""></c:when>
	         <c:otherwise></c:otherwise> => 디폴트 값
	       </c:choose>
	       <c:forEach var="" begin="시작" end="끝" step="증가">
	       <c:forEach var="" items="배열, 컬렉션" varStatus="인덱스">
	       <c:forTokens var="" value="대상" delims="구분자">
	       <c:redirect url=""> : sendRedirect()
	       <fmt:formatDate>
	       <fmt:formatNumber>
	       ${fn:length, substring, replace...}
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>