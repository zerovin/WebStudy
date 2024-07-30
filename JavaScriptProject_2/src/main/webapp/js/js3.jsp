<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	매개변수 - function형도 매개변수로 사용가능 => Callback
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	let callback=function(){
		document.write("함수 호출 <br>")
	}
	function func(call){
		for(let i=1;i<=10;i++){
			call();
		}
	}
	window.onload=function(){
		func(callback);
		//setTimer() - 원하는 시간에 출력 ex)회원가입->완료페이지->main
		//setInterval() - 원하는 시간마다 출력 ex)실시간 데이터 갱신
	}
</script>
</head>
<body>

</body>
</html>