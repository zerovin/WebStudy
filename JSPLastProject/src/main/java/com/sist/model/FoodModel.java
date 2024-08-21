package com.sist.model;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
public class FoodModel {
	@RequestMapping("food/list.do")
	public String food_list(HttpServletRequest request, HttpServletResponse response) {
		//사용자 요청값 받기
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=20;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		List<FoodVO> fList=FoodDAO.foodListData(map);
		
		int totalpage=FoodDAO.foodTotalPage();
		
		final int BLOCK=10;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage) {
			endpage=totalpage;
		}
		
		request.setAttribute("fList", fList);
		request.setAttribute("curpage", curpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("totalpage", totalpage);
		
		//DB 연동 => 출력할 데이터 전송
		int count=FoodDAO.foodListCount();
		request.setAttribute("count", count);
		
		request.setAttribute("main_jsp", "../food/list.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	
	@RequestMapping("food/detail_before.do")
	public String food_detail_before(HttpServletRequest request, HttpServletResponse response) {
		String fno=request.getParameter("fno");
		String type=request.getParameter("type");
		//쿠키
		Cookie cookie=new Cookie("food_"+fno, fno);
		cookie.setMaxAge(60*60*24);
		cookie.setPath("/");
		//브라우저로 전송
		response.addCookie(cookie);
		return "redirect:../food/detail.do?fno="+fno+"&type="+type;
	}
	//상세
	@RequestMapping("food/detail.do")
	public String food_detail(HttpServletRequest request, HttpServletResponse response) {
		//사용자가 보내준 데이터를 받는다 fno, type(좋아요, 찜, 댓글)
		// 맛집1 / 레시피2 / 서울여행3 / 상품4 
		String fno=request.getParameter("fno");
		String type=request.getParameter("type");
		
		//데이터베이스 연동
		FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(fno));
		
		String addr=vo.getAddress();
		String addr1=addr.substring(addr.indexOf(" ")+1);
		String addr2=addr1.substring(0, addr1.indexOf(" "));
		List<FoodVO> rList=FoodDAO.foodRearListData(addr2);
		
		boolean bCheck=false;
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		if(id!=null) {
			Map map=new HashMap();
			map.put("cno", fno);
			map.put("type", type);
			map.put("id", id);
			int count=AllJjimDAO.allJjimCheck(map);
			if(count==1) {
				bCheck=true;
			}else {
				bCheck=false;
			}
			request.setAttribute("check", bCheck);
		}
		request.setAttribute("vo", vo);
		request.setAttribute("type", type);
		request.setAttribute("rList", rList);
		request.setAttribute("main_jsp", "../food/detail.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	
	//검색
	// _ok.do => redirect
	// ajax => void - 자체 파일에서 처리
	// 일반 => main.jsp
	@RequestMapping("food/find.do")
	public String food_find(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String ss=request.getParameter("ss");
		if(ss==null) {
			ss="마포";
		}
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		int rowSize=20;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("ss", ss);
		
		//데이터 읽기
		List<FoodVO> fList=FoodDAO.foodFindData(map);
		//총페이지 읽기
		int totalpage=FoodDAO.foodFindTotalPage(ss);		
		//BLOCK별 처리
		final int BLOCK=10;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage) {
			endpage=totalpage;
		}
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("fList", fList);
		request.setAttribute("ss", ss);
		request.setAttribute("main_jsp", "../food/find.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
}