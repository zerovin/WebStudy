package com.sist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.model.*;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String[] strCls= {
			"com.sist.model.ListModel",
			"com.sist.model.InsertModel",
			"com.sist.model.InsertOkModel",
			"com.sist.model.DetailModel",
			"com.sist.model.ReplyModel",
			"com.sist.model.ReplyOkModel",
			"com.sist.model.UpdateModel"
	};
	private String[] strCmd= {
			"list.do",
			"insert.do",
			"insert_ok.do",
			"detail.do",
			"reply.do",
			"reply_ok.do",
			"update.do"
	};
	private Map clsMap=new HashMap();
	// 관련된 클래스를 모아서 관리 => Factory Pattern => Spring (Container) 클래스 관리자
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			for(int i=0;i<strCls.length;i++) {
				Class clsName=Class.forName(strCls[i]);
				Object obj=clsName.getDeclaredConstructor().newInstance();
				clsMap.put(strCmd[i], obj);
			}
		}catch(Exception ex) {}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 사용자의 요청정보를 읽어온다 (URI)
		String cmd=request.getRequestURI();
		cmd=cmd.substring(cmd.lastIndexOf("/")+1);
		// 해당 Model을 찾는다
		Model model=(Model)clsMap.get(cmd);
		//요청처리 => JSP를 찾는다
		String jsp=model.execute(request);
		if(jsp.startsWith("redirect")) { // _ok => 화면출력X, 화면이동 => sendRedirect
			String s=jsp.substring(jsp.indexOf(":")+1);
			response.sendRedirect(s); 
			/* _ok : 화면출력부분이 아니라 데이터베이스 연동만 => 요청 처리
			         다른 jsp로 화면 이동
			         ex) delete.jsp => delete_ok.jsp => list.jsp
			             insert.jsp => insert_ok.jsp => list.jsp
			             update.jsp => update_ok.jsp => detail.jsp   
			*/   
		}else {
			//화면출력해야하는 페이지
			//JSP에 request 전송
			//JSP를 찾아야하기 때문에 jsp사용
			RequestDispatcher rd=request.getRequestDispatcher(jsp);
			rd.forward(request, response);			
		} //void => ajax, vuejs
	}

}
