package com.sist.model;
import javax.servlet.http.HttpServletRequest;
import com.sist.dao.*;
public class UpdateModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		// 클라이언트 전송 => Model클래스가 받는다 => 처리 후 request에 결과값을 담는다 => Controller가 해당 JSP에 request 전송
		String no=request.getParameter("no");
		BoardDAO dao=BoardDAO.newInstance();
		BoardVO vo=dao.boardDetailData(Integer.parseInt(no));
		
		//Controller가 해당 JSP에 request를 전송
		request.setAttribute("vo", vo);		
		return "update.jsp";
	}

}
