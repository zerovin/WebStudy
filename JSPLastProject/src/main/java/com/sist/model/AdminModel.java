package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class AdminModel {
	private String[] types= {"", "일반공지", "이벤트공지", "맛집공지", "여행공지"};
	@RequestMapping("adminpage/adminpage_main.do")
	public String adminpage_main(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("admin_jsp", "../adminpage/adminpage_home.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("adminpage/member_list.do")
	public String member_list(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("admin_jsp", "../adminpage/member_list.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	
	@RequestMapping("adminpage/notice_insert.do")
	public String notice_insert(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("admin_jsp", "../notice/notice_insert.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	
	@RequestMapping("adminpage/notice_list.do")
	public String notice_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		int rowSize=15;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<NoticeVO> noticeList=NoticeDAO.noticeListData(map);
		for(NoticeVO vo:noticeList) {
			vo.setNotice_type(types[vo.getType()]);
		}
		
		int count=NoticeDAO.noticeRowCount();
		int totalpage=(int)(Math.ceil(count/rowSize));
		count=count-((curpage*rowSize)-rowSize);
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count", count);
		request.setAttribute("noticeList", noticeList);
		
		request.setAttribute("admin_jsp", "../notice/notice_list.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	
	@RequestMapping("adminpage/notice_insert_ok.do")
	public String notice_insert_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String type=request.getParameter("type");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		NoticeVO vo=new NoticeVO();
		vo.setType(Integer.parseInt(type));
		vo.setSubject(subject);
		vo.setContent(content);
		NoticeDAO.noticeInsert(vo);
		return "redirect:../adminpage/notice_list.do";
	}
	
	@RequestMapping("adminpage/notice_update.do")
	public String notice_update(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		NoticeVO vo=NoticeDAO.noticeUpdateData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("admin_jsp", "../notice/notice_update.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("adminpage/notice_update_ok.do")
	public String notice_update_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String type=request.getParameter("type");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String no=request.getParameter("no"); //update, delete
		NoticeVO vo=new NoticeVO();
		vo.setType(Integer.parseInt(type));
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setNo(Integer.parseInt(no));
		//DB연동
		NoticeDAO.noticeUpdate(vo);
		return "redirect:../adminpage/notice_list.do";
	}
	
	@RequestMapping("adminpage/notice_delete.do")
	public String notice_delete(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		//DB 연동
		NoticeDAO.noticeDelete(Integer.parseInt(no));
		return "redirect:../adminpage/notice_list.do";
	}
	
	@RequestMapping("adminpage/reply_list.do")
	public String reply_list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("admin_jsp", "../adminpage/reply_list.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
}
