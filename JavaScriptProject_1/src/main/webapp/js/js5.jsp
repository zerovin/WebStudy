<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	논리 연산자 : &&, ||
	           (조건) && (조건) => 범위, 기간 포함
	           (조건) || (조건) => 범위, 기간 미포함
	           && 직렬 연산자 : 조건 두개가 동시에 true일 때 true 
	           || 병렬 연산자 : 조건 두개 중에 하나 이상이 true일 때 true
	           --------------------------------
	                            &&      ||
	           --------------------------------
	             true true     true    true
	           --------------------------------
	             true false    false   true
	           --------------------------------
	             false true    false   true
	           --------------------------------
	             false false   false   false
	           --------------------------------
	대입연산자
	  +
	  +=
	  -=
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*
 *  1. jQuery : $(function(){})
    2. VueJS : mounted()
    3. React : useEffect()
 */
 window.onload=function(){
   	//논리연산자
 	let i=(6>7) && (6===7)
 	console.log("i = "+i) //false
 	let j=(6<7) || (6===7) 
 	console.log("j = "+j) //true
 	
 	//대입연산자
 	let k=10;
   	
   	console.log("k = "+k) //10	
   	k+=20 //k=k+20
   	console.log("k = "+k) //30
   	k-=10 //k=k-10
   	console.log("k = "+k) //20
   	
   	let m=(6%2==0)?"짝수":"홀수" //if~else
   	console.log("m = "+m) //짝수
   	
   	let n=10/0
   	console.log("n = "+n) //Infinity : 0으로 나눈 경우 출력
   	
   	/*
   		Object : 배열 [] / 객체 {} => 값이 없는 경우 null
   		연산처리 에러 : NaN
   		0으로 나눈 경우 : Infinity
   		브라우저 안에 에러가 출력되지 않는다 => 개발자 도구에서 확인
   		변수 초기화가 안된 경우 : undefined
   		정수/정수=실수
   		HTML에 입력된 모든 값은 문자열, 형변환
   		  => String(변경할 데이터), Number(변경할 데이터), Boolean(변경할 데이터)
   		     Boolean 숫자 0, 0.0 => false / 나머지 true
   		             
   		
   		Ajax, Vue, React => 자바스크립트
   		 - 자바에서 데이터 전송
   		   자바스크립트는 오라클 연결X, 데이터를 읽을 수 없다
   		   대소문자 구분
    */
 }
</script>
</head>
<body>

</body>
</html>