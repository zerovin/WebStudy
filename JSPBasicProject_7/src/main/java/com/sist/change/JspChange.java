package com.sist.change;

public class JspChange {
	private String[] jsp= {"../food/home.jsp", "../food/detail.jsp","", "../goods/goods_list.jsp","../goods/goods_detail.jsp"};	
	public String change(int no) {
		return jsp[no];
	}
}
