<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	<% 
		주석 => 자바문법 그대로
		// : 한줄 주석
		/* */ : 여러줄 주석
		; : 문장종료
	%>
	<%! 
		주석 => 자바문법 그대로
		// : 한줄 주석
		/* */ : 여러줄 주석
		; : 문장종료
		out.print() => 괄호안에 들어가는 내용 <%= %>
	%>
 --%>
<%!
	//선언문, 메소드 생성 => 노출이되기때문에 거의 사용X
	//따로 믈래스를 직접 만들어서 사용 => DAO
	public int add(int a, int b){
		return a+b;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int res=add(10, 20);
		out.print(res); //서블릿 => 복잡한 자바코딩이 있는 경우, %코드 반복해서 여닫을때 
	%>
	<%=res %> <%-- JSP코드 권장 --%>
	<%-- 
		<% %> 안에 <% %> or <%= %> 사용 불가
		
		ex) %를 많이 써야하는 경우 out.print() 사용
		  <%
		  	if(){
		  %>
		  <%
		  	}else if() {
		  %>
		  <%
		  	}else if(){
		  %>
		  <%
		  	}else{
		  %>
		  <%
		  	}
		  %>
	 --%>
</body>
</html>