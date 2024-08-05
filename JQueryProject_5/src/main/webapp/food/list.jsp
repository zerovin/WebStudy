<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		width:960px;
	}
	.a{
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'POST',
		url:'type.do',
		success:function(result){
			$('#print').html(result)
		}
	})
	$('.typeBtn').click(function(){
		let no=$(this).attr('data-type');
		$.ajax({
			type:'POST',
			url:'type.do',
			data:{"type":no},
			success:function(result){
				$('#print').html(result) //responseText => 실행된 HTML을 읽어온다
			}
		})
	})
	//얘는 형식적 ajax
})
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<button class="btn btn-lg btn-success typeBtn" data-type="1">한식</button>
				<button class="btn btn-lg btn-info typeBtn" data-type="2">중식</button>
				<button class="btn btn-lg btn-danger typeBtn" data-type="3">양식</button>
				<button class="btn btn-lg btn-primary typeBtn" data-type="4">일식</button>
				<button class="btn btn-lg btn-warning typeBtn" data-type="5">분식</button>
			</div>
		</div>
		<div style="height:20px"></div>
		<div id="print"></div>
		<!-- 
		<div class="row">
			<c:forEach var="vo" items="${list}">
				<div class="col-sm-3">
					<a href="#">
						<div class="thumbnail">
							<img src="${vo.poster}" style="width:100%;">
							<p class="a">${vo.name}</p>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
		<div style="height:20px"></div>
		<div class="row">
			<div class="text-center">
				<a href="#" class="btn btn-lg btn-success">이전</a>
				${curapge} page / ${totalpage} pages
				<a href="#" class="btn btn-lg btn-info">다음</a>
			</div>
		</div>
		-->
	</div>
</body>
</html>