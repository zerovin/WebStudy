package com.sist.commons;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.NoticeDAO;
import com.sist.vo.NoticeVO;

public class CommonsModel {
	public static void footerPrint(HttpServletRequest request) {
		//공지사항
		List<NoticeVO> footerNList=NoticeDAO.noticeTop5Data();
		request.setAttribute("footerNList", footerNList);
		
		//인기맛집
		//뉴스
	}
}