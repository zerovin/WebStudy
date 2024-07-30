<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	자바스크립트 : HTML/CSS(정적페이지)로 구성된 웹페이지를 동적으로 만들어주는 언어
	           서버와 관련없이 브라우저에서 동적으로 변경 => 이미지변경/이벤트발생
	           프론트 개발 대표 프로그램
	           라이브러리 - Jquery, Ajax, VueJS, ReactJS, NextJS
	                     자바스크립트의 basic은 사용
	           프로그램 언어 형식 - 데이터 저장
	                            1) 변수 : 한개의 데이터 저장
	                                     - var : 사용범위가 명확하지 않음
	                                             메모리 해제가 안됨 => 메모리 누수현상 ES5
	                                     - let : var 보완
	                                             {}이 종료되면 자동으로 메모리 회수
	                                             사용범위가 명확 ES6
	                                     - const : 상수형
	                                               변경하지 않는 값
	                                               자바에서 데이터를 전송하면 받는 변수
	                                  ***자동지정변수
	                                     자바스크립트에서 사용하는 데이터형
	                                     - number : 숫자(정수, 실수)
	                                     - string : 문자, 문자열 '', ""
	                                     - boolean : true/false
	                                                 0, 0.0외의 모든 숫자는 true
	                                     - object
	                                       - [] Array : 다른 데이터형끼리도 같은 배열 가능
	                                       - {} 객체 : JSON 자바->자바스크립트로 전송
	                                                  {키:값, 키:값...}
	                                                  키를 멤버변수로 인식(사용자 정의)
	                                     ex) let 변수명=10 => int
	                                         let 변수명=10.5 => double
	                                         let 변수명='ㅁㅁㅁ' => string
	                                         let 변수명="ㅁㅁㅁ" => string
	                                         let 변수명={} => 객체형
	                                         let 변수명=[] => 배열인식
	                                         let 변수명 =true/false => boolean
	                                   
	                            2) 배열 : 여러개 데이터 저장
	                                     []
	                            3) 객체 : 한개에 대한 정보를 한번에 저장
	                                     {}
	                                     class class_name{}
	                         - 관리
	                         - 제어
	                            1) 조건문
	                               - 단일 조건문
	                                   if(조건문){ => 비교연산자, 논리연산자, 부정연산자
	                                      실행문장 => 조건이 true일 때 사용
	                                   }
	                               - 선택 조건문
	                                   if(조건문){
	                                      조건 true일 때 수행
	                                   }else{
	                                      조건 false일 때 수행
	                                   }
	                               - 다중 조건문 : 조건에 맞는 문장 하나만 수행
	                                   if(조건문){
	                                      조건 true면 수행 후 종료
	                                      조건 false면 아래 조건으로 이동
	                                   }else if(조건문){
	                                      조건 true면 수행 후 종료
	                                      조건 false면 아래 조건으로 이동
	                                   }else{
	                                      해당 조건이 없는 경우 수행
	                                      생략가능
	                                   }
	                            2) 반복문 - 자바에서 데이터 전송, 자바스크립트가 출력
	                               - for(초기값;조건식;증감식){
	                                    반복 수행 문장
	                                 }
	                               - for(변수 of 배열){
	                                    for-each
	                                 }
	                               - 라이브러리
	                                 - 배열명.forEach(function(변수){})
	                                                         ---- Callback - 배열에서 값을 하나씩 읽어서 매개변수로 전송
	                                 - 배열명.map(function(변수){}) => 가장 많이 사용되는 반복문
	                                   => Ajax, Vue, React
	                            3) 반복 제어
	                               - break : 반복문 종료
	                         - 연산
	                            1) 단항연산자
	                               - 증감연산자 ++, --
	                               - 부정연산자! => true/false
	                               - 형변환연산자
	                                 - 숫자 변환 : Number(), parseInt()
	                                 - 문자 변환 : String()
	                                 - 논리 변환 : Boolean()
	                                 **HTML / CSS 제어
	                                   HTML에서 입력값을 읽는 경우 => 문자열 => 형변환필요
	                                   모든 데이터가 text()
	                            2) 이항연산자
	                               - 산술연산자 : + - * / %
	                                 - + : 산술, 문자열 결합
	                                 - / : 0으로 나누기 불가
	                                       정수/정수=실수
	                                 - % : 왼쪽부호가 남는다
	                                 *** 연산처리가 안되는 상태 : NaN
	                               - 비교연산자
	                                 - === 같다
	                                 - !== 같지 않다
	                                 - < 작다
	                                 - > 크다
	                                 - <= 작거나 같다
	                                 - >= 크거나 같다
	                                 ==> 결과값은 true/false
	                                     숫자 외에 문자열, 날짜 비교 가능
	                               - 논리연산자
	                                 - && : 두개의 조건이 true일 때만 true, 나머지는 false
	                                 - || : 둘 중에 하나이상 true이면 true, 모두 false일 때 false
	                               - 대입연산자
	                                 - =
	                                 - += : HTML 결합시 많이 사용
	                                 - -=
	                            3) 삼항연산자
	                               - (조건)?값1:값2
	                                 true => 값1
	                                 false => 값2
	           자바스크립트는 HTML 태그 제어 => HTML태그 읽는 방법
	             **document.getElementById(id명)
	             - document.getElementByTagName(tag명)
	             - document.getElementByClassName(class명)
	             **document.querySelector(css선택자)
	           화면 출력
	             - document.write()
	             **alert()
	             **태그명.innerHTML : 태그와 태그사이에 데이터 첨부
	             **console.log() : 자바와 연동 확인
	HTML/CSS: 화면에만 출력
	자바스크립트 : 자바에서 데이터를 받아 HTML/CSS 제어 => 동적페이지
	자바 : 오라클 데이터 관리
	오라클 : 공유하는 데이터를 저장하는 공간
	오라클 => 자바 => 자바스크립트로 전송 => HTML 생성, CSS 생성 => 화면출력
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