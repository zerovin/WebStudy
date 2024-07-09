<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSP 생명주기
	 1. _jspInit() : web.xml에 환경설정, 생성자와 같은 역할
	 2. _jspService() : doGet() / doPost() 조건문으로 통합
	                    JSP파일에서 코딩한 소스가 _jspService()메소드 안에 첨부됨
	 3. _jspDestroy() : 메모리 해제	
	 
	 // JSP 내장객체
	 public void _jspService(HttpServletRequest request,HttpServletResponse response){
	 	PageContext pageContext;
	    HttpSession session = null;
	    ServletContext application;
	    ServletConfig config;
	    JspWriter out = null;
	    Object page = this;
	    
	    // _jspService() 메소드안 이 자리에서 코딩하는 개념이기 떄문에
	    // 위의 내장객체 사용가능
	    // JSP는 클래스 영역이 아니라 _jspService()영역에서 코딩
	 }
	 
	 113page
	 JSP 기초
	 JSP 스크립트에 대한 이해
	  1) JSP는 자바+HTML(CSS/JavaScript) 혼합
	     언어별 스크립트로 구분 가능
	     <% %> : 스크립트릿 - 일반 자바코딩, 변수선언-메소드 안이니 지역변수, 메소드 호출, 클래스 메모리할당, 제어문, 연산자
	     <%= %> : 표현식 -브라우저에 출력 담당, out.println()
	     <%! %> : 선언식 - 메소드를 JSP에서 만드는 경우, 사용빈도는 거의 없다
	                     class영역에 설정, 멤버변수 선언
        class basic_005f2_jsp extends HttpJspBase{
        	멤버변수 - <%! %>
        	생성자
        	메소드 - public void _jspInit(){}
        	       public void _jspDestroy(){}
        	       public void _jspService(){
        	       	<% %>
        	       	<%= %>
        	       }
        }
	     
 --%>
<%--
	 public void _jspService(HttpServletRequest request,HttpServletResponse response){
 --%>
 <%!
 	//public final class basic_005f2_jsp의 전역변수
 	String name;
 	public void display(){}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// _jspService() 메소드 안
		int age=10;
	%>
	<%--  out.print(age ) --%>
	<%=age%>
</body>
</html>
<%--
	}
--%>