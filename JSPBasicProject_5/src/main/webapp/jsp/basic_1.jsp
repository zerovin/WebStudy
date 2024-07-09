<%@ page info="지시자에 대한 학습" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="16kb" import="java.util.*" errorPage="error.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*,java.sql.*" %>

<%-- 속성을 사용하지 않으면 default 적용 --%>

<%--
	JSP (Java Server Page)
	 1) HTML / Java => 구분
	    - <% %>
	    - <%= %>
	    - <%! %>
	 2) 지시자
	    - page : JSP의 기본정보를 저장한다
	             <%@ 지시자명 속성="값" 속성="값" ... %>
	             ex) <%@ page contentType="text/html" %>
	                 <%@ include file="파일명" %> => JSP는 조립식 프로그램
	                 <%@ taglib prefix="c"...%> => <c:forEach>
	             속성***info : 작성자, 작성일, 무슨 프로그램인지
	                 - language : java = default
	                ***contentType : 브라우저에 어떤 형식인지 알려주는 목적
	                                 response.setContentType()
	                                 text/html;charset=ISO-8859-1 = default
	                                 contentType="text/html;charset=UTF-8" => HTML,,한글표시
	                                 contentType="text/xml;chareset_UTF-8" => XML사용
	                                 contentType="text/plain;chareset_UTF-8" => JSON
	                 - extends : 확장(상속), 거의 사용하지 않는다
	                ***import : 라이브러리 읽을 때 사용
	                            생략가능 - java.lang.*
	                                     javax.servlet.http.*
	                            여러개 사용가능
	                            <%@ page import="java.util.*, java.io.*"%>
	                            <%@ page import="java.util.*"%>
	                            <%@ page import="java.io.*"%>
	                         ***다른 속성은 한번만 사용가능, import는 여러번 사용가능
	                         ***속성 - 이미 지정되어있다, 지정된 것만 사용가능, 사용자정의X
	                            값은 반드시 ""사용, ""없을시 오류
	                         ***속성 간에 공백을 반드시 사용
	                 - session : session 사용여부. default : true
	                             서버에 일부 정보를 저장할 경우 => 사용자 정보 저장(로그인)
	                             브라우저 종료 / 로그아웃시 세션 해제
	                             cookie : 브라우저에 저장, 보안취약 / session : 서버 저장
	                ***buffer : html코드를 저장하는 메모리 공간
	                            8KB default / 2의 배수로 늘림 => 16kb / 32kb
	                            임시 저장장소, 출력 버퍼
	                 - autoFlush : 화면에 출력, 이동 => 이전 HTML 지움
	                               접속자 한사람마다 출력버퍼 한개만 사용가능***
	                               default : true
	                 - isThreadSafe : 쓰레드 사용여부 default : true
	                ***errorPage : 에러발생시 보여주는 페이지를 만든다
	                               1개만 제작
	                ***isErrorPage 에러페이지 여부 확인
	                               종류별로 제작
	                               에러페이지인지 여부는 톰캣이 구분
	                ***pageEncoding : 파일에 대한 한글 설정
	    - taglib
	    - include
	 3) 내장객체
	    - request
	    - response
	    - session
	    - out
	    - application
	    - config
	    - exception
	    - page
	    - pageContext
	 4) cookie
	 5) JSP 액션 태그
	    - <jsp:include>
	    - <jsp:useBean>
	    - <jsp:forward>
	 =====================Basic
	 6) 데이터베이스 연동
	    - 자바빈즈
	 7) EL / JSTL
	 8) MVC
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