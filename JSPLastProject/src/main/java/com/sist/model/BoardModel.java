package com.sist.model;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.manager.WordManager;
import com.sist.vo.*;
/*
 *  1.mapper.xml
 *  2.DAO
 *  3.Model
 *  4.JSP 
 *  
 *  일반 JSP
 *  <% java %> 데이터 읽기
 *  
 *  MVC JSP
 *  데이터를 받아서 출력 Model => Controller (.do)
 *      .do로 호출
 *  JSP ===========> Controller ====================> Model => Controller =========> JSP
 *        request               request에 데이터를 담아줌                       request
 *        
 *  Front : Ajax, Vue, React, Node, Typescript, CSS, HTML
 *  Back : Java, Spring, Springboot, Mybatis/JPA
 *  AI : 파이썬, 머신러닝, 딥러닝, 넘파이, MatPlotLib, 판다스
 */ 
public class BoardModel {
	@RequestMapping("board/insert.do")
	public String board_insert(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../board/insert.jsp");
		//입력창만 보여준다
		return "../main/main.jsp";
	}
	
	/*
	 *  insert_ok => 처리 => list.jsp
	 *  update_ok => 처리 => detail.jsp
	 *  delete_ok => 처리 => list.jsp
	 *  ===> sendRedirect() 
	 */
	@RequestMapping("board/insert_ok.do")
	public String board_insert_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		BoardDAO.boardInsert(vo);
		return "redirect:../board/list.do";
	}
	
	@RequestMapping("board/list.do")
	public String board_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		int rowSize=10;
		Map map=new HashMap();
		map.put("start", (curpage*rowSize)-(rowSize-1));
		map.put("end", curpage*rowSize);
		List<BoardVO> list=BoardDAO.boardListData(map);
		int count=BoardDAO.boardRowCount();
		int totalpage=(int)(Math.ceil(count/rowSize));
		count=count-((curpage*rowSize)-rowSize);
		
		//전송
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		request.setAttribute("main_jsp", "../board/list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("board/detail.do")
	public String board_detail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		//데이터베이스에서 값을 가지고 온다
		BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		WordManager wm=new WordManager();
		List<WordVO> list=wm.wordCountData(vo.getContent());
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../board/detail.jsp");
		return "../main/main.jsp";
	}
	
	/*
	 *  Spring
	 *  @RequestMapping("") => GET+POST
	 *  @GetMapping("")
	 *  #PostMapping("")
	 */
	@RequestMapping("board/update.do")
	public String board_update(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		//데이터베이스 연동
		BoardVO vo=BoardDAO.boardUpdateData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../board/update.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("board/update_ok.do")
	public void board_update_ok(HttpServletRequest request, HttpServletResponse response) {
		//ajax => void
		//url을 변경하지 않은 상태에 처리
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String no=request.getParameter("no");
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		
		BoardVO vo=new BoardVO();
		vo.setNo(Integer.parseInt(no));
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		//데이터베이스 연동
		String result=BoardDAO.boardUpdate(vo);
		//ajax로 값 전송 => yes or no
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {}
	}
	
	@RequestMapping("board/delete.do")
	public void board_delete(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		//데이터베이스 연동
		String result=BoardDAO.boardDelete(Integer.parseInt(no), pwd);
		//ajax로 결과값 전송 yes or no
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {}
	}
}