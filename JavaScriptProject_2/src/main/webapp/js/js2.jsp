<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	함수 / 배열함수 / 객체모델 / 객체지향 / Jquery
	
	함수/메소드
	 - 차이점 : 메소드 - 클래스 종속(클래스 안에서만 사용)
	          함수 - 독립적으로 사용가능
	 - 공통점 : 기능처리, 반복제거, 재사용, 구조적 프로그램
	 
	익명의 함수 - Callback : 시스템에 의해 자동으로 호출되는 함수
	           함수 변수형 처리
	           function(){처리)
	            ex) window.onload=function(){}
	                map(function(){})
	                forEach(function(){}) 
	선언적 함수 - function 함수명(매개변수){처리기능}
	
	함수 구성요소
	  - 선언부 : 함수명, 매개변수 => 리턴형은 작성하지 않는다, 리턴은 가능
	  - 구현부 : { 변수(지역변수), 연산처리, 제어문 }
	  
	선언적 함수 종류
	  - 리턴형(하나만)  매개변수(여러개사용가능)
	      O            O   => function login(id, pwd){return result}
	      O            X   => function func_name(){return 결과값}
	      X            O   => function func_name(매개변수){}
	      X            X   => function func_name(){}
	익명의 함수 - 변수선언 => function을 데이터형으로 취급 => 매개변수로 함수 지정가능
	
	선언적 함수
	  function calc(x, y){
	     return x+y
	  }
	  => 호출 calc(10, 20)
	익명의 함수
	  let calc=function(x, y){
	              return x+y
	           }
	   => 호출 calc(10, 20)
	  let calc=(x, y)=>x+y ===> 권장사항
	   => 호출 calc(10, 20)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function plus1(a, b){	
		return a+b
	}
	let plus2=function(a, b){
		return a+b		
	}
	let plus3=(a, b)=>{return a+b}
	let plus4=(a, b)=>a+b
	// 화살표함수 - function, return을 생략할 경우 주로 사용, 람다식 => 함수포인터 이용(C언어, C++)
	window.onload=function(){ //main => 사용자 요청 
		let a=10;
		let b=20;
		let c=plus1(a,b)
		let d=plus2(a,b)
		let e=plus3(a,b)
		let f=plus4(a,b)
		
		document.write("c = "+c+", "+typeof plus1+"<br>")
		document.write("d = "+d+", "+typeof plus2+"<br>")
		document.write("e = "+e+", "+typeof plus3+"<br>")
		document.write("f = "+f+", "+typeof plus4+"<br>")
	}
</script>
</head>
<body>

</body>
</html>