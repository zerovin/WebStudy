<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	Jquery : 자바스크립트 라이브러리
	1. 라이브러리 다운로드 / 원격
	   원격 <script type="text/javascript" src="http://code.jquery.com/jquery.js">
	    ***jquery 충돌 되면 안됨 => 라이브러리 계속 읽기X
	    ***라이브러리, css는 main.jsp
	2. jquery의 시작
	   자바스크립트의 시작 - window.onload=function(){}
	   제이쿼리 - $(function(){소스코딩})
	          - $(document).ready(function(){소스코딩})
	3. jquery의 함수 => $ = document.querySelector
	                  $('h1') = document.querySelector("h1") 태그
	                  $('#id') = document.querySelector("#id") 아이디
	                  $('.id') = document.querySelector(".id") 클래스
	                  기타 - 속성선택자, 자손, 후손, 가상선택자 => css 선택자와 동일
	4. jquery 내장객체 => window, document, location, history
	                    $(window), $(document), $(location), $(history)
	5. 이벤트 처리 / 유효성 검사 / 다른 파일의 데이터 읽기 Ajax
	   1) 이벤트
	      - EventListener
	        $().on('이벤트명',function(){})
	        $().on('이벤트명',()=>{})
	          => 이벤트명 - click, keyup, hover, keydown...
	      - 일반 이벤트
	        $().click(function(){})
	        $().keyup(function(){})
	6. jquery에서 지원하는 함수
	   1) getter - 태그의 값을 읽을 때 사용
	      setter - 태그에 값을 설정할 때 사용
	      - 입력하는 창 : <input type=text..> <textarea> <select>
	                   => $().val() getter => value값 반환
	                   => $().val(값) setter => value값 설정
	      - 태그 안의 값 : <td> </td>
	                    => $('td').text() getter => 값 읽기
	                    => $('td').text("Hello") setter
	      - 속성 값 : <a href="">
	                => $('a').attr('href') getter => 속성 href의 값 읽기
	                => $('a').attr("href","값") setter => 속성 href에 값 설정
	      - 태그 : html(), html(값) => innerHTML => 1개만 생성
	      - 추가 : append() => creatElement() => 여러개 생성
	      - CSS 적용 : css("속성","값")
	                  css({"속성":"값", "속성":"값"...})
	                  css가 가지고 있는 속성 사용
	                  '-' 하이픈 대신 대문자 사용 marginTop, backgroundColor
	- jquery UI => 효과
	- Ajax
	
	Jquery는 DOMScript : 태그를 제어하는 프로그램
	                    라이브러리가 무겁다 => 서버 속도가 늦어진다 => React, Vue
	                       
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
//window.onload=function(){}
$(function(){
	//setter => val("값") <input>, <select>, <textarea>
	$('#name').val("홍길동") // 값 추가 => 수정, 자동 로그인
	
	//이벤트 처리
	$('button').on('click',function(){
		let addr=$('#addr').val() //입력값 읽기 => 로그인
		alert(addr)
	})
})
</script>
</head>
<body>
	<input type="text" id="name" size="15"><br>
	<input type="text" id="addr" size="15">
	<button>클릭</button>
</body>
</html>