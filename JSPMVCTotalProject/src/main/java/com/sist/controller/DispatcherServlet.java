package com.sist.controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.model.Model;

import java.util.*;

/*
 *  1. JSP / Servlet => Model 1방식
 *     - 장점 1) 서블릿 => 자바코드만으로 HTML 코드 작성 => 오류 발생 확률 낮음
 *           2) JSP => 자바코드만으로 HTML 코드 작성 => 오류 발생 확률 낮음
 *           3) 단순 => 자바 / HTML <% %>, <%= %>로 구분
 *     - 단점 1) 가독성이 떨어진다 Java + HTML 
 *           2) 자바의 로직, 데이터베이스가 노출된다 (JSP는 배포시 모든 소스 전달)
 *              => 다른 개발자(업체)가 유지보수 가능
 *           3) 하나의 파일로 작업 => 분업이 어려움
 *              => HTML, CSS, JavaScript, Java, Oracle
 *     - 사용처 - 개인 기업 사이트
 *              유지보수가 거의 없는 사이트
 *              => JSP/Servlet : 확장성/재사용성이 많이 떨어짐
 *              개인 홈페이지, 간단한 사이트 제작
 *              
 *  2. MVC => Model 2방식 
 *     - JSP/Servlet 보완
 *       1) 확장성 / 재사용성 증가
 *       2) 보안이 필요한 경우 처리 => HTML/Java 완전 분리
 *       3) 분업화 Front-End / Back-End
 *       4) Controller 집중적 => 서버 부하가 많을 수 있다
 *          - Front-End의 MVC => Redux / Flux / Vuex
 *          - 서버를 나눠서 동시 구동 => MSA, 애자일기법
 *       5) 비용이 많이 들어간다, 분업화 => 개발자 증가
 *       6) 유지 보수 목적 => 쉬운 수정 / 추가
 *       7) 자바로만 코딩 => 어시스트 이용 가능
 *     - 공기업 / 금융권 / 대기업 - MVC 구조로 만들어져 있다 => Spring
 *     
 *  기능처리
 *    1. 클래스화 - 관리가 어렵다
 *    2. 메소드화 - 한개의 클래스에 메소드 여러개 
 *                구분자 (어노테이션) => 스프링
 *     
 *  라이브러리(완제품)
 *  프레임워크(자바소스 제공) => 전자정부 프레임워크, 애니 프레임워크
 *  
 *  스프링 6버전 - 자바 19이상
 *  실무 스프링 4,5버전 - 자바 17이상
 *  스프링 - 버전 자주 변경 => 버전 호환 주의해서 설치
 */
//Controller 고정
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String[] strCls= {
			"com.sist.model.MovieListModel",
			"com.sist.model.MovieDetailModel"
	};
	private String[] strCmd= {
			"list.do",
			"detail.do"
	};
	private Map clsMap=new HashMap();
	// Map 사용 - 클래스 등록(Spring), SQL문장 등록(MyBatis), 클라이언트 정보등록(WebSocket)
	// 웹은 거의 대부분 Map방식 사용
	// request, session, cookie 다 맵방식 => 키, 값
	// json => 자바스크립트 객체 표현법
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			for(int i=0;i<strCls.length;i++) {
				Class clsName=Class.forName(strCls[i]); //클래스 정보 읽기 => 제어 : 리플렉션
				Object obj=clsName.getDeclaredConstructor().newInstance(); // 클래스 메모리 할당
				// new 사용 => 결함성이 높은 프로그램 => new 사용 자제 => 스프링에서는 new 사용X
				clsMap.put(strCmd[i], obj);
				//시작과 동시에 클래스 메모리 저장 => 변경X => 싱글턴
				//System.out.println(strCmd[i]+" : "+obj);
			}
		}catch(Exception ex) {}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		Model model1=(Model)clsMap.get("list.do");
		Model model2=(Model)clsMap.get("list.do");
		Model model3=(Model)clsMap.get("list.do");
		Model model4=(Model)clsMap.get("list.do");
		Model model5=(Model)clsMap.get("list.do");
		System.out.println("model1 = "+model1);
		System.out.println("model2 = "+model2);
		System.out.println("model3 = "+model3);
		System.out.println("model4 = "+model4);
		System.out.println("model5 = "+model5); //모든 주소 동일 => 싱글턴
		*/
		
		//사용자 요청사항
		String cmd=request.getRequestURI();
		cmd=cmd.substring(cmd.lastIndexOf("/")+1);
		//해당 Model 찾기 => 기능별로 나눠서 작업
		Model model=(Model)clsMap.get(cmd);
		//JSP로 전송할 데이터를 가지고 온다
		String jsp=model.execute(request, response);
		//JSP로 request 전송
		RequestDispatcher rd=request.getRequestDispatcher(jsp);
		rd.forward(request, response);
	}

}
