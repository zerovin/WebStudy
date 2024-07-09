package com.sist.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *  http://localhost/JSPBasicProject_3/MyServlet
 *                                     ---------- 파일명 @WebServlet("/MyServlet"), 변경가능 
 *                                     
 *  1. URL 입력 => 웹서버 요청
 *                - HTML / XML / JSON 바로 처리 브라우저로 전송
 *                - Java(Servlet), JSP => WAS(Web Application Server-Tomcat)에서 번역
 *                 *Java(Servlet)
 *                  => .java => 컴파일 => .class
 *                  => 한줄씩 번역(인터프리터) => out.write("")만 메모리에 출력
 *                      1. 서블릿 파일 로딩
 *                      2. init()
 *                      3. service() => doGet()/doPost()
 *                      4. 서블릿 종료(새로고침, 화면이동) => destroy()호출  
 *                  => 요청한 브라우저에서 읽어서 화면 출력
 *                *JSP => a.jsp
 *                         1. 클래스로 변경 class a_jsp => a_jsp.java
 *                         2. 컴파일 a_jsp.class => 서블릿
 *                         => 이후 servlet과 동일
 *  동적 페이지 - 파일 한개에 데이터 변경이 가능 
 *              ex) 100페이지 => servlet/JSP는 한개의 파일로 제작, 데이터만 변경
 *                             HTML은 파일 100개 => 정적페이지, 데이터변경 불가
 *  서블릿 Servlet = Server + let => 서버에서 실행되는 가벼운 프로그램
 *               = Server + Applet(Application+let) => 서버에서 실행되는 응용프로그램
 *                          - 기존 1995이전 문자위주 출력에서 이미지, 애니메이션 가능
 *                            => 자바발전 2000년 웹, 전자상거래
 *               - 웹 서비스 기능을 해주는 자바 클래스
 *               - 자바 안에 HTML코드 첨부 out.write("<html>");
 *                 JSP는 HTML안에 Java 첨부 <% %>
 *               - 단점 
 *                  1. HTML을 사용하기 어렵다, 복잡 => CSS,Javascript 사용불편 => 화면UI는 하지않는다
 *                     out.write("<html>");
 *                     out.write("<head>");
 *                     out.write("<script type=\"text/javascript\">");
 *                     out.write("function aaa(){");
 *                     out.write("alert(\"\")");
 *                     out.write("}");
 *                     out.write("</script>");
 *                     out.write("<style type=\"text/css\">");
 *                     out.write("#aaa{background-color:red;border:1pxs solid red;");
 *                     out.write("</style>");
 *                     out.write("</head>");
 *                  2. HTML, CSS, JavaScript에 대한 에러 처리가 어렵다
 *                  3. 확장자 .java => 변경시마다 컴파일을 다시 해야한다
 *                     톰캣프로젝트 - 변경 => 컴파일 => 톰캣에 올림
 *                     AWS - 수정시마다 컴파일 => war 파일 갱신 필요 => 바로 확인 불가, JSP는 바로 확인
 *                     ==> 운영 SE
 *                         SE + SI/SM = 통합 DevOps => CI/CD 지속적 통합/배포
 *               - 장점
 *                  1. 자바 => 배포시에 .class파일만 전송 => 보안이 뛰어나다
 *                            전체 소스를 볼 수 없고, 다른 사람이 변경 불가
 *                            주 사용처 : HTML / 자바가 분리 된 경우 => 연결 Controller
 *                                      스프링 컨트롤러 = servlet
 *               - 단점 보완 => JSP
 *                  - 수정과 동시에 확인 가능
 *                  - HTML/CSS/JavaScript 사용이 쉽게 out.write(""); 톰캣에 의해 자동생성
 *                  - HTML기반, 필요한 자바코딩은 <% %>, <%= %> 이용
 *                  - 톰캣에 의해 실행 => 실행과 동시에 저장
 *                  - 보안취약, 소스 전체 전송 => 보안을 위해 servlet파일 병행
 *                  - 웹관련 라이브러리는 servlet 
 *               - 실행과정
 *                  - URL주소 이용해서 전송
 *                    => 톰캣에 의해 실행 - init() => main()
 *                                      doGet()/doPost() => run() 클라이언트마다 따로 동작, 쓰레드
 *                                      destroy() => 메모리 해제
 *  자바 - SUN => javax package / tomcat9
 *        오라클 =< jakarata package / tomcat10 이상
 *  STS 3.9 / jdk11 => 실무 1.8 호환성이 좋다
 *  STS 4.x / jdk17 => Spring-Boot
 *  전자정부 프레임워크 - 공기업
 *  ANY 프레임워크 - 대기업 => STS 3.x => 최근 서버 분산 MSA, Spring Cloud
 */
// @WebServlet("/MyServlet")
// Annotation, 구분자, 인덱스
// 찾고자하는 클래스, 메소드, 생성자, 멤버변수 위,옆에 존재 
/*
 *  1. 웹 분석
 *     1) web.xml : 시작과 동시에 필요한 데이터를 넘겨준다
 *     2) server.xml : PORT, 파일 위치 확인
 *     ================================= AWS는 톰캣만 깔기 때문에 위 xml파일 두개만으로 설정
 *     3) 클래스 분석 => DAO : SQL분석
 *     4) JSP 분석 : 화면 출력
 */
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		// _jspInit() : 초기화(생성자 역할) => 멤버변수 초기화, 시작과 동시에 처리
		// 환경설정 (web.xml) => 등록된 내용을 읽어올 때
		// 스프링은 라이브러리 => 환경설정시 web.xml에 등록 ex)서블릿등록, 보안설정, 에러설정, 한글처리	
		System.out.println("MyServlet:init() Call");
		String path=config.getInitParameter("file_name");
		System.out.println(path);
	}

	public void destroy() {
		// TODO Auto-generated method stub
		//종료가 된 상태 => 메모리 해제
		System.out.println("MyServlet:destroy() Call");
	}
	/*
	 *  웹 흐름 : 화면 이동
	 *          사용자 요청 => 요청시에 어떤 값을 전송할지
	 *                      GET - <a>, 대부분의 전송
	 *                            URL뒤에 데이터 첨부 ?키=값&키=값
	 *                            단순한 데이터, 데이터 노출됨
	 *                            ex) page, 상세보기, 단순검색
	 *                      POST - <form>, Ajax
	 *                             데이터가 많거나 보안요구, 데이터 노출X
	 *                             ex) 회원가입, 게시판 글쓰기, 댓글, 로그인, 아이디비번찾기
	 *                     *사용자가 데이터 전송 GET ==> doGet() 호출
	 *                      사용자가 데이터 전송 POST ==> doPost() 호출
	 *                      통합 : service()
	 *          서버 응답 => 요청값을 받아서 오라클에 연결
	 *                      - request 요청값 - getParameter()
	 *                                       getParameterValues()
	 *                      - response 응답 - sendRedirect()
	 *                                       addCookie()
	 *                      - 한글 인코딩/디코딩 - setCharacterEncoding()
	 *                     데이터 출력
	 *          
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 디폴트 => 메인 화면, 화면 UI
		// 1. 변환, 브라우저에 HTML, XML, JSON 여부 알려줌 => JSP page 지시자
		response.setContentType("text/html;charset=UTF-8");
		// response => HTML, Cookie 전송
		// 한개의 메소드에서 HTML or Cookie 1개만 전송가능
		// 2. 요청된 브라우저를 찾는다 => 결과값을 보내준다
		PrintWriter out=response.getWriter(); 
		// 브라우저에서 HTML을 읽어가는 메모리 공간 = out => JSP에서는 내장객체
		/*//줄바꿈없이 한줄로출력
		out.write("<html>");
		out.write("<body>");
		out.write("<center>");
		out.write("<h1>Hello Servlet</h1>");
		out.write("</center>");
		out.write("</body>");
		out.write("</html>");
		*/
		
		//한줄씩 출력
		out.println("<html>");
		out.println("<body>");
		out.println("<center>");
		out.println("<h1>Hello Servlet</h1>");
		out.println("</center>");
		out.println("</body>");
		out.println("</html>");
	}
	
	/*
	 *  1. 요청 => URL주소로 요청
	 *  2. 톰캣이 해당 servlet 클래스 읽기
	 *  3. 메모리 할당
	 *  4. 실행 init() => doGet() / doPost() => destroy()
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 사용자 요청에 대한 처리
	}

}
