<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('img').click(function(){
		let src=$('img').attr('src') //getter
		alert(src)
		
		$('img').attr('src','m2.jpg') //setter
		
		//예약하기
		//val, text, attr, html, append
		
		//모든 태그에 이벤트 가능 => ajax
	})
})
</script>
</head>
<body>
	<img src="m1.jpg" style="width:150px;">
</body>
</html>