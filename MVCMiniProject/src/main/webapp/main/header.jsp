<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	MVC - HTML / Java : 분리해서 사용
	    - 소스가 적어진다, 파일수가 적어진다 (X)
	        - HTML => jsp / java => java  ===> 파일 2배
	          여러명의 개발자 동시 개발가능 (분업)
	    - JSP 단점 - 보안취약 => 자바는 .class, JSP는 소스를 통으로 넘겨줌
	                재사용이 어렵다
	                확장성이 낮다
	       => 단점 극복을 위해 jsp, java 분리
	    - HTML(View) / Java(Model) / 연결하는 파일(Controller)
	    - MVC구조의 동작
	      사용자 요청 <form>, <a>, JavaScript
	        => Controller Servlet / JSP => URL 주소를 이용해서 데이터 전송
	           일반 자바는 request가 없기 때문에 받을 수 없다
	           서블릿 / JSP => 연결
	    - Servlet / JSP 역할
	       1) 사용자 요청 받기
	       2) Model을 찾는다
	          Model - 자바(클래스) => 연관된 기능만 가지고 있다
	                  클래스 / 메소드 => 어노테이션(찾기)
	       3) 요청 결과값을 가지고 온다 (request/session)
	          request : 한개의 JSP에서만 사용시
	          session : 모든 JSP에서 데이터 공유
	       4) 요청한 JSP로 request 전송 => forward 사용
	  
	JSP ===> Controller ===> Model ===> DAO
	 ↑====== Controller <=== Model <=====┘
	request - forward / sendRedirect
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper row1">
	  <header id="header" class="clear"> 
	    <div id="logo" class="fl_left">
	      <h1><a href="../main/main.do">맛집 AND 서울여행</a></h1>
	    </div>
	    <div class="fl_right">
	      <ul class="inline">
	        <li><i class="fa-solid fa-user"></i><input type="text" class="input-sm" placeholder="아이디"></li>
	        <li><i class="fa-solid fa-lock"></i><input type="password" class="input-sm" placeholder="비밀번호"></li>
	      </ul>
	    </div>
	  </header>
	</div>
	<div class="wrapper row2">
	  <nav id="mainav" class="clear"> 
	    <ul class="clear">
	      <li class="active"><a href="../main/main.do">홈</a></li>
	      <li><a class="drop" href="#">회원</a>
	        <ul>
	          <li><a href="pages/gallery.html">회원가입</a></li>
	          <li><a href="pages/full-width.html">아이디찾기</a></li>
	          <li><a href="pages/sidebar-left.html">비밀번호찾기</a></li>
	        </ul>
	      </li>
	      <li><a class="drop" href="#">맛집</a>
	        <ul>
	          <li><a href="../food/list.do">맛집 목록</a></li>
	          <%-- Controller를 찾을 때 URL패턴 => .do --%>
	          <li><a href="pages/full-width.html">맛집 예약</a></li>
	          <li><a href="../food/find.do">지역별 맛집 찾기</a></li>
	          <li><a href="pages/sidebar-left.html">맛집 뉴스</a></li>
	        </ul>
	      </li>
	      <li><a class="drop" href="#">서울여행</a>
	        <ul>
	          <li><a href="../seoul/location.do">명소</a></li>
	          <li><a href="pages/full-width.html">자연 & 관광</a></li>
	          <li><a href="pages/sidebar-left.html">쇼핑</a></li>
	          <li><a href="pages/sidebar-left.html">호텔</a></li>
	          <li><a href="pages/sidebar-left.html">날씨</a></li>
	        </ul>
	      </li>
	      <li><a class="drop" href="#">커뮤니티</a>
	        <ul>
	          <li><a href="pages/gallery.html">자유게시판</a></li>
	          <li><a href="pages/full-width.html">공지사항</a></li>
	          <li><a href="pages/sidebar-left.html">묻고 답하기</a></li>
	          <li><a href="pages/sidebar-left.html">실시간 채팅</a></li>
	        </ul>
	      </li>
	      <li><a href="#">스토어</a></li>
	      <li><a href="#">마이페이지</a></li>
	    </ul>
	  </nav>
	</div>
</body>
</html>