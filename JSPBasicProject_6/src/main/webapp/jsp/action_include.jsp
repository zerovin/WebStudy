<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	151page
	액션태그 : 동작/액션이 일어나는 시점에 페이지와 페이지 사이의 제어, 이동에 이용
	  - <jsp:include> : JSP안에 다른 JSP를 포함하는 경우 => 화면분할(조립식)
	                    속성 - page="" : 포함하는 파일 지정
	                    xml 형식으로 만들어져 있다 => 문법이 복잡
	                        속성이나 태그명은 대소문자를 구분한다
	                        속성에 값을 첨부할 때 반드시 ""사용
	                        반드시 여는 태그와 닫는 태그가 동일, 독립태그 사용
	                    동적으로 변경 - 파일마다 따로 컴파일 후 HTML만 첨부
	  - <jsp:useBean> : 객체 메모리 할당
	                  - id="" : 객체명
	                  - class="" : 클래스명
	                  - scope="" : 메모리 할당 시기, 사용범위
	                               page : default, JSP안에서 사용
	                               session : 브라우저를 유지하는 동안
	                               application : 객체를 모든 JSP에서 사용하고 싶은 경우
	                               request : 사용자의 요청값이 있는 경우
	                  ex) MemberVO vo=new MemberVO();
	                      <jsp:useBean id="vo" class="com.sist.bean.MemberVO">
	                      위 두 코드는 동일 결과
	  - <jsp:setProperty> : setter에 값 설정
	                      - name : 객체명, useBean에 설정된 id와 일치
	                      - property : 변수명
	                        property="name" => setName()
	                        property="*" => 모든 setter
	  - <jsp:forward page="파일명"> : 서버에서 화면을 이동할 경우 사용
	                              - sendRedirect() : URL 변경
	                                                 request 초기화
	                              - forward() : URL 변경X
	                                            request 값 유지
	                                            URL,파일은 바뀌지 않고 지정파일에서 데이터만 가져와서 화면이동효과
	                                            MVC에서 주로 사용
 --%>
<%
	request.setCharacterEncoding("UTF-8");
	String mode=request.getParameter("mode");
	String jsp="";
	if(mode==null){
		mode="0";
	}
	int index=Integer.parseInt(mode);
	switch(index){
		case 0:
			jsp="home.jsp";
			break;
		case 1:
			jsp="join.jsp";
			break;
		case 2:
			jsp="idfind.jsp";
			break;
		case 3:
			jsp="passwordfind.jsp";
			break;
		case 4:
			jsp="send.jsp";
			break;
		case 5:
			jsp="mypage.jsp";
			break;
		case 6:
			jsp="recv.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.row{
		margin:0px auto;
		width:960px;
	}
</style>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container">
		<jsp:include page="<%=jsp %>"></jsp:include>
	</div>
</body>
</html>