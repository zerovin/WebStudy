package com.sist.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/outputServlet")
public class outputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("OutputServlet:init(ServletConfig config) Call");
	}

	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("OutputServlet:destroy() Call");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("OutputServlet:doGet() Call");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("OutputServlet:doPost() Call");
		
		//405 – 허용되지 않는 메소드
		//HTTP 메소드 GET은 이 URL에 의해 지원되지 않습니다.
		//GET => doGet() / POST => doPost()
		//전송 방식에 맞는 메소드가 없을 경우 405 에러
	}

}
