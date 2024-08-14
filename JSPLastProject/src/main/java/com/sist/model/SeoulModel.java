package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
// Model - 사용자 요청 정보를 받아 요청처리 => 결과값을 브라우저에 전송 
public class SeoulModel {
	@RequestMapping("seoul/location.do") //명소
	public String seoul_location(HttpServletRequest request, HttpServletResponse response) {
		// 사용자 요청 받기 => getParameter(), getParameterValues()
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		// 요청처리 => 데이터베이스 연동 => 메소드 호출
		int rowSize=20;
		Map map=new HashMap();
		map.put("start", (curpage*rowSize)-(rowSize-1));
		map.put("end", curpage*rowSize);
		List<SeoulLocationVO> sList=SeoulDAO.seoulLocationListData(map);
		int totalpage=SeoulDAO.seoulLocationTotalPage();
		final int BLOCK=10;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage) {
			endpage=totalpage;
		}
		// 결과값을 브라우저에 전송 => setAttribute()
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("sList", sList);
		// 어떤 화면을 출력할지 설정
		request.setAttribute("main_jsp", "../seoul/location.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	
	@RequestMapping("seoul/nature.do") //자연
	public String seoul_nature(HttpServletRequest request, HttpServletResponse response) {
		// 사용자 요청 받기 => getParameter(), getParameterValues()
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		// 요청처리 => 데이터베이스 연동 => 메소드 호출
		int rowSize=20;
		Map map=new HashMap();
		map.put("start", (curpage*rowSize)-(rowSize-1));
		map.put("end", curpage*rowSize);
		List<SeoulNatureVO> sList=SeoulDAO.seoulNatureListData(map);
		int totalpage=SeoulDAO.seoulNatureTotalPage();
		final int BLOCK=10;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage) {
			endpage=totalpage;
		}
		// 결과값을 브라우저에 전송 => setAttribute()
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("sList", sList);
		// 어떤 화면을 출력할지 설정
		request.setAttribute("main_jsp", "../seoul/nature.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	
	@RequestMapping("seoul/shop.do") //쇼핑
	public String seoul_shop(HttpServletRequest request, HttpServletResponse response) {
		// 사용자 요청 받기 => getParameter(), getParameterValues()
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		// 요청처리 => 데이터베이스 연동 => 메소드 호출
		int rowSize=20;
		Map map=new HashMap();
		map.put("start", (curpage*rowSize)-(rowSize-1));
		map.put("end", curpage*rowSize);
		List<SeoulShopVO> sList=SeoulDAO.seoulShopListData(map);
		int totalpage=SeoulDAO.seoulShopTotalPage();
		final int BLOCK=10;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage) {
			endpage=totalpage;
		}
		// 결과값을 브라우저에 전송 => setAttribute()
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("sList", sList);
		// 어떤 화면을 출력할지 설정
		request.setAttribute("main_jsp", "../seoul/shop.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
}
