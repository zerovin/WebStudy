<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	내장객체
	  String : 자바와 유사
	  ***substring()
	  ***trim()
	   - replace()
	  ***split()
	   - indexOf()
	   - slice()
	   
	  Math
	   - random()
	   - round()
	  Array
	   - push()
	   - pop()
	   - sort()
	   - slice()
	  Date - 날짜 시간 관리 내장객체
	   - get
	   - let today=new Date()
	     today.getFullYear() => 년도읽기
	     today.getMonth()+1 => 월
	     today.getDate()
	   
	  
	          
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let today=new Date() //클래스형 => new
	/*
		class Sawon{
		   init:function(){
			   
		   }
		}
		최근 class => function (hooks) 추세
	*/
	let year=today.getFullYear()
	let month=today.getMonth()+1
	let day=today.getDate()
	let week=today.getDay() //숫자출력
	let strWeek=["일","월","화","수","목","금","토"]
	document.write(year+"년 "+month+"월 "+day+"일 "+strWeek[week]+"요일")
}
</script>
</head>
<body>

</body>
</html>