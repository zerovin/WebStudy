<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	비교연산자
	 === 같다 (==)
	 !== 같지 않다 (!=)
	 < 작다
	 > 크다
	 <= 작거나 같다
	 >= 크거나 같다
	 
	 1) 출력할 데이터 => 오라클 => 자바스크립트에서 연결 불가능
	    HTML --- 자바 --- 오라클 --- 자바 --- 자바스크립트
	    자바-자바스크립트 호환 불가 => XML, JSON 사용
	    AJAX (Async JavaScript And XML) : 자바스크립트로 xml제어, xml=>JSON으로 대체
	    => VO {}, List []
	       다른 프로그램과 연동 : RestFul (GET/POST/PUT/DELETE)
	 2) 비교연산자 : 자바(숫자), 자바스크립트(문자열, 날짜 비교 가능)
	              유효성 검사 : 사용자가 입력시 처리
	    문자열 비교 - 한글 : 가나다라
	               알파벳 : ABCD
	 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let a=10
	let b=5
	console.log("a===b : "+(a===b)) //false => boolean으로 출력
	console.log("a!==b : "+(a!==b)) //true
	console.log("a<b : "+(a<b)) //false
	console.log("a>b : "+(a>b)) //true
	console.log("a<=b : "+(a<=b)) //false
	console.log("a>=b : "+(a>=b)) //true
	
	let c="Hello"
	let d="JavaScript"
	console.log("c===d : "+(c===d)) //false => boolean으로 출력
	console.log("c!==d : "+(c!==d)) //true
	console.log("c<d : "+(c<d)) //true
	console.log("c>d : "+(c>d)) //false
	console.log("c<=d : "+(c<=d)) //true
	console.log("c>=d : "+(c>=d)) //false
}
function send(){
	let frm=document.frm
	if(frm.id.value===""){
		alert("아이디를 입력하세요")
		return
	}
	else if(frm.pwd.value===""){
		alert("비밀번호를 입력하세요")
		return
	}
	alert("ID : "+frm.id.value+"\n"+"Password : "+frm.pwd.value)
}
</script>
</head>
<body>
	<form name="frm">
		ID : <input type="text" name="id" size="10"><br>
		PW : <input type="password" name="pwd" size="10"><br>
		<input type="button" value="전송" onclick="send()">
	</form>
</body>
</html>