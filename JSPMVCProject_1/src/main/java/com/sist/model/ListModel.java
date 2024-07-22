package com.sist.model;

import javax.servlet.http.HttpServletRequest;

/*
 *  MVC - HTML / Java 분리하는 과정
 *      - 분업 / 확장성 / 재사용
 *      - 실제 실무에서는 MVC만 사용
 *         => MVC 단점 : 소스가 복잡
 *                      Controller에 의존하는 경향 => 컨트롤러 여러개 사용해서 해결 => 도메인방식
 *      - Spring => MVC Project, MVC만 사용 가능
 *      
 *  MVC
 *   - Model : 자바와 관련된 모든 소스
 *             사용자 요청에 따른 데이터 관리
 *             ex) DAO, VO, Service, Manager
 *   - View : 태그형 프로그램 중심
 *            Model에서 전송한 화면 출력
 *            <% %> <%= %> => <c:forEach> <c:if> ${}
 *   	      ex) JSP, HTML, CSS, JavaScript
 *   - Controller : Model과 View를 연결하는 역할
 *                  스프링에서는 이미 Servlet으로 제작되어 있다
 *  MVC 실행과정
 *   1. JSP(요청) => <a>, <form>, Ajax, JavaScript
 *      ** JSP에서 요청(URL) => 받을 수 있는 파일 servlet, JSP
 *   2. Controller가 요청값을 받는다
 *      1) 요청 값을 받는다
 *         request, response 전송
 *      2) 해당 Model을 찾는다
 *         요청에 대한 처리 => 결과값을 request에 담아준다
 *      3) 받아서 출력할 JSP를 찾는다
 *      4) JSP에 forward 이용해서 request를 전송
 *         ** 모든 화면은 Controller => .do (서블릿을 나타낸다)
 *            => URL은 그대로 JSP화면만 갱신
 *   3. JSP에 화면을 출력하고 Controller에 덮어쓴다
 *      - 시작과 끝은 Controller (.do~.do) => 모든 URL주소는 .do
 *      - .do => 서블릿을 찾을 때 사용
 *      
 *        request                request              
 *   JSP =========> Controller ==========> Model ======> DAO
 *   JSP <========= Controller <========== Model <========|
 *        reqeust           request에 값을 담는다
 *        
 *  list.jsp - 자바 / HTML 혼합 => list.jsp / ListModel.java 로 분리
 *  insert.jsp => insert.jsp / InsertModel.java
 *  update.jsp => update.jsp / UpdateModel.java
 *  delete.jsp => delete.jsp / DeleteModel.java
 *                ============================== 분리된 형태를 합쳐주는 역할 => Controller
 */
public class ListModel {
	public String execute(HttpServletRequest request) {
		String msg="게시판 목록";
		request.setAttribute("msg", msg);
		return "view/list.jsp";
	}
}
