<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="table.css">
<title>Insert title here</title>
<style type="text/css">
	.table_content{
		margin:0px auto;
		width:800px;
	}
	h3{
		text-align:center;
	}
</style>
</head>
<body>
	<h3>자바 / HTML 분리 형식</h3>
	<table class="table_content">
		<tr>
			<td colspan="3">
				<pre>*** JSP에서 사용하고 있는 HTML은 out.write가 생략되어있다
public class basic_10_jsp extends HttpJspBase{
	&lt;%! %&gt; => 선언된 내용은 클래스 멤버로 사용
	public void _jspInit(){} => web.xml에 설정시 읽어간다
	public void _jspDestroy(){} => 화면이동, 새로고침시 메모리 회수
	public void _jspService(){
		&lt;% %&gt; => 영역에 소스
		&lt;%= %&gt; => out.print();
	}
}</pre>
			</td>
		</tr>
		<tr>
			<th width="20%">&lt;%! %&gt;</th>
			<td width="15%">선언문</td>
			<td width="65%">멤버변수, 메소드 제작영역 - JSP 클래스{}</td>
		</tr>
		<tr>
			<th width="20%">&lt;% %&gt;</th>
			<td width="15%">스크립트릿</td>
			<td width="65%">일반 자바소스(메소드 호출, 제어문, 연산자, 지역변수 선언) - _jspService()안에 첨부하는 소스</td>
		</tr>
		<tr>
			<th width="20%">&lt;%= %&gt;</th>
			<td width="15%">표현식</td>
			<td width="65%">out.print() - 자바변수, 메소드 출력시 사용</td>
		</tr>
		<tr>
			<th width="20%">&lt;%-- --%&gt;</th>
			<td width="15%">주석</td>
			<td width="65%">컴파일시 제외되는 영역 - 분석이 편리하게 하기 위해 작성</td>
		</tr>
	</table>
</body>
</html>