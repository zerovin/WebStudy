package com.sist.model;
import java.util.*;
import javax.servlet.http.HttpServletRequest;

import com.sist.dao.*;
public class GoodsModel {
	public void goodsListData(HttpServletRequest request) {
		String strPage=request.getParameter("page");
		if(strPage==null){
			strPage="1";
		}
		int curpage=Integer.parseInt(strPage);
		
		GoodsDAO dao=GoodsDAO.newInstance();
		List<GoodsVO> list=dao.goodsListData(curpage);
		int totalpage=dao.goodsTotalPage();
		
		//BLOCK
		final int BLOCK=10;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage){
			endpage=totalpage;
		}
		
		//JSP에 출력할 데이터 전송
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		
	}
}
