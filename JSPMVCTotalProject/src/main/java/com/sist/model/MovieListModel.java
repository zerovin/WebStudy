package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.manager.*;
public class MovieListModel implements Model{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String title="";
		String type=request.getParameter("type");
		if(type==null) {
			type="1";
		}
		int index=Integer.parseInt(type);
		if(index==1) {
			title="일별 박스오피스";
		}else if(index==2) {
			title="실시간 예매율";
		}else if(index==3) {
			title="좌석 점유율";
		}
		MovieManager mm=new MovieManager();
		List<MovieVO> list=mm.movieListData(Integer.parseInt(type));
		request.setAttribute("list", list);
		request.setAttribute("title", title);
		return "../movie/list.jsp";
	}
}
