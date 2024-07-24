package com.sist.model;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.*;
import com.sist.dao.*;
import com.sist.vo.*;
//맛잡 관련 모든 기능 처리
public class FoodModel {
	private String[] guList = { "전체", "강서구", "양천구", "구로구", "마포구", "영등포구", "금천구",
			"은평구", "서대문구", "동작구", "관악구", "종로구", "중구", "용산구", "서초구", "강북구",
			"성북구", "도봉구", "동대문구", "성동구", "강남구", "노원구", "중랑구", "광진구", "송파구",
			"강동구" };
	// 목록 출력
	@RequestMapping("food/list.do") // 바로 아래에 있는 클래스, 변수, 메소드 찾아주는 역할
	public String food_list(HttpServletRequest request, HttpServletResponse response) {
		//요청을 받는 경우 : request
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		//현재 페이지 지정
		int curpage=Integer.parseInt(page);
		FoodDAO dao=FoodDAO.newInstance();
		List<FoodVO> list=dao.foodListData(curpage);
		int totalpage=dao.foodTotalPage();
		
		//응답 : response
		final int BLOCK=10;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		/*
		 * startpage = 1  curpage = 1~10
		 * endpage = 10  curpage = 1~10
		 */
		if(endpage>totalpage) {
			endpage=totalpage;
		}
		
		//JSP에서 출력에 필요한 데이터 전송
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		
		//include되는 파일 전송
		request.setAttribute("main_jsp", "../food/list.jsp");
		
		// jsp파일 지정 => include된 경우 main.jsp로 이동
		return "../main/main.jsp"; 
	}
	
	@RequestMapping("food/before_detail.do")
	public String food_before_detail(HttpServletRequest request, HttpServletResponse response) {
		String fno=request.getParameter("fno");
		//쿠키 생성
		Cookie cookie=new Cookie("food_"+fno, fno);
		//키가 중복되면 덮어쓴다 => Map방식
		//쿠키의 단점 => 보안취약, 문자열만 저장가능
		
		//쿠키 저장기간
		cookie.setMaxAge(60*60*24);
		
		//쿠키 저장 위치
		cookie.setPath("/");
		
		//response 이용해서 브라우저에 전송
		response.addCookie(cookie);
		return "redirect:../food/detail.do?fno="+fno;
	}
	
	@RequestMapping("food/detail.do")
	public String food_detail(HttpServletRequest request, HttpServletResponse response) {
		//사용자가 보내준 요청 값을 받는다
		String fno=request.getParameter("fno");
		FoodDAO dao=FoodDAO.newInstance();
		//Spring => 자체가 싱글턴
		FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
		request.setAttribute("vo", vo);
		
		//명소 전송
		String addr=vo.getAddress();
		addr=addr.substring(addr.indexOf(" "));
		String addr2=addr.trim();
		addr2=addr2.substring(0, addr2.indexOf(" "));
		
		List<FoodVO> sList=dao.foodLocationData(addr2);
		request.setAttribute("sList", sList);
		
		request.setAttribute("addr2", addr2);
		request.setAttribute("main_jsp", "../food/detail.jsp");
		return "../main/main.jsp";
	}
	
	// 맛집 검색
	@RequestMapping("food/find.do")
	public String food_find(HttpServletRequest request, HttpServletResponse response) {
		String gu=request.getParameter("gu");
		if(gu==null) {
			gu="4";
		}
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		//현재 페이지 지정
		int curpage=Integer.parseInt(page);
		FoodDAO dao=FoodDAO.newInstance();
		List<FoodVO> list=dao.foodFindData(curpage, guList[Integer.parseInt(gu)]);
		int totalpage=dao.foodFindTotalPage(guList[Integer.parseInt(gu)]);
		
		//응답 : response
		final int BLOCK=10;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		/*
		 * startpage = 1  curpage = 1~10
		 * endpage = 10  curpage = 1~10
		 */
		if(endpage>totalpage) {
			endpage=totalpage;
		}
		
		int count=dao.foodFindCount(guList[Integer.parseInt(gu)]);
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("gu", gu);
		request.setAttribute("fd", guList[Integer.parseInt(gu)]);
		request.setAttribute("count", count);
		request.setAttribute("main_jsp", "../food/find.jsp");
		return "../main/main.jsp";
	}
	// 맛집 예약
	// 맛집 추천
}
