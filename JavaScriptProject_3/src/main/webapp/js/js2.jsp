<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	객체 모델 - HTML 태그를 객체로
	          태그명 : 객체명
	          속성명 : 멤버변수
	          태그 선택 => 제어 => selector
	태그 제어 / CSS 적용
	  - document.querySelector() 태그를 가지고 옴
	    <a href> a:객체 href:변수
	    태그 1개 : Element, document.querySelector() id속성
	    태그 여러개 : Elements, document.querySelectorAll() class속성, 태그
	  - 내장 객체
	  - 브라우저 객체
	  - 라이브러리 jQuery
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=()=>{
		let h1=document.querySelectorAll('h1');
		console.log(typeof h1)
		for(let i=0;i<h1.length;i++){
			h1[i].style.backgroundColor='green';
		}
		
		let h2=document.querySelector("h2");
		h2.style.color='blue'
		
		let h1_1=document.getElementById('hh')
		h1_1.style.backgroundColor='pink';
	}
	/*
		351page
		문서객체 선택 : 태그를 가지고 오는 함수
		1개 선택
		  document.getElementById(아이디명) : 같은 아이디 사용시 자바스크립트 오류
		  querySelelctor(css선택자) : 태그명, 아이디, 클래스명, 후손자손, 속성
		여러개 선택 ex)배열, 라디오, 체크
		  document.getElementByClassName(class명)
		  document.querySelectorAll(css선태자)
	*/
</script>
</head>
<body>
	<h1>Hello JavaScript! -1</h1>
	<h2>Hello JavaScript!</h2>
	<h1 id="hh">Hello JavaScript! -2</h1>
</body>
</html>