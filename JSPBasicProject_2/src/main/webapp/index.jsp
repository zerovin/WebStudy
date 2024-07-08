<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	out.write("<html>");
	out.write("<head>");
	out.write("<link rel=\"stylesheet\" href=\"table.css\">");
	out.write("</head>");
	out.write("<body>");
	out.write("<center>");
	out.write("<form method=\"POST\" action=\"DataOutputServlet\">");
	/*
	 *  RestFul - 다른 프로그램과 연동
	 *  
	 *  method
	 *   - GET : SELECT
	 *   - POST : INSERT
	 *   ================== 웹에서는 주로 GET, POST 두가지 사용
	 *   - PUT : UPDATE
	 *   - DELETE : DELETE
	 *  => method 생략, 오타시 default = GET
	 *   
	 *  action : 입력된 데이터를 모아서 한번에 전송할 JSP/Servlet 지정
	 */
	out.write("<table class=\"table_content\" width=500>");
	out.write("<tr>");
	out.write("<th width=20% class=\"tdright\">이름</th>");
	out.write("<td width=80% ><input type=text name=name size=15></td>");
	out.write("</tr>");
	out.write("<tr>");
	out.write("<th width=20% class=\"tdright\">성별</th>");
	out.write("<td width=80% >");
	out.write("<input type=radio name=sex value=\"남자\" checked>남자");
	out.write("<input type=radio name=sex value=\"여자\">여자");
	out.write("</td>");
	out.write("</tr>");
	out.write("<tr>");
	out.write("<th width=20% class=\"tdright\">전화</th>");
	out.write("<td width=80% >");
	out.write("<select name=\"tel1\">");
	out.write("<option>010</option>");
	out.write("<option>011</option>");
	out.write("<option>012</option>");
	out.write("</select>");
	out.write("<input type=text name=tel2 size=15>");
	out.write("</td>");
	out.write("</tr>");
	out.write("<tr>");
	out.write("<th width=20% class=\"tdright\">소개</th>");
	out.write("<td width=80% ><textarea rows=5 cols=30></textarea></td>");
	out.write("</tr>");
	out.write("<tr>");
	out.write("<th width=20% class=\"tdright\">취미</th>");
	out.write("<td width=80% >");
	out.write("<input type=checkbox name=hobby value=\"낚시\">낚시");
	out.write("<input type=checkbox name=hobby value=\"여행\">여행");
	out.write("<input type=checkbox name=hobby value=\"영화\">영화");
	out.write("<input type=checkbox name=hobby value=\"게임\">게임");
	out.write("<input type=checkbox name=hobby value=\"등산\">등산");
	out.write("</td>");
	out.write("</tr>");
	out.write("<tr>");
	out.write("<td colspan=2 class=\"tdcenter\">");
	out.write("<button>전송</button>");
	out.write("</td>");
	out.write("</tr>");
	out.write("</table>");
	out.write("</form>");
	out.write("</center>");
	out.write("</body>");
	out.write("</html>");
%>