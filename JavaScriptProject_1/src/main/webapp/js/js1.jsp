<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	자바스크립트 : 브라우저 자체에서 처리, 서버처리X
	           브라우저에서 동적 페이지 작성 => 이벤트 HTML/CSS(정적페이지)
	- 역할(웹 사이트)
	   1) HTML/CSS => 화면UI
	   2) 자바스크립트 => 화면에 대한 동적 처리 => 오라클 연결 가능(서버측 사이드 => NodeJS)
	                   HTML/CSS 제어 => 유효성 검사(사용자입력), 동적 화면
	                  1. 사용법
	                     - 내부 스크립트 : 한개의 파일에서만 작업
	                       <script type=""> </script>
	                     - 외부 스크립트 : 여러개 파일에 적용 => .js
	                       파일로 제작
	                       <script type="" src="파일명 지정"> => import
	                     - 인라인 스크립트 : 태그 한개를 제어
	                       <input type="button" onclick="javascript:history.back()">
	                  2. 버전
	                     - ES5
	                         var : 변수 => 자동지정변수 => 데이터형을 사용하지 않는다
	                               Scope(사용범위)가 명확하지 않다, 메모리 누수현상
	                     - ES6
	                         let : 변수 => 자동지정변수 => 데이터형을 사용하지 않는다
	                                var 단점 보완 => 사용범위 명확 {}안에서만 사용가능 => 메모리 해제
	                         const : 상수형 변수 => 값을 변경불가
	                         람다식 : ()=>{} 화살표함수
	                                 function func_name(매개변수){}
	                                  ==> let func_name=function(){}
	                                      let func_name()=>{} (권장)
	                                      function, return 생략시 주로 사용
	                         같다 : == => === , ==(경고)
	                               VueJS/ReactJS 반드시 ===
	                         문장 종료시 ; => ;생략 => 들여쓰기
	                                  코틀린, 파이썬, 스칼라 - ; 생략
	                         자바스크립트, 자바 라이브러리가 일정부분 유사
	                           trim(), substring(), indexOf()...String/Number/Date
	                         로직은 거의 없고 처리 위주 cookie, session, thread, sqlite => 자바로 사용
	                           cookie : VueJS/ReactJS => 서버와 다르게 설정
	                         대소문자 구분
	                         이클립스에서 어시스트 X => 암기 후 사용
	                         절차적 언어 => 에러출력X
	   3) 자바 => 데이터를 관리 
	   4) 오라클 => 데이터를 저장하는 공간
	   
	1. 변수 설정
	   - 데이터형을 사용하지 않는다, 자동지정변수 사용
	   - 전역변수, 지역변수 사용가능
	     <script type="">
	        변수선언 => 전역변수
	        function aaa(){
	           변수선언 => 지역변수
	        }
	     </script>
	     1) 변수설정은 초기값에 따라 자동으로 데이터형 지정
	        - number : 실수, 정수
	        - string : 문자, 문자열 => '', ""
	        - object : 배열, 객체
	        - boolean : true/false => 숫자가능
	                    0/0.0이 아닌 모든 수는 true
	        - function : 함수도 데이터형으로 취급
	        - undefined : 변수에 값이 없는 상태
	        - NaN : 연산이 안되는 경우
	        - null : 배열, 객체에 값이 없는 경우
	        ex) let i=10 ==> i:number => int
	            let i=10.5 ==> i:number => double
	            let i='A' ==> i:string
	            let i="A" ==> i:string
	            let i=["a","b","c"...] ==> i:object ==> [] 배열
	                  [1, 2, "aaa", true] => 모든 데이터형을 배열로 설정가능
	                  자바 => Object[]
	            let i={"name":"홍길동","age":20...} => 객체 ==> i:object
	                  {멤버변수:값, 멤버변수:값...} => i.name, i.age => JSON 자바스크립트객체표현법
	            let i=true ==> i:boolean
	            let i=function(){} ==> i:function 매개변수로 사용가능 => Callback 함수 => jQuery
	   - 브라우저에 출력
	     document.write() => System.out.print()
	       \n => <br>
	     innerHTML : 태그 안에 데이터 첨부
	     alert() : 모달창 띄우는 경우
	   - 도스창에 출력
	     console.log()
	   - 브라우저에 HTML이 출력이 된 상태
	      자바 : main()
	      자바스크립트 : window.onload=function(){}
	      jQuery : $(function(){})
	      VueJS : mounted()
	      React : useEffect()
	2. 연산자
	3. 제어문
	4. 함수
	5. 라이브러리(내장함수)
	6. 객체지향 => DOM
	
	자바스크립트 라이브러리
	1) jQuery (Ajax)
	2) VueJS
	3) ReactJS
	4) NextJS / NodeJS
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//내부스크립트
	/* 주석 처리 */
	window.onload=function(){
		//1. 변수 설정 => 데이터형 확인
		let a=10
		let b=10.5
		let c="ABC"
		let d='DEF'
		let e=true
		let f=[1,2,3,4,5]
		let g={"name":"홍길동","age":'25'}
		//typeof
		document.write(a+" : "+typeof a+"<br>") //number
		document.write(b+" : "+typeof b+"<br>") //number
		document.write(c+" : "+typeof c+"<br>") //string
		document.write(d+" : "+typeof d+"<br>") //string
		document.write(e+" : "+typeof e+"<br>") //boolean
		document.write(f+" : "+typeof f+"<br>") //object
		document.write(g+" : "+typeof g+"<br>") //object
		
		//데이터형 변경
		a="abcdefg";
		document.write(a+" : "+typeof a+"<br>") //string
		//변수값 변경시 데이터형 자동변경
	}
</script>
</head>
<body>

</body>
</html>