package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DataOutputServlet")
public class DataOutputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("DataOutputServlet:init() Call");
	}

	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("DataOutputServlet:destroy() Call");
	}

	/*          
	 *  클라이언트 요청 ===================> 클라이언트가 요청하는 모든 값은 request 안에 첨부 (주고)
	 *  서버 요청 처리 ====> 응답(HTML) ====> response (받고)
	 *  
	 *  요청 : 전송하는 값
	 *  응답 : 출력하는 값 (HTML)
	 *  
	 *  Client / Servet => 뭘 주고 뭘 받는지가 중요
	 *  
	 *  <input> => name 속성을 가지고 있어야 한다
	 *             name 속성이 없으면 입력값 전달 불가
	 *  <form> - 태그 안 <input>, <select>, <textarea> 값만 전달
	 *           포함하고 있는 <form> ~ </form> 데이터만 전달
	 *  <a href="이동할 주소"> => GET방식
	 *                         ex) DataOutputServlet?name=홍길동
	 *                             DataOutputServlet?name=홍길동&sex=남자
	 *                         getParameter("name), getParameter("sex")
	 */
	//매개변수는 호출시마다 변경 => 화면이동, 새로고침때 마다 request가 계속 변경된다
	//cookie, session, database 이용
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//1. 브라우저 전송 : HTML
		response.setContentType("text/html;charset=UTF-8");
		//2. 사용자가 보내준 값을 받는다
		/*
		 *  사용자 전송 ==> 모든 전송된 데이터는 request 안에 있다
		 *  구분자 - name 
		 *         name값이 null인 경우, name속성이 없거나 오타
		 *         한 분류의 checkbox, radio 는 name값 동일하게 
		 *         id, class는 CSS/JavaScript용
		 *  request => HttpServletRequest 클래스
		 *              => javax.servlet.http.HttpServletRequest => tomcat 9
		 *              => jakarata.servlet.http.HttpServletRequest => tomcat 10
		 *    1) 서버정보 http://localhost:80 => 서버 IP / PORT
		 *        - getServerInfo() / getPort()
		 *    2) 사용자 전송 정보
		 *     ***- setCharacterEncoding() : 디코딩, 1byte -> 2byte로 변환
		 *     ***- String getParameter("name속성값":) : 단일값
		 *     ***- String[] getParameterValues() : 값이 여러개일 때, checkbox  
		 *    3) 추가 정보
		 *        - setAttribute()
		 *        - getAttribute()
		 *    4) 브라우저 정보***
		 *     ***- getRemoteAddress()
		 *     ***- getRequestURL()
		 *     ***- getRequestURI()
		 */
		request.setCharacterEncoding("UTF-8"); //한글깨짐방지, 디코딩
		
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String tel1=request.getParameter("tel1");
		String tel2=request.getParameter("tel2");
		String content=request.getParameter("content");
		String[] hobby=request.getParameterValues("hobby");
		//3. 데이터베이스 연결
		//4. HTML을 메모리에 저장
		PrintWriter out=response.getWriter();
		out.write("<html>");
		out.write("<body>");
		out.write("<h3>클라이언트가 보내준 값</h3>");
		out.write("이름 : "+name+"<br>");
		out.write("성별 : "+sex+"<br>");
		out.write("전화 : "+tel1+")"+tel2+"<br>");
		out.write("취미 : <br>");
		out.write("<ul>");
		try {
			for(String s:hobby) {
				out.write("<li>"+s+"</li>");
			}
		}catch(Exception exd) {
			out.write("<font color=red>취미가 없습니다</font>"); //NullPointerException 방지
		}
		out.write("</ul>");
		out.write("소개 : <pre>"+content+"</pre><br>");
		out.write("<a href=\"DataInputServlet\">입력</a>");
		out.write("<hr>");
		out.write("<h3>request의 기본 기능</h3>");
		out.write("서버명 : "+request.getServerName()+"<br>");
		out.write("서버포트 : "+request.getServerPort()+"<br>");
		out.write("클라이언트IP : "+request.getRemoteAddr()+"<br>");
		out.write("URL : "+request.getRequestURL()+"<br>");
		out.write("URI : "+request.getRequestURI()+"<br>");
		out.write("request는 화면이동, 새로고침시에 초기화(매개변수이기 때문)");
		out.write("</body>");
		out.write("</html>");
	}

}
