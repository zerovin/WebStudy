<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	for-each
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	//for-each => 배열
	//배열 = 같은 데이터형을 모아서 한개의 이름으로 제어 => index번호를 이용해서 처리, 0부터 시작
	//자바 배열:{}, 자바스크립트 배열:[]
	const names=["홍길동", "심청이", "박문수", "이순신", "춘향이"];
	const gender=["남자", "여자", "남자", "남자", "여자"]
	document.write(names[0]+"<br>")
	document.write(names[1]+"<br>")
	document.write(names[2]+"<br>")
	document.write(names[3]+"<br>")
	document.write(names[4]+"<br>")
	
	//배열의 장점 - 순차적으로 인덱스 배정 => for
	document.write("<h1>for-each(for of => 배열 하나만 사용가능)</h1>")
	// 배열에 저장된 실제 데이터 읽기
	for(let name of names){ //for(변수 of 배열명)
		document.write(name+"<br>")
	}
	
	document.write("<h1>for-each(for in => 배열 두개이상 사용가능)</h1>")
	//배열에 저장된 인덱스번호 읽기
	for(let i in names){
		document.write(names[i]+"("+gender[i]+")<br>")
	}
	
	//자바스크립트에서 지원하는 for-each 함수 : forEach / map => Ajax, Vue, React에서 주로 사용
	document.write("<h1>forEach 함수 1</h1>")
	//배열명.forEach(function(name){})
	names.forEach(function(name){
		document.write(name+"<br>")
	})
	
	document.write("<h1>forEach 함수 2</h1>")
	//배열명.forEach((name)=>{}) => 람다식(함수 포인터: => 화살표함수)
	names.forEach((name)=>{
		document.write(name+"<br>")
	})
	
	document.write("<h1>map 함수 1</h1>")
	//배열명.map(function(name){})
	names.map(function(name){
		document.write(name+"<br>")
	})
	
	document.write("<h1>map 함수 2</h1>")
	//배열명.map((name)=>{}) => 람다식(함수 포인터: => 화살표함수)
	names.map((name)=>{
		document.write(name+"<br>")
	})
}
</script>
</head>
<body>

</body>
</html>