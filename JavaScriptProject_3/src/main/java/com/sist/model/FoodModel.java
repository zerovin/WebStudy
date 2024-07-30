package com.sist.model;
import java.io.PrintWriter;
/*
 *  자바스크립트 ---JSON--- 자바 ---SQL--- 오라클
 *  └JSON을 받아서 HTML에 출력 => 동적
 *  
 *  자바 : 데이터관리 (변수, 제어문, 연산자, 메소드, 데이터베이스 연동)
 *  오라클 : SQL
 *  HTML / CSS : 브라우저에 출력
 *  자바스크립트 : HTML/CSS 제어 => 동적으로 HTML 생성
 *  => 통합 Spring Framework
 *     - 데이터베이스 연결 : MyBatis
 *     - 자바스크립트 연동 : Jackson(JSON)
 *                      Vue, React
 */
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
public class FoodModel {
	private FoodDAO dao=FoodDAO.newInstance();
	// 화면이 바뀌면 안되는 부분 => 예약하기, 좋아요, 찜, 아이디중복체크, 우편번호, 채팅, 검색, 탭, 모달
	@RequestMapping("js/food_find.do")
	public String food_find(HttpServletRequest request, HttpServletResponse response) {
	
		return "food_find.jsp";
	}
	
	//_js => javascript에서 데이터를 읽어간다 => JSON 제작
	@RequestMapping("js/food_find_js.do")
	public void food_find_js(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		String addr=request.getParameter("addr");
		if(addr==null) {
			addr="마포";
		}
		int curpage=Integer.parseInt(page);
		List<FoodVO> list=dao.foodFindData(curpage, addr);
		int totalpage=dao.foodFindTotalPage(addr);
		
		final int BLOCK=10;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endpage>totalpage) {
			endpage=totalpage;
		}
		int i=0;
		JSONArray arr=new JSONArray();
		for(FoodVO vo:list) {
			JSONObject obj=new JSONObject(); //VO fno, name, poster, address
			obj.put("fno", vo.getFno());
			obj.put("name", vo.getName());
			obj.put("poster", vo.getPoster().replace("https", "http"));
			obj.put("address", vo.getAddress());
			if(i==0) {
				obj.put("curpage", curpage);
				obj.put("totalpage", totalpage);
				obj.put("startpage", startpage);
				obj.put("endpage", endpage);
			}
			arr.add(obj);
			i++;
		}
		try {
			response.setContentType("text/plain;charset=UTF-8");
			// json => text/plain
			PrintWriter out=response.getWriter();
			out.print(arr.toJSONString());
		}catch(Exception ex) {}
	}
	
	@RequestMapping("js/food_detail_js.do")
	public void food_detail_js(HttpServletRequest request, HttpServletResponse response) {
		String fno=request.getParameter("fno");
		FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
		JSONObject obj=new JSONObject();
		obj.put("name", vo.getName());
		obj.put("address", vo.getAddress());
		obj.put("phone", vo.getPhone());
		obj.put("score", vo.getScore());
		obj.put("theme", vo.getTheme());
		obj.put("type", vo.getType());
		obj.put("poster", vo.getPoster().replace("https", "http"));
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.print(obj.toJSONString());
		}catch(Exception ex) {}
	}
}
