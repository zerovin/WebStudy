<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="16kb"%>
<%--
	1. out
	   출력버퍼(HTML저장 메모리 공간) 관리 객체명 => JspWriter
	   JSP실행 요청 => 톰캣 => out.wirte() 메모리에 출력
	   ----------          ------------ 
	  브라우저에서 읽기       서블릿 out.wirte("<html>:)
	 (자동으로  메모리 비움)   JSP은 HTML앞에 out.write 생략
	 브라우저에서 읽을때마다 잘라내기
	 => 사용자당 메모리 공간 1개 생성
	    ex) out, session, cookie(브라우저에 저장)
	   JSP 기본 저장 공간 - 8kb
	                     HTML이 많거나 (상용된 사이트) => 크기를 변경할 수 있다
	                     <%@ page buffer="16kb" %>
	   주요 메소드
	     - println() / print() / write() => HTML 저장 용도 <% %> == out.print()
	       println()-메모리 내에서 줄바꿈, 브라우저에서는 X
	     - getBufferSize() : 버퍼의 크기 확인
	     - getRemaining() : 남아있는 버퍼 크기 확인
	   => out객체(<%= %>, ${})는 한번만 사용한다 => 다운로드
	   ***권장사항 : <%@~ 지시자를 제외하고 <% 제거한다 => HTML/Java를 통합하지 않는다
	      JSP안에 자바코딩 : 재사용을 할 수 없다
	                      자바를 별도로 재작 (재사용, 추가, 삭제, 수정이 편리)
	                        => MVC (자바따로, HTML따로) => 개발자 인원추가 => 개발속도 빨라짐
	                     
	2. application
	3. pageContext
	4. page / config(web.xml) / exception
	              
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>전체 버퍼 크기 왁인 : <%=out.getBufferSize() %> (16*1024)</h3>
	<h3>남아있는 버퍼 크기 : <%=out.getRemaining() %></h3>
	<h3>사용중인 버퍼 크기 : <%=out.getBufferSize()-out.getRemaining() %></h3>
	<br>
	<%
		out.print("<font color=red>Out(JspWriter)</font><br>");
		out.println("<font color=blue>Out(JspWriter)</font>");
		out.write("<font color=green>Out(JspWriter)</font>");
	%>
	<br>
	<%= "Out(JspWriter)"%><%-- out.print()로 변환 - 권장 --%>
	
</body>
</html>