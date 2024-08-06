<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	자바스크립트 : 태그 제어, 이벤트 처리, 사용자 입력 제어, 동적페이지, 애니메이션
	            브라우저에서 제어(클라이언트)
	자바스크립트 사용방법
	1) 내부 스크립트 : 한개의 파일에서만 제어
	   <head>
	      <script type="text/javascript"
	         함수
	         window.onload=function(){}
	      </script>
	   </head>
	2) 외부 스크립트 <body>안에도 가능, 일반적으로 <head> : 전체 파일에 적용 => 라이브러리 => cdn
	   <head>
	      <script type="" src="파일경로/URL"></script>
	   </head>
	3) 인라인 스크립트 : 태그만 제어
	   <a href="javascript:함수호출">
	   
	=> jquery / vue / react / next - 자바스크립트 라이브러리 (자바스크립트로 처리)
	   mybatis / jpa / spring - 자바 라이브러리 (자바 적용)
	  
	자바스크립트 변수선언 - 값 적용에 따라 데이터형을 자동으로 설정
	- let : scope를 명확하게 만들어 준다
	        사용범위가 명확
	        ES6
	- var : scope가 명확하지 않다
	        메모리가 남아있다 (메모리 누수현상)
	        ES5
	- const : 상수형 변수
	          자바에서 데이터 전송 (JSON)
	          
	자바스크립트에서 사용하는 데이터형
	- number : 숫자형 => int, double
	- string : 문자형 => char, string => '', ""
	- boolean : true/false => 숫자도 가능 0, 0.0을 제외한 모든 숫자는 true
	- array : 배열 [] Object단위 => 데이터 섞어서 사용가능
	- object : 객체 {} => {키:값, 키:값...} => JSON
	- undefined : 변수에 값이 없는 경우(초기화가 없는 상태)
	- function : 함수 => 매개변수로 사용가능 => Callback 시스템에 의해 자동호출
	             ex) map(function(){}), forEach(function(){}), $().click(function(){})
	=> 데이터형 확인 - typeof 변수명
	
	연산자
	- 산술연산자 : +, -, *, /, %
	            +는 문자열 결합가능
	            % 정수/정수=실수
	- 단항연산자 : ++, --
	- 비교연산자 : ===, !==, <, >, <=, >= 숫자,문자,날짜 비교가능
	- 논리연산자 : &&, ||, ! 숫자,문자,날짜 비교가능
	- 대입연산자 : =, +=, -= 
	- 형변환연산자 : HTML에서 읽어오는 모든 데이터는 문자열
	             숫자변환 : Number(""), parseInt("")
	             문자변환 : String()
	             논리변환 : Boolean("true") = Boolean(1)
	             
	제어문
	- 조건문 : if, if~else
	- 반복문 : for - 일반 for
	         for of - map(), forEach()
	- 반복제어 : break
	
	배열 : []
	객체 : {}
	Restful - 다른 프로그램과 연동
	          자바 VO/List <=> 자바스크립트 연동 {}, [] => JSON, JSONP, 클로저, 호이스팅
	          
	함수
	- function 함수명(매개변수...){}
	- let 함수명=function(){}
	- let 함수명()=>{} vue/react
	  ex) useEffect(){
	         이벤트 설정
	         function 함수명(매개변수){} => 오류
	         let 함수형=()=>{} => 사용가능
	      } 
	  
	자바스크립트에서 지원하는 기본 객체
	- String : 문자열
	  - substring(시작인덱스, 끝인덱스-1) : 문자열을 자르는 경우, 인덱스 0번부터 시작
	  - indexOf() : 찾기
	  - length() : 길이
	  - split() : 분리 []
	  - trim() : 공백 제거
	- Number : 숫자, 형변환시 자주 사용
	  - NaN : 연산처리가 안 된 경우
	- Array : 배열
	  - map() : for
	  - push() : 배열에 값 추가
	  - pop() : 배열 마지막 값 제거
	  - slice(start, end) : 새로운 배열 생성
	  - ... : 배열 그대로 복사
	          ex) [1,2,3,4,5]
	              [...,6,7,8] => [1,2,3,4,5,6,7,8]
	- Math : 수학
	  - ceil() : 올림
	  - round() : 반올림
	  - random() : 난수
	- Date : 날짜
	  - getFullYear() : 년
	  - getMonth() : 월
	  - getDate() : 일
	  - getDay() : 요일
	  
	브라우저 객체
	                     window : 브라우저 제어 => open(), close(), scrollbar
	                        |
	        ----------------------------------
	        |          |          |          |
	     location   document   history     event
	      화면이동     화면제어     기록정보     이벤트처리
	      href       write      back()    function aaa(event){}
	            querySelector()  go()
	            
	라이브러리
	- jquery : 단순하게 만든 라이브러리, 사용빈도가 많아지면서 라이브러리 크기가 커짐 => 속도저하
	         - 대부분 브라우저에서만 사용가능, 호환성좋음
	         - HTML (DOM = 트리형태)을 쉽게 조작 가능
	         - 간단하게 css 적용가능
	           ex) let a=document.querySelector('a')
	               => 자바스크립트 a.style.background='red'
	                  제이쿼리 $('a').css('background','red')                   
	         - 오픈소스 : 사용이 자유롭다 => 이전 개발 유지보수
	         - 속도가 늦다 => 가상돔(가상메모리) vue/react
	         - 문법 형식
	           - 자바스크립트
	             main : window.onload=function(){}
	           - Jquery
	             main : $(function(){}), $(document).ready(function(){})
	           - Vue3
	             main : new Vue({
	                       mounted:function(){}
	                    })
	           - React
	             main : class Main extends Component{
	                       componenetDidMount(){}    
	                    }
	                    => HOOKS
	                       function main(){
	                          useEffect(()=>{
	                           
	                          })
	                       }
	           - React-Query : 서버연결*****
	          
	제이쿼리 : 태그를 제어하는 프로그램
	         값, 속성, css, 이벤트 제어
	         $('태그명').처리
	         $('아이디명').처리
	- 값 읽기 (태그)
	  - val() / val(값) : input, select, textarea
	  - text() / text(값) : 모든태그 <태그>값설정</태그> 문자열
	  - html() / html(값) : HTML 적용 => 단일
	  - append(값) : 여러개 동시에 추가
	- 제어 (이벤트)
	  - click
	  - change
	  - hover
	  - keyup
	  - keydown
	- Ajax
	  - 브라우저 : 모든 브라우저에 HttpXMLRequest가 존재, 서버연결/서버응답
	             ex) if(httpRequest.readyState==4){
	                    if(httpRequest.status==200){
	                    
	                    }
	                 }
	                 => success:function(){}
	                 ===> $.ajax({
	                          type:, => get/post
	                          url:, => 실행할 jsp 지정
	                          data:, => {키:값}
	                          success:function(){
	                             //정상수행
	                          }, 
	                          error:function(e){
	                             //서버에서 오류발생
	                          }
	                      })
	                 ===> axios.get('url',{
	                         params:{
	                            키:값
	                         }
	                      }).then(res=>{
	                         //결과값 받기
	                      })
	                      axios.post({})
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>