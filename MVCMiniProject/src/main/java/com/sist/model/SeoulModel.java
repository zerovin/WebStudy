package com.sist.model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

import com.sist.commons.CommonsModel;
import com.sist.controller.*;
import com.sist.dao.*;
import com.sist.vo.*;
public class SeoulModel {
	@RequestMapping("seoul/location.do")
	public String location_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		SeoulDAO dao=SeoulDAO.newInstance();
		List<LocationVO> list=dao.locationListData(curpage);
		int totalpage=dao.locationTotalPage();
		
		final int BLOCK=20;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage) {
			endpage=totalpage;
		}
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("main_jsp", "../seoul/location.jsp");
		CommonsModel.commonsData(request);
		return "../main/main.jsp";
	}
}
