package com.sist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.model.*;
// Controller는 고정 => 기능 추가가능
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// /Controller?cmd=list ==> list.jsp
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 요청 내용 확인
		String cmd=request.getParameter("cmd");
		String jsp="";
		
		if(cmd.equals("list")) {
			ListModel model=new ListModel();
			jsp=model.execute(request);
		}else if(cmd.equals("insert")) {
			InsertModel model=new InsertModel();
			jsp=model.execute(request);
		}else if(cmd.equals("update")) {
			UpdateModel model=new UpdateModel();
			jsp=model.execute(request);
		}else if(cmd.equals("delete")) {
			DeleteModel model=new DeleteModel();
			jsp=model.execute(request);
		}
			
		RequestDispatcher rd=request.getRequestDispatcher(jsp);
		rd.forward(request, response);
	}

}
