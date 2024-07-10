<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. JSP 동작 구조
	   - 사용자(클라이언트) : 브라우저에서 서버로 파일 요청(URL주소 이용-URL마지막 파일명첨부)
	                     파일 확장자 변경 가능
	                      ex) http://localhost/JSPBasicProject_6/jsp/basic_1.jsp
	   - 서버 : 톰캣에서 요청을 받아서 요청처리(자바) => HTML을 브라우저로 전송
	   - 브라우저 : URL 전송 =====================> DNS ==================> Socket을 이용해서 서버에 연결
	              http://localhost          IP변환 127.0.0.1           HTML / XML / JSON => 서버에서 단독처리
	              http://www.daum.net             211.249.220.24      JSP / SERVLET => WAS (Web Application Server)
	                                                                                   ex) Tomcat
	                                                                                   자바번역 => HTML 변환
	                                                                                   메모리를 브라우저에서 읽어서 출력할 수 있게
	     ** 자바번역 - JSP => 클래스화
	                 a.jsp ========> class a_jsp extends HttpJspBase{
	                                     <%! 메소드, 멤버변수 선언 %> => 선언식
	                                     public void _jspInit(){}
	                                     public void _jspDestroy(){}
	                                     public void _jspService(){
	                                        JSP에서 작성한 소스코드
	                                        <% %>
	                                        <%= %>
	                                        HTML => out.write("<html>")
	                                     }
	                                 }
	                 1) 클래스는 한번만 만든다 => 변경시 만들어진 클래스 수정
	                 2) 컴파일 => .class
	                 3) .class => 한줄씩 읽어서 out.write() 번역 => 메모리(buffer)에 저장
	                    **buffer - 임시 저장 장소, 사용자 한명당 1개만 생성
	                 4) 메모리에 저장된 내용을 브라우저에서 읽어서 출력
	                    ex) WAS - tomcat* / regin / 웹로직 / 웹스페어 / 제우스*
	2. 실행순서
	     1) JSP 제작
	     2) 사용자 요청 => JSP파일 요청
	     3) 톰캣 => 클래스로 변경
	     4) 클래스 => 컴파일 => .class
	     5) .class 읽기 시작
	        _jspInit() : 환경설정, 멤버변수 초기화, web.xml
	        => _jspService() : 요청처리, 브라우저 실행
	        => _jspDestroy() : 새로고침, 화면이동시 자동으로 jsp는 메모리 해제
	        - 서버 : 서버연결 => 통신을 할 수 있게 쓰레드 생성
	                클라이언트가 한개씩 연결 => 클라이언트마다 따로 동작
	                 ex) 서버1(쓰레드) === 클라이언트 1
	                     서버2(쓰레드) === 클라이언트 2
	                     서버3(쓰레드) === 클라이언트 3
	                     => _jspService() = 쓰레드메소드 = run()
	                서버에 데이터 전송 => .getBytes(), 서버는 1byte사용 => Encoding, ASC(1byte)로 변환
	                           수신 => InputStreamReader() => 2byte로 변환 => Decoding
	                         - jsp에서는 request.setCharacterEncoding("UTF-8")
	                                   => Unicode Transfor Format 유니코드, 2byte로 변환
	3. HTML / 자바 구분
	   - <% %> : 일반자바소스 => 지역변수 선언(초기화필수), 연산자, 제어문, 메소드 호출
	             문법사항이 자바와 동일
	             문장 종로시 ; 사용
	             주석 : //한줄 주석, /*여러줄 주석*/
	   - <%= %> : out.print(출력물) => 변수 출력
	              ()안에 ; 사용시 오류
	              주석 : /* */
	              추후 ${}로 변경해서 사용예정
	   - <&! %> : 메소드 제작, 멤버변수 선언
	4. 지시자 5장
	   - page : JSP 파일에 대한 정보
	            1) contentType : 브라우저에 어떤 형식인지 알려준다
	               - HTML => text/html;charset=UTF-8
	               - XML => text/xml;charset=UTF-8
	               - JSON => text/plain;charset=UTF-8
	               ==> List, VO 자바
	               ==> JsonResponse() 파이썬
	            2) import : 라이브러리, 사용자 정의 클래스
	                        다른 속성은 한번만 사용가능, import는 여러번 사용가능
	               - <%@page import="java.util.*, java.io.*"%> => 여러개 입력시 ,로 구분
	               - <%@page import="java.util.*"%> => 여러번 사용가능하기 때문에 따로따로 작성가능
	               - <%@page import="java.io.*"%>
	            3) errorPage : error시에 error파일을 만들어서 보여주는 역할
	               - 404 : 파일이 없는 경우
	               - 500 : 컴파일에러, 자바에서 오류발생
	               - 405 : GET/POST가 doGet()/doPost()와 상이한 경우
	               - 412 : bad request, 보내는 데이터형과 받는 데이터형이 다를 경우 (주로 스프링)
	               - 403 : 접근 거부 (스프링) => 권한부여
	               - 200 : 정상 수행
	            4) buffer : HTML을 저장하는 메모리 공간
	                        디폴트=8KB
	                        변경 가능
	                        ex) buffer="16kb"
	   - include : JSP안 특정 부분에 다른 JSP포함 => 조립식
	               정적 => 소스를 통합한 후에 컴파일
	                ex) 메뉴, footer
	               <%@ include file="" %>
	   - taglib : <%@ 지시자 속성="값" %>
	              "" 반드시 사용
	5. 액션태그 6장 151page
	   - <jsp:>
	   **<jsp:include> : 스프링에서도 사용
	                     JSP안에 다른 JSP 연결
	                     동적 => 파일을 각각 따로 컴파일 후 결과값(HTML)을 통합
	     <jsp:useBean> : 객체 메모리 할당
	                      ex) BoardDAO dao=new BoardDAO()
	                          <jsp:useBean id="dao" class="BoardDAO">
	                          두 코드 동일, 메모리를 태그형으로 할당
	     <jsp:forward> : 화면이동
	                     sendRedirect() : 새로운 파일의 화면 출력 => new
	                                      request에 존재하는 데이터가 사라진다 => 초기화
	                     forward() : 해당 주소 창은 그대로, 기존의 화면에 데이터만 원하는 파일의 내용으로 변경
	                                 ex) error.jsp
	                                 request에 존재하는 데이터 사용가능
	     <jsp:setProperty> : 사용자가 보내준 데이터를 받는 경우
	     <jsp:getProperty> : 사용자가 보내준 데이터를 출력
	6. 내장객체 7장 : 실무에서도 사용해야하는 라이브러리, 스프링 / 스프링부트
	6-1. 데이터베이스 연결
	7. Cookie
	8. 에러처리
	==================== Basic
	9. EL / JSTL
	10. MVC*** 실무
	    Java - DAO, Model, VO, Manager, Service => Model
	    JSP - HTML, CSS, JavaScript => view
	    Servlet - Java / JSP 연결 => Controller
	==================== Middle
	11. Spring
	12. Spring-Boot
	==================== 고급
	+ Front (JavaScript)
	
	----------------------------
	public void _jspService(HttpServletRequest request, HttpServletResponse response){
	
		PageContext pageContext;
	    HttpSession session = null;
	    ServletContext application;
	    ServletConfig config;
	    JspWriter out = null;
	    Object page = this;
	    
	    // JSP코딩 위치 => 위에 설정된 변수 사용가능 => 내장객체
    }
    ----------------------------
	
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