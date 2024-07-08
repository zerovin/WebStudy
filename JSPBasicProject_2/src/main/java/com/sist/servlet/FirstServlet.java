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
 *  서블릿 - URL로 요청하면 톰캣에 의해 실행
 *         순수하게 자바로만 만들어져 있다
 *         http://localhost/JSPBasicProject_2/FirstServlet
 *                                            ------------
 *                 @WebServlet("/FirstServlet")와 URL클래시 일치시 실행, 대소분자 구분
 *  init() : 초기화 => 생성자와 비슷한 역할
 *  doGet() / doPost() : 사용자에게 요청처리에 대한 결과를 보여준다, html형식
 *                       사용자 요청시 요청방식에 따라 get,post 둘 중 하나만 실행
 *                       get, post 통합 = service()
 *                       GET - 화면에 출력(default), get/post 지정하지 않으면 GET인식
 *                       POST - 사용자 요청값을 받아 처리
 *  destroy() : 새로고침/파일이동시 메모리 해제, 호출시마다 new생성, delete-new반복
 *  
 *  사용자가 요청 데이터 전송시 톰캣에 의해 한군데에 모아서 전송 => request (사용자 브라우저 정보 IP,PORT 포함)
 *  브라우저에 전송 => response(응답), HTML을 브라우저에 보내준다
 *  
 *  코딩방식
 *  1. 변환코드 지정
 *     - HTML : response.setContentType("text/html")
 *     - XML : response.setContentType("text/xml")
 *     - JSON : response.setContentType("text/plain")
 *  2. 클라이언트 브라우저에서 읽어 갈 수 있게 메모리에 저장
 *     - PrintWriter out=response.getWriter() => 사용자 브라우저
 *     - out.writer("<html>");
 *  3. 데이터베이스 연결
 */
@WebServlet("/FirstServlet")
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String msg;
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		msg="Hello Servlet";
		// web.xml을 통해서 필요한 데이터 전송
		// web.xmo을 읽어오는 라이브러리 = ServletConfig config
		System.out.println("init(ServletConfig config) Call");
	}

	
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("destroy() : 서블릿 메모리 해제");
	}
	
	/*
	 *  브라우저 : localhost 요청
	 *  DNS : localhost => 127.0.0.1 (IP로 변환)
	 *  변환된 IP를 이용해서 서버에 접속 => new Socket(ip,80) 
	 *  파일을 찾아서 실행된 결과를 메모리에 저장 => out.write("<html>")
	 *  브라우저에서 HTML을 한줄씩 읽어서 번역
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// default => 화면출력시 사용
		// 1. 전송방식
		response.setContentType("text/html;charset=UTF-8");
		// 2. HTML을 요청한 브라우저로 전송
		PrintWriter out=response.getWriter(); //브라우저 확인(response안에 사용자 IP를 가지고 있다)
		// out영역에 HTML을 작성하면 브라우저에서 읽어간다 => 화면출력
		out.write("<html>");
		out.write("<body>");
		out.write("<center>");
		out.write("<h3>IP : "+request.getRemoteAddr()+"</h3>");
		out.write("<h3>요청내용 : "+request.getRequestURL()+"</h3>");
		out.write("<h3>실제요청내용 : "+request.getRequestURI()+"</h3>");
		out.write("</center>");
		out.write("</body>");
		out.write("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
