<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	자바스크립트 객체 표현 JSON
	  형식) {키:값, 키:값...} VO
	       자바에서 전송시 자바스크립트가 인식하도록 변경해서 전송 => JSON
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=()=>{
		let sawon={
				"sabun":1,
				"name":"홍길동",
				"dept":"개발부"
		}
		document.write("사번 : "+sawon.sabun+"<br>")
		document.write("이름 : "+sawon.name+"<br>")
		document.write("부서 : "+sawon.dept+"<br>")
	}
</script>
</head>
<body>

</body>
</html>