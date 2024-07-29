<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	if~else : true와 false를 나눠서 처리
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	//화면에 HTML이 실행되면 수행하는 함수 : 리턴형 사용X, 매개변수에 데이터형 사용X
	//function login(let id, let pwd) => 요류
	//function login(id, pwd) => 정상작동
	
	/*
	let a=prompt("정수 입력 : ") //입력값을 받는 경우
	console.log("a = "+a)
	if(a%2==0){
		document.write(a+" => 짝수입니다")
	}else{
		document.write(a+" => 홀수입니다")
	}
	*/
	
	let user=prompt("ID 입력 : ")
	if(user==='admin'){
		document.write("관리자로 입장")
	}else{
		document.write("일반사용자로 입장")
	}
}
</script>
</head>
<body>

</body>
</html>