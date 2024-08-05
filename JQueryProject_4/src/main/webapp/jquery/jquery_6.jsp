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
	$('input[type="button"]').click(function(){
		let msg='<h3>Hello Jquery</h3>'
		//$('#print').html(msg) //innerHTML
		//text => textContent => html번역X => 외부에서 데이터를 가지고 온다
		$('#print').append(msg)
		//append => 증가
		//html => 덮어쓰기
	})
})
</script>
</head>
<body>
	<input type="button" value="클릭">
	<p></p>
	<span id="print"></span>
</body>
</html>