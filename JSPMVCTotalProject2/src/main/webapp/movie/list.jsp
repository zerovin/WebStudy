<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	JSP / Servlet
	JSP 
	 1. 지시자
	    - page : contentType="" 브라우저에 알려주는 방식
	             메모리에 저장된 데이터가 어떤 형식인지 알려준다 => response
	             - HTML : text/html
	             - XML : text/xml
	             - JSON : text/plain
	    - taglib : 태그형으로 자바의 제어문을 지원
	               - prefix="" => 사용자 지정 접두사 <c: ~>
	                              c, fmt, sql, xml, fn
	               - uri="" => import
	              제어문 / 화면 이동
	               - <c:if test="조건문">
	               - <c:forEach var="받는 변수" items="배열/컬렉션" varStatus="인덱스번호이용시"></c:forEach>
	               - <c:forEach var="변수명" begin="" end=""></c:forEach>
	               - <c:choose>
	                   <c:when test=""></c:when>
	                   <c:when test=""></c:when>
	                   <c:otherwize></c:otherwize>
	                 <c:choose>
	               - <c:set var="" value=""> => request.setAttribute(var값, value값)
	                                            count 증감
	               - <c:redirect url="이동주소"> 
	              EL : 데이터 출력
	                   - ${requestScope.키} => request.setAttribute()
	                   - ${sessionScope.키} => session.setAttribute()
	                   문자열 결합
	                   - ${ += }
	              <% %>, <%= %> ==> JSTL/EL
	  2. 내장객체
	     - request / response / session
	     - cookies
	     - 외부 라이브러리 
	       ex) cos.jar, jsoup.jar	
	              
	Servlet : 자바로만 소스코딩 => JSP
	 - 실행 순서
	    1) init() : 메모리 초기화
	    2) service() : GET/POST : 사용자 요청 처리 
	        - doGet() : GET
	        - doPost() : POST
	    3) destroy() : 메모리 해제, 화면이동/새로고침 자동으로 메모리 해제
	    
	MVC
	 - HTML / Java 분리 => 기존 JSP만 가지고 만든 파일보다 2배많다
	 - 장점 : 분업화하기 좋다, 여러명의 개발자가 동시개발 가능 Front/Back
	         개발 속도가 빠르다 (재사용, 확장성)
	 - HTML : 화면 출력 View ----- 
	                            |---> Servlet Controller	 
	   Java : 데이터 관리 Model --- 
	   - Controller : JSP - 자바와 연결 request, session
	                   Servlet - 보안유지(.class) : 스프링, 스트럿츠에서 제공
	   - Model : 요청처리
	             오라클에서 데이터 일기 / 쓰기 / 수정 / 삭제
	              ex) DAO, VOk Manager
	             사이트에서 데이터 읽기 => 웹 크롤링
	             OPEN API : api키를 이용해서 처리(증권)
	             **데이터 관리(입출력)
	   - View : 브라우저 출력용
	            jsp - JSTL/EL
	            html(thymeleaf) - <tr th:each="">, <tr v-for="">(Vue)
	   - 클래스 단위
	     메소드 단위****(선호) => 어노테이션 (찾기 기능)
	     
	
	 
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