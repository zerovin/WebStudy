<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	jquery
	1) 라이브러리 로드
	   <script src="http://code.jquery.com/jquery.js"> : 라이브러리가 충돌(동작X)
	2) 문법은 자바스크립트 사용
	   1. 변수 설정
	      - var 
	      - let
	      - const
	   2. 데이터형의 종류
	      - number => int, double
	      - string => String, char => '', ""
	      - boolean => true/false => 숫자 0, 0.0을 제외한 모든 수는 true
	      - object => [], {} => Array / Object
	                  {} - JSOM
	      - null => object의 주소가 없는 경우
	   3. 연산자
	      - 산술연산자, 논리연산자, 비교연산자, 대입연산자
	                 ---------------------------문자열/날짜/숫자 비교가능
	        + : 문자열 결합
	        / : 정수/정수=실수
	        === / !==
	        = / += / -=
	   4. 제어문
	      - if, if~else 조건문
	      - for
	        일반 for
	        for-each : for of, forEach(), map()
	   5. 배열
	      [] => object => 다른 데이터형을 섞어서 사용가능
	   6. 객체
	      {} => {키:값, 키:값...} => JSON***
	   7. 객체 모델 : 태그:객체, 속성:변수
	       태그 읽기 / 속성 변경 => Jquery, VueJS, ReactJS, NextJS
	       => 이벤트 발생
	          document.querySelector() => ${}, ${data} let[name,setName]
	   8. 자바스크립트에서 지원하는 라이브러리
	      Array - push(), slice(), pop()
	      String - trim(), indexOf(), substring(), concat()
	      Number - 형변환, parseInt()
	      Date
	      Math - round()
	      
	      브라우저 함수
	      window - open()
	      location - href
	      history - back, go()
	      document - write(), querySelector()
	        
	3) 태그 가지고 오기 :css selector
	   1. 태그명 - $('태그명')
	   2. 아이디명 - $('#아이디명')
	   3. 클래스명 - $('.클래스명')
	   4. 후손/자손 - $('태그명 태그명'), $('태그명 > 태그명')
	   5. 속성 선택자 - $('태그명[속성명=값]') 걑은 경우
	                 $('태그명[속성명*=값]') 포함
	                 $('태그명[속성명$=값]') 끝
	                 $('태그명[속성명^=값]') 시작
	   6. 가상 선택자 - $('태그명:nth-child(수열)')
	4) 제어하는 함수
	   1. 감추기 / 보여주기
	      태그명.style.display='' - show()
	      태그명.style.display='none' - hide()
	   2. <태그>값</태그>
	      $('태그').text() - getter
	      $('태그').text('값') - setter
	   3. <태그 속성="값"> => attr("속성명")
	   4. <input type="text"> => val()
	   5. html을 읽는 경우 => innerHTML => html()
	   6. append() : 태그를 추가할 때 사용
	5) 이벤트
	   - onclick => $('태그').click(function(){})
	                $('태그').on('click',function(){})
	   - onchange
	   - onkeydown
	   - onkeyup
	   - onmouseover => hover
	   - onmouseout => hover
	6) Ajax
	   - $.ajax({
	         type:'post/get',
	         url:'-.do', 
	         data:{id:id},
	         success:function(){
	            //정상수행
	         },
	         error:function(){
	            //오류발생
	         }
	     })
	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
	.container{
		margin-top:50px;
	}
	.row{
		margin:0px auto;
		width:600px;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#name').val('홍길동')
	//append
	//멀티 파일 업로드 
	let fileIndex=0 
	$('#addBtn').click(function(){
		$('#user-table').append( //태그를 여러개 생성
			'<tr id="m'+fileIndex+'">'
			+'<td width="30%">File '+(fileIndex+1)+'</td>'
			+'<td width="70%"><input type="file" size="20"></td>'
			+'</tr>'
		)
		fileIndex++
	})
	$('#removeBtn').on('click',function(){
		if(fileIndex>0){
			$('#m'+(fileIndex-1)).remove() //생성된 태그 지우기
			fileIndex--
		}
	})
})
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">파일 업로드</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td colspan="2" class="text-right">
						<input type="button" class="btn-xs btn-danger" value="add" id="addBtn">
						<input type="button" class="btn-xs btn-danger" value="remove" id="removeBtn">
					</td>
				</tr>
				<tr>
					<td width="20%">첨부파일</td>
					<td width="80%">
						<table class="table" id="user-table">
							
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" id="name" class="input-sm" size="20">
						<input type="button" class="btn-xs btn-danger" value="읽기" id="readBtn">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>