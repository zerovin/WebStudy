<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSON : JavaScript Object Notation
	       자바스크립트 객체 표현법
	     - 자바 ==JSON==> JSON 데이터를 자바스크립트로 전송
	       - 웹 - 자바스크립트
	         모바일 - 코틀린
	     - key, value 구성(map) => key는 중복 불가
	       라이브러리 주요 사용 => json-simple(google), jackson(boot에 자동첨부)
	       데이터를 JSON으로 받아 출력 - ajax, vue, react, next
	     - 목적 : 클라이언트와 서버의 데이터 교환 목적 (XML(annotation) => JSON)
	       요청값 전송
	       - ajax - data:{id:'aaa',pwd:'1234'}
	       - axios - params:{id:'aaa',pwd:'1234') => react-query, vue3
	       응답 받기
	       - parser : 데이터를 HTML을 이용해서 출력
	       - 서버에서는 JSON을 문자열 형식으로 보냄
	         => 자바스크림트 : JSON.parse() JSON으로 변경
	     - 형식 {"sabun":1, "name":"홍길동", "dept":"개발부"}
	           {"sabun":1, "name":"홍길동"}
	           {"name":"홍길동", "dept":"개발부"} => 동일하지 않을 수 있다
	       
	       
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let info={name:"홍길동",age:20,sex:"남자"}
	let data=JSON.stringify(info) //JSON => 문자열로 변환
	console.log(data)
	let change=JSON.parse(data) //문자열 => JSON으로 변환
	console.log(change)
}
</script>
</head>
<body>

</body>
</html>