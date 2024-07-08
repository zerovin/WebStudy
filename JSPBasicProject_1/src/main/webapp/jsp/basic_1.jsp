<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSP : Java Server Page => 서버에서 실행하는 자바 파일
	Back-end : java, JSP, Servlet, Spring, Oracle
	Front-end : HTML, CSS, JavaScript-jQuery(Ajax),VueJS,ReactJS,NextJS
	
	JSP
	 1. HTML + Java
	    - 자바구분 스크립트 릿 : <% %>
	             표현식 : <%= %>
	             선언문 : <%! %>
	 2. 동작방식
	    - 정적페이지 : 한 파일에 한개만 사용
	                ex)HTML
	    - 동적페이지 : 한 파일에 여러개의 데이터 출력
	                ex)JSP, PHP, ASP, CGI
	 3. 지시자
	    - page : JSP파일에 대한 정보 저장, JSP 시작점
	             - 변환코드 : ContentType=""
	                        브라우저에서 실행가능한 HTML / XML / JSON 파일 중 하나 설정
	               - HTML => text/html => default
	               - XML => text/xml
	               - JSON => text/plain
	                         JavaScript Object Nontation 자바스크립트 객체 표현법
	                         Ajax, VueJS, ReactJS, Redux, Next
	                         VO => {}
	                         List => [{},{},{}...]
	             - 라이브러리 추가 : import
	             - 한글 변환 : pageEncoding="UTF-8"(호환성)
	             - 에러페이지 : errorPage="파일명"
	               - 404 : 파일이 없는 경우
	                       ex)<a href="파일명"> - 파일명오류
	               - 500 : 자바 컴파일 에러, 자바 소스코드 오류
	               - 403 : 접근 거부
	                       ex)Spring-Security
	               - 412 : 한글 변환 코드 오류
	                       ex) UTF-8
	               - 400 : 전송값과 받는 변수 데이터형 불일치 => bad request
	    - include : <%@ include file="" %>, <iframe> 같은 개념
	                JSP 안에 다른 JSP를 포함해서 사용
	                 => ex) header, footer
	    - taglib : jsp의 단점 보완 => JSTL(라이브러리) => 자바/HTML 분리(MVC) Spring에서는 MVC구조만 사용
	               자바<% %>대신 대그형으로 변경
	               ex)   <% 
	                         if(조건문){
	                     %>
	                            HTML
	                     <%
	                         }
	                     %>	 
	                   ====>
	                     <c:if text="">
	                       HTML
	                     </c:if>     
	 4. 자바 코딩
	    - <% %> : 스크립트릿 - 일반자바(메소드 안에 코딩)
	                        지역변수선언, 제어문, 메소드 호출
	                        자바 문법을 그대로 사용
	                        주석 //, /* */
	    - <%= %> : 표현식 - 데이터를 화면에 출력 => out.writer()/out.println()
	    - <%! %> : 선언식 - 메소드 제작, 멤버변수 설정
	 5. 지원하는 라이브러리 (내장객체)
	    - request 요청값 받기
	    - response 값 보내기
	    - out 출력
	    - session 저장 데이터 유지
	    - application 파일 업로드, 다운로드
	    - config 환경설정
	    - exception 예외처리
	    - page
	    - pageContext include /forward 흐름
	 6. Cookie / Session
	    - Cookie : 브라우저에 데이터 저장
	    - Session : 서버에 데이터 저장
	 7. JSP 액션 태그 / 빈즈
	    - 액션태그 : <jsp:include>
	    - 빈즈 : <jsp:useBean> => VO 데이터를 모아서 한번에 전송할 목적
	 8. JSTL / EL : 제어문, 메소드 호출을 태그로 제작 => <% %>사용X => MVC
	 9. MVC구조
	 10. Spring
	 
	 JSP : 실행  ==================> Tomcat =====================> 컴파일 ====> a_jsp.class ====> 한줄씩 번역
	      a.jsp       class a_jsp extends HttpServlet){                                     메모리에서 HTML만 출력
	                     <%! %>                                                             브라우저가 읽어서 출력
	                     public void _jspInit(){}
	                     public void _jspDestroy(){}
	                     public void _jspService(){
	                        // JSP에서 코딩하는 영역 => _jspService 메소드 안에 들어가는 내용
	                        <% %>
	                        <%= %>
	                     }                 
	                  }
	 
	 18page
	 웹 동작 - 클라이언트 요청 request
	         서버에서 요청에 대한 응답 response
	           => C/S Client/Server
	         요청시 : URL주소 이용, 브라우저 주소창이 유일하게 서버와 연결
	                ex) http://localhost/JSPBasicProject_1/jsp/basic_1.jsp 
	                    ---------------- ---------------------------------
	                         서버주소             사용자가 요청(파일) = URI
	                 ***생략하는 경우 Welcome파일 등록 <welcome-file> => 제일 첫페이지 URL에 파일명없이 접근
	                 ***파일의 확장자는 개발자가 설정할 수 있다 ex).naver .daum .do
	                    pathVariable : 변수값을 파일처럼 사용, 가장 많이 사용
	                                   Spring, Vue, React에서 사용
	                                   ex)admin/1234 1234가 파일인지 변수인지 어떤변수값인지 확인불가
	                    나머지 요청시에는 반드시 파일명 추가, 중복이 없기 때문에
	 19page
	 브라우저(클라이언트) : 크롬, IE, 파이어폭스
	 웹 서버 : Apache / IIS
	 웹 애플리케이션 / WAS : tomcat - JSP를 자바로 변경 => 브라우저에 HTML전송
	                              톰캣 내에 테스트용 웹서버 - 윈도우에서 사용가능(테스트용이 아니면 리눅스만 가능), 50명만 접근가능
	 데이터베이스 : 오라클
	                      파일 요청                              .jsp .java
	 client(브라우저)  ================> Web Server(Apache/IIS) ============> WAS(tomcat)
	                                        요청 파일 확인                   .jsp => java로 변경
	        ↑                           => .html .xml 자체처리              => 컴파일 => .class
	        |                                                            => 인터프리터(한줄씩 번역)
	        |                                                            => HTML만 메모리에 저장
	        |                                                                      |
            ========================================================================
                                  브라우저가 읽어 갈 수 있게 전송
                                  
      파일
      - 정적 페이지 : HTML / CSS - 데이터 갱신 불가능
      - 동적 페이지 : JSP / JavaScript - 데이터 갱신
                   CGI, ASP, PHP
      22page
      Servlet : Server+let, 서버에서 실행되는 가벼운 프로그램, .java
                자바에서 처음 웹프로그램의 시작
                JSP = Java + HTML => 분리시 servlet이 연결
                단점 - 변경시마다 컴파일, 실행 반복 => 바로 변경된 소스 확인 불가
                      바로 확인 가능 => JSP
                장점 - 보안이 뛰어남 => .class파일 배포
                      보안이 중요한 웹파일 -> 서블릿으로 제작
                      JSP는 주로 화면 출력 
                스프링이 서블릿으로 만들어져 있다
      JSP : 배포시에 소스를 그대로 전송 => 소스 노출 => 화면출력시 사용
            Servlet을 간결하게, 바로 실행 가능하게
            컴파일되면 servlet으로 변경
      MVC - Model : 자바(DAO, VO..)
            View : JSP(화면 출력 기능)
            Controller : Model과 View 연결 => Servlet
            => Servlet + JSP => 스프링에서 동시사용(스프링 라이브러리=servlet)
      servlet, JSP = Java + HTML
       => HTML만 이용해서 처리 => ThymeLeaf - JSP보다 속도가 느리다
                                          서버/클라이언트 나눠서 작업
                                          서버 - Boot
                                          클라이언트 - Vue / React
                                          
	Servlet => JSP => MVC => (파이썬 => 장고 => React =>) Spring => Spring-Boot
	
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