<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSP
	 1) 지시자
	    - page 지시자
	      - contentType : 브라우저에 어떤 형식의 파일인지 알려준다 (HTML/XML/JSON)
	      - import : 라이브러리 추가
	      - errorPage : 에러가 난 경우에 출력하는 파일, web.xml
	      - buffer : 화면 크기가 클 경우 8kb => 16kb
	    - include 지시자
	      - file : 첨부할 파일명 지정, 정적파일(소스를 통합해서 컴파일)
	               <jsp:include>로 대체 - 가장 많이 사용되는 액션태그
	 2) HTML / Java 구분
	    - <% %> : HTML안에 자바 코딩(일반 메소드에서 사용되는 자바코드)
	               ex) 지역변수, 메소드 호출, 연산자, 제어문
	              Model 클래스를 만들어 메소드 처리로 대체
	    - <%= %> : out.print(), 화면 출력
	              ${}로 대체
	 3) 내장객체
	   ***request : 사용자 요청
	        - getParameter(), getParameterValues() : 사용자가 보내준 값을 받는다
	        - getRequestURI() : 사용자가 요청하는 URI
	        - setCharacterEncoding() : 한글 변환
	        - setAttribute(), getAttribute() : 추가
	        - getRomoteAddr() : 사용자 IP 
	        **스프링에서는 가급적이면 request를 사용하지 않는다
	          스프링 자체에서 값을 받아준다
	          Cookie사용시에는 request사용
	   ***response : 응답 정보
	        - sendRedirect() : 화면 이동
	        - setHeader() : JSON 전송, 다운로드
	        - addCookie() : cookie전송
	   ***session : 서버에 일부 데이터를 저장
	                ex) 장바구니, 로그인 정보저장
	        - setAttribute() : 저장
	        - getAttribute() : 저장값 읽기
	        - invalidate() : 전체 저장 내용을 지운다 ex)로그아웃
	        - removeAttribute() : 한개씩 삭제
	    - application : 서버 관리
	        - log() : 로그 파일
	        - getRealPath() : 실제 저장 경로, server.core ex)이미지 저장
	    - out : 출력 버퍼 관리
	        - print(), write() : 화면 출력, <%= %>, ${}
	    - pageContext
	        - include() => <jsp:include>
	        - forward() => <jsp:forward>
	    - page(this), config(web.xml), exception(try~catch)
	    
	 4) 액션태그
	   ***<jsp:include>
	    - <jsp:useBean>
	    - <jsp:setProperty>
	 5) 라이브러리 10장, 11장 DBCP => DAO/VO
	 6) EL / JSTL 20장
	    - taglib 지시자
	 7) MVC
   ** 흐름 - 화면변경(이동), 데이터 전송
            숫자 이용
            하나 출력 ex)상세보기 - primary key
      사용자 이벤트 JSP ===> 자바 ===> 오라클 연동 ===> 자바 ===> JSP
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