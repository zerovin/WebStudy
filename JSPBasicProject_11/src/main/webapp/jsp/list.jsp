<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%--
	데이터관리 - 지속적으로 상태 관리
	데이터가 변경되는 상태 => JavaScript
	  - jQuery
	  - Vue
	  - React
	  ===> 클라이언트에서 데이터 상태관리

	자바(서버)
	                  Cookie                Session
	==========================================================
	사용클래스           Cookie              HttpSesseion         => 생성시에는 request
	          request.getCookies()     request.getSession()
	----------------------------------------------------------  
	저장되는 값          문자열           자바에서 사용하는 모든 클래스(Object)
	----------------------------------------------------------
	저장장소        클라이언트 브라우저    sessionId는 브라우저, 그 외 데이터는 서버
	                              *sessionId=브라우저 구분자(사용자 IP/PORT), 실시간채팅에 이용
	----------------------------------------------------------
	보안                취약                   뛰어남
	----------------------------------------------------------
	사용처         최신방문, 자동로그인      로그인처리시 사용자정보 저장
	          Spring => remember-me      장바구니 임시 저장 => Ajax/vue/react/next
	==========================================================
	
	Cookie 주요 메소드 => 브라우저저장, 브라우저별로 처리
   **1. 생성방법
	    Cookie cookie=new Cookie(String key, String value)
	      => Map 방식 - 키가 중복되면 덮어쓴다, 중복허용X
   **2. 저장방법
	    response.addCookie(cookie) - 브라우저로 전송하는 과정
	      => response - 한개의 JSP에서 한개의 내용(HTML or Cookie)만 전송 가능, 동시전송불가 => JSP두개 이용
   **3. 저장기간
	    cookie.setMaxAge(초단위)
	      ex) 60*60*24 => 24시간
	 4. 저장 위치
	    cookie.setPath("/") - 루트에 저장, 보통은 안써도 되지만 작성 권장
   **5. 키 읽기
	    cookie.getName()
   **6. 값 읽기
	    cookie.getValue()
	 7. 삭제방법
	    cookie.setMaxAge(0) 후 addCookie를 이용해서 브라우저로 전송
	 8. 전체 쿠키 읽기
	    Cookie[] cookies=request.getCookies()
	      => 순차적으로 저장
	      => 최신등록순 cookies.length-1부터 읽기
	    
	Session의 주요 메소드 => 서버저장, 구분=getId(), 저장공간은 클라이언트당 하나만 배정
   **1. 생성
	    HttpSession session=request.getSession()
	      => 자바에서 세션사용시 이용, MVC, Servlet, Spring
	      => JSP에서는 내장객체 session. 이용
   **2. 저장방법
	    session.setAttribute(String key(구분자), Object obj)
   **3. 저장된 값 읽기
	    Object session.getAttribute(String key)
	      => 리턴형이 Object이기 떄문에 데이터 받을 때 형변환 필수
	 4. 저장된 데이터 일부 삭제
	    removeAttribute()
   **5. 전체 삭제
	    invalidate()
	      => 로그아웃
	 6. 클라이언트마다 식별자
	    getId()
	 7. 서버에 저장하는 기간 => default 30분, 1800초
	    setMaxInactiveInterval()
	 8. 저장이 처음인지 여부
	    isNew()
--%>
<%
	String strPage=request.getParameter("page");
	if(strPage==null){
		strPage="1";
	}
	int curpage=Integer.parseInt(strPage);
	
	//DB연동
	SeoulDAO dao=SeoulDAO.newInstance();
	List<LocationVO> list=dao.seoulLocationListData(curpage);
	
	int totalpage=dao.seoulLocationTotalPage();
	
	final int BLOCK=10;
	int startpage=((curpage-1)/BLOCK*BLOCK)+1;
	int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	if(endpage>totalpage){
		endpage=totalpage;
	}
	
	//쿠키출력
	Cookie[] cookies=request.getCookies();
	List<LocationVO> cList=new ArrayList<LocationVO>();
	if(cookies!=null){
		//최신순으로 출력
		for(int i=cookies.length-1;i>=0;i--){
			if(cookies[i].getName().startsWith("seoul_")){
				String no=cookies[i].getValue();
				LocationVO vo=dao.seoulDetailData(Integer.parseInt(no));
				cList.add(vo);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
	.container{
		margin-top:50px;
	}
	.row{
		margin:0px auto;
		width:960px;
	}
	.a{
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<% for(LocationVO vo:list){ %>
			<%--
				response
				  응답 : HTML / Cookie
				  화면변경 : sendRedirect()
				request
				  요청 : 데이터 전송, 쿠키읽기, 세션읽기
				        사용자가 보내주는 모든 데이터는 request에 저장
				          ex) ?값, <form>
				Spring : 사용이 쉽게 만들어 준 라이브러리 - 형식이 1개(표준화)
				         출력시에는 JSP이용, 처리는 자바
				  
			 --%>
				<div class="col-sm-3">
					<div class="thumbnail">
						<a href="detail_before.jsp?no=<%=vo.getNo()%>">
							<img src="<%=vo.getPoster() %>" style="width:240px;height:200px;" alt="<%=vo.getTitle()%>" onerror="this.src='no_img.jpg'">
							<p class="a"><%=vo.getTitle() %></p>
						</a>
					</div>
				</div>
			<%} %>
		</div>
		<div class="row">
			<div class="text-center">
				<ul class="pagination">
				<% if(startpage>1) {%>
					<li><a href="list.jsp?page=<%=startpage-1%>">&lt;</a></li>
				<%} %>
					<% for(int i=startpage;i<=endpage;i++){ %>
						<li class="<%=i==curpage?"active":""%>"><a href="list.jsp?page=<%=i%>"><%=i %></a></li>
					<%} %>
				<% if(endpage<totalpage){ %>
					<li><a href="list.jsp?page=<%=endpage+1%>">&gt;</a></li>
				<%} %>
				</ul>
			</div>
		</div>
		<div style="height:20px;"></div>
		<div class="row">
			<h3>최근 방문 서울 여행</h3>
			<hr>
			<a href="all_delete.jsp" class="btn btn-sm btn-success">전체 삭제</a>
			<a href="all_view.jsp" class="btn btn-sm btn-info">전체 보기</a>
			<hr>
			<% 
				int i=0;
				for(LocationVO vo:cList){
					if(i>8) break;
			%>
					<figure style="float:left;margin-left:5px;">
						<img src="<%=vo.getPoster() %>" alt="<%=vo.getTitle() %>" style="width:100px;height:100px;" class="img-rounded">
						<figcaption style="margin:5px 30px;">
							<a href="delete.jsp?no=<%=vo.getNo() %>" class="btn btn-xs btn-danger">삭제</a>
						</figcaption>
					</figure>
			<%
					i++;
				}
			%>
		</div>
	</div>
</body>
</html>