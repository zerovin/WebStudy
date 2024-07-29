<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. 자바스크립트에서 태그를 제어하는 메소드 (읽기/쓰기)
	   태그 => 구분자가 존재 (id, name, class)
	   
	   태그에 id 속성이 있는 경우
	     - document.getElementById("아이디")
	   태그에 class 속성이 있는 경우
	     - document.getElementByClassName("클래스명")
	   태그에 name 속성이 있는 경우
	     - document.getElementByName("name값")
	   태그명으로 읽는 경우
	     - document.getElementByTagName("태그명")
	   혼합 - 가장 많이 사용되는 메소드
	     - document.querySelector("css선택자")
	       id : #
	       class : .
	       tag : 태그명
	   ===> 자바스크립트는 태그(DOM)를 제어하는 프로그램 => DOMScript
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
		width:350px;
	}
	h3{
		text-align:center;
	}
</style>
<script type="text/javascript">
	function result(){
		//서버에 전송하지 않고 브라우저 자체 처리 => 자바스크립트
		//사용자가 입력한 값을 받는다
		let kor=document.getElementById("kor").value;
		let eng=document.getElementById("eng").value;
		let math=document.getElementById("math").value;
		
		//HTML에서 받은 모든 데이터는 string
		//정수로 변환 Number(), parseInt()
		let total=parseInt(kor)+parseInt(eng)+parseInt(math);
		document.getElementById("total").value=total;
		let avg=total/3;
		document.getElementById("avg").value=Math.round(avg);
		
		//다중 조건문
		let score='A';
		/*
		if(avg>=90){
			score='A'
		}else if(avg>=80){
			score='B'
		}else if(avg>=70){
			score='c'
		}else if(avg>=60){
			score='D'
		}else{
			score='F'
		}
		*/
		switch(Math.round(avg/10)){
			case 10:
			case 9:
				score='A';
				break;
			case 8:
				score='B';
				break;
			case 7:
				score='C';
				break;
			case 6:
				score='D';
				break;
			default : 
				score='F';
		}
		document.getElementById("score").value=score;
	}
</script>
</head>
<body>
	<div class="container">
		<h3>점수 입력</h3>
		<div class="row">
			<table class="table">
				<tr>
					<th class="text-center" width="25%">국어</th>
					<td width="75%"><input type="text" size="15" id="kor" class="input-sm"></td>
				</tr>
				<tr>
					<th class="text-center" width="25%">영어</th>
					<td width="75%"><input type="text" size="15" id="eng" class="input-sm"></td>
				</tr>
				<tr>
					<th class="text-center" width="25%">수학</th>
					<td width="75%"><input type="text" size="15" id="math" class="input-sm"></td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<input type="button" value="성적처리" class="btn-sm btn-danger" onclick="result()">
					</td>
				</tr>
			</table>
		</div>
		<div style="height: 10px"></div>
		<h3>성적 결과</h3>
		<div class="row">
			<table class="table">
				<tr>
					<th class="text-center" width="25%">총점</th>
					<td width="75%"><input type="text" size="15" id="total" class="input-sm" readonly></td>
				</tr>
				<tr>
					<th class="text-center" width="25%">평균</th>
					<td width="75%"><input type="text" size="15" id="avg" class="input-sm" readonly></td>
				</tr>
				<tr>
					<th class="text-center" width="25%">학점</th>
					<td width="75%"><input type="text" size="15" id="score" class="input-sm" readonly></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>