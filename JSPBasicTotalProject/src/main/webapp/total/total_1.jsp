<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. JSP의 실행과정
	        
	   a.jsp
	     | 
	     | 실행요청(톰캣)
	     ↓ 
	   a_jsp.java - 자바로 변경 
	   public class a_jsp extends HttpBaseJsp{                   
	      public void _jspInit(){}            
	      public void _jspDestroy(){}
	      public void _jspService(HttpServletRequest request, 
	        HttpServletResponse response){
	         final javax.servlet.jsp.PageContext pageContext;
	         javax.servlet.http.HttpSession session = null;
	         final javax.servlet.ServletContext application;
	         final javax.servlet.ServletConfig config;
	         javax.servlet.jsp.JspWriter out = null;
	         final java.lang.Object page = this;
	         =======> JSP의 소스코딩 <% %>
	         <% %>
	         out.write(HTML)
	         <%= %> => out.print()
	      }
	   }
	    |
	    | 컴파일
	    ↓
	 a_jsp.class - 한줄씩 읽어서 메모리 저장
	             => out.write()에 있는 내용(HTML)만 저장
	             => 저장된 HTML을 브라우저에서 읽어서 출력
	 
	               jsp파일 요청 => URL => request
	 브라우저 -----------------------------------------> 톰캣
	       <----------------------------------------
	        요청 처리(자바코딩) 후 응답, HTML => response
	        
	 JSP 사용
	  - 지시자 : page - JSP에 대한 정보를 저장
	                - 변환 => 브라우저에 알림
	                         contentType="text/html, text/xml, text/plain"
	                - 외부 라이브러리 => import
	                                 java.lang, javax.http.servlet 외의 모든 패키지는 import
	                                 사용자정의 라이브러리 포함 import
	                - errorPage : 에러가 있는 경우에 이동하는 파일 지정
	           taglib - <% %>를 제거하기 위해 제작된 태그
	                  - for / if 제어문을 태그로 제작
	                  - 자바는 사용하지 않고 태그형 문법 사용
	  - 자바표현법 - <% %> : 일반 자바코딩, 제어문, 연산자 메소드 호출, 지역변수 선언
	                      JSTL => 태그형(제어문) <c:forEach>, <c:if>
	            - <%= %> : 데이터 출력 out.print()
	                       EL => ${}
	  - 내장객체 - HttpServletRequest => request
	              - 브라우저 정보
	                  => http://localhost/JSPBasicTotalProject/total/total_1.jsp
	                     - http : protocol
	                     - localhost : 서버 IP 
	                     - JSPBasicTotalProject : ContextPath
	                     - JSPBasicTotalProject/total/total_1.jsp : URI
	                     = http://localhost/JSPBasicTotalProject/total/total_1.jsp : URL
	                - getRequestURI()
	                - getContextPath()
	                - getRequestURL()
	                - getRemoteAddr() : 사용자의 IP를 얻어온다
	              - 사용자 요청 정보
	                - getParameter() : 사용자가 보내준 단일 데이터 값
	                - getParameterValues() : String[], 한번에 여러개 값을 받을 경우, checkbox
	                - setCharacterEncoding() : 디코딩, POST방식일 때 한글 변환 
	              - 데이터 추가 정보
	                - setAttribute() : request에 데이터를 추가
	                - getAttribute() : 추가된 데이터를 읽어 올 떄
	                                   ex) <%=request.getAttribute("a")%> => ${a} 일반변수X
	              - 기타
	                - getSession() : 생성된 session을 얻어오는 경우
	                - getCookies() : 생성된 쿠키의 데이터를 얻어 온다
	           - HttpServletResponse => response
	              - 헤더 정보 : 다운로드, 헤더=실제 데이터 전송 전 먼저 보내는 값
	                - setHeader()
	              - 이동 정보
	                - sendRedirect() : GET방식만 사용가능
	              - 쿠키 저장
	                - addCookie()
	           - HttpSession => session
	              - 저장 : setAttribute()
	              - 읽기 : getAttribute()
	              - 일부 삭제 : removeAttribute()
	              - 전체 삭제 : invalidate() => 로그아웃
	              - 세션 구분 : getId() => webchat
	              - 기간 설정 : setMaxInactiveInterval() => 디폴트30분 1800초
	           - ServletContext => application
	              - 이미지 업로드 (상품 등록, 갤러리 게시판)
	                - 바로 확인 : getRealPath()
	           - PageContext => pageContext 페이지 흐름
	                            request 제어, 공유
	              - include() : <jsp:include>***
	              - forward() : <jsp:forward> => MVC구조에서 사용
	           - 기타 : Cookie => 사용자 브라우저에 저장, 문자열만 저장가능
	              - 생성 : Cookie cookie=new Cookie(키, 값)
	              - 기간 : cookie.setMaxAge(초)
	              - 삭제 : setMaxAge(0)
	              - 저장위치 : cookie.setPath("/")
	              - 브라우저 전송 : response.addCookie(cookie)
	              - 쿠키읽기 : Cookie[] cookies=request.getCookies()
	              - 키 읽기 : cookie.getName()
	              - 데이터 읽기 : cookie.getValue()
	              => 보안 취약
	              ex) 최근 방문, 자동로그인 => Spring remember-me
	  - JSP 액션태그 - <jsp:include> : JSP안에 다른 JSP 포함
	               - <jsp:useBean> : 객체 생성
	  - 데이터베이스 연동 - JDBC => DBCP => ORM(MyBatis/JPA-DataSet)
	      1. 드라이버 등록
	      2. 오라클 연결
	      3. SQL문장 생성
	      4. 오라클로 SQL문장 전송
	      5. SQL문장 실행 요청 => 결과값
	      6. 오라클 연결 해제
	      ===> MyBatis - SQL문장만 전송
	           JPA - 메소드로 표현, findByNo(int no) => SELECT * FROM table_name WHERE no=?
	    - DBCP : 데이터베이스 연결에 소모되는 시간을 줄인다
	             Connection의 객체 생성 개수 조절 가능
	              => 미리 연결(톰캣)된 Connection을 POOL안에 저장
	                  - 톰캣에서 읽어가는 파일에 등록 => server.xml, web.sml
	              => POOL안에서 Connection 주소를 얻어온다
	              => Connection 사용
	              => POOL안으로 반환
	             웹사이트 개발의 기분
	             MyBatis / JPA의 기본 설정
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