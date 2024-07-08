package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.DAO.*;

@WebServlet("/EmpListServlet")
public class EmpListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("init() Call");
	}

	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("destroy() Call");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 전송방식 HTML전송
		response.setContentType("text/html;charset=UTF-8");
		// 2. 데이터 읽거나, 사용자로부터 데이터를 받는다
		EmpDAO dao=EmpDAO.newInstance();
		List<EmpVO> list=dao.empListData();
		
		PrintWriter out=response.getWriter();
		
		out.write("<html>");
		out.write("<head>");
		out.write("<link rel=\"stylesheet\" href=\"table.css\">");
		out.write("</head>");
		out.write("<body>");
		out.write("<center>");
		out.write("<h3>사원 목록</h3>");
		out.write("<table class=\"table_content\" width=600>");
		out.write("<tr>");
		out.write("<th>사번</th>");
		out.write("<th>이름</th>");
		out.write("<th>직위</th>");
		out.write("<th>입사일</th>");
		out.write("<th>성과급</th>");
		out.write("</tr>");
		for(EmpVO vo:list) {
			out.write("<tr class=\"dataTr\">");
			out.write("<td class=\"tdcenter\">"+vo.getEmpno()+"</td>");
			out.write("<td class=\"tdcenter\"><a href=EmpDetailServlet?empno="+vo.getEmpno()+">"+vo.getEname()+"</a></td>");
			// 파일명?키=값 ==> 파일이 값을 받아서 처리한 결과를 화면에 출력
			// ? 이후 키는 주로 primary key => 상세보기
			// ? 이후 일반 문자열 => 검색
			// ? 이후 페이지번호
			// ?키=값&키=값 전송값이 여러개 일 떄 &로 구분해서 처리
			// <a> => GET방식 , <form> => GET/POST방식 둘다 가능, Ajax => type:GET/POST 둘 다 가능
			// JavaScript => location.href="" => GET방식
			// Java(response) => sendRedirect("") => GET방식
			out.write("<td class=\"tdcenter\">"+vo.getJob()+"</td>");
			out.write("<td class=\"tdcenter\">"+vo.getHiredate().toString()+"</td>");
			out.write("<td class=\"tdcenter\">"+vo.getComm()+"</td>");
			out.write("</tr>");
		}
		out.write("</table>");
		out.write("</center>");
		out.write("</body>");
		out.write("</html>");
	}

}
