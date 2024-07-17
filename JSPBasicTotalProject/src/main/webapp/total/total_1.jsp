<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. JSP의 실행과정
	        
	   a.jsp
	     | 
	     | 실행요청(톰캣)
	     ↓ 
	   a_jsp.java - 자바로 변경 
	   public class a_jsp extends HttpBaseJsp{                   
	      public void _jspInit(){}            
	      public void _jspDestroy(){}
	      public void _jspService(HttpServletRequest request, 
	        HttpServletResponse response){
	         final javax.servlet.jsp.PageContext pageContext;
	         javax.servlet.http.HttpSession session = null;
	         final javax.servlet.ServletContext application;
	         final javax.servlet.ServletConfig config;
	         javax.servlet.jsp.JspWriter out = null;
	         final java.lang.Object page = this;
	         =======> JSP의 소스코딩 <% %>
	         <% %>
	         out.write(HTML)
	         <%= %> => out.print()
	      }
	   }
	    |
	    | 컴파일
	    ↓
	 a_jsp.class - 한줄씩 읽어서 메모리 저장
	             => out.write()에 있는 내용(HTML)만 저장
	             => 저장된 HTML을 브라우저에서 읽어서 출력
	 
	               jsp파일 요청 => URL => request
	 브라우저 -----------------------------------------> 톰캣
	       <----------------------------------------
	        요청 처리(자바코딩) 후 응답, HTML => response
	        
	 JSP 사용
	  - 지시자 : page - JSP에 대한 정보를 저장
	                - 변환 => 브라우저에 알림
	                         contentType="text/html, text/xml, text/plain"
	                - 외부 라이브러리 => import
	                                 java.lang, javax.http.servlet 외의 모든 패키지는 import
	                                 사용자정의 라이브러리 포함 import
	                - errorPage : 에러가 있는 경우에 이동하는 파일 지정
	           taglib - <% %>를 제거하기 위해 제작된 태그
	                  - for / if 제어문을 태그로 제작
	                  - 자바는 사용하지 않고 태그형 문법 사용
	  - 자바표현법
	  - 내장객체
	  - JSP 액션태그
	  - 데이터베이스 연동
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>