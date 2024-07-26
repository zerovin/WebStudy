package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 *	관련 클래스가 많은 경우 : 한개로 모아서 처리 => 인터페이스
 *
 *  여러개 => 한개로 묶음
 *    변수 여러개 => 배열
 *    클래스 여러개 => 인터페이스
 *    메소드 여러개 => 구분자 - 임의로 결정 ex) a(), b(), c()
 *                       - 제공하는 구분자 : 어노테이션
 *  재사용, 확장성, 가독성, 최적화, 접근성
 */
public class MovieDetailModel implements Model{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}
}
