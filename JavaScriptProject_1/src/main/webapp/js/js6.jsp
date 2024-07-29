<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%---
	제어문
	  - 조건문
	    - 단일 조건문
	       형식) if(조건문){ => 조건문 : 논리연산자, 비교연산자, 부정연산자 => true/false
	               조건문이 true일 때 수행하는 문장
	            }
	    - 선택 조건문
	       형식) if(조건문){
	               조건이 true일 때 처리하는 문장
	            }else{
	               조건이 false일 때 처리하는 문장
	            }
	    - 다중 조건문 => 회원가입, 글쓰기 유효성검사
	       형식) if(조건문){
	       	       조건이 true일 때 수행하는 문장 => 종료
	       	       조건이 false일 때 아래 조건문으로 이동
	            }else if(조건문){
	               조건이 true일 때 수행하는 문장 => 종료
	       	       조건이 false일 때 아래로 이동
	            }else{
	            	필요시에만 사용(생락가능)
	            	조건에 해당되는 애용이 없는 경우 처리 => default
	            }
	  - 선택문
	    - switch ~ case
	      형식) switch(숫자, 문자){
	              case 값:
	                처리문장
	                break;
	              case 값:
	                처리문장
	                break;
	              default : 해당 case가 없는 경우 처리 => 생략가능
	           }
	  - 반복문
	    - while => 반복횟수가 없는 경우
	               ex) 무한 스크롤
	      형식) 초기값 ---------- 1
	           while(조건문){ -- 2
	              반복수행문장 --- 3
	              증감식 ------- 4
	           }
	           1 -> 2 -> 3 -> 4 -> 2 -> 3 -> 4 => false면 종료
	    - do ~ while
	    - for => 반복횟수가 있는 경우
	       - 일반 for 
	                    1    2    4
	         형식) for(초기값;조건식;증감식){
	                 반복수행문장 3
	              }
	               1 -> 2 -> 3 -> 4 -> 2 -> 3 -> 4 => false면 종료
	       - for in (인덱스번호)
	         형식) for(변수 in 배열)
	              배열의 인덱스 번호를 가지고 온다 => 0번부터 시작
	       - for of (for-each)
	         형식) for(변수 of 배열)
	              변수는 배열에 저장된 값을 읽어 온다 ex)for(int a:arr)
	       - 함수
	          - forEach()
	            배열.forEach(function(변수){처리})
	            배열에서 값을 1개씩 자동으로 읽어온다
	          - map()
	            배열.map(function(변수)(처리))
	            배열에서 값을 1개씩 읽어온다
	            배열.map((변수)=>{})
	  - 반복제어문
	    - break : 반복문을 중단할 때 사용
	    - continue
	 - if / for => 데이터를 자바에 전송 => 전송값 제어
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//window.onload=function(){}
window.onload=()=>{
	let a=10
	if(a%2==0){
		//document.write(a+"는(은) 짝수입니다");
	}
}
function login(){
	let id=document.getElementById('id').value
	if(id.trim()===""){
		alert("아이디를 입력하세요")
	}
}
</script>
</head>
<body>
	ID : <input type="text" size="10"id="id" >
	<input type="button" value="login" onclick="login()">
</body>
</html>