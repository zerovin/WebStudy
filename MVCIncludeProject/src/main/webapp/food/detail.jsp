<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	let u=0; //전역변수
	$(function(){ //main => window.onload=function(){}
		$('.updates').click(function(){
			$('.ups').hide();
			$('.ups').remove('active');
			let rno=$(this).attr('data-no');
			if(!$(this).hasClass('active')){
				$(this).addClass('active');
				$('.updates').text('수정');
				$(this).text('취소');
				$('#ups'+rno).show();
			}else{
				$('.updates').text('수정');
				$('#ups'+rno).hide();
				$(this).removeClass('active');
			}
		
			/*
			$('.ups').hide();
			$('.updates').text('수정');
			let rno=$(this).attr('data-no');
			if(u==0){
				u=1;
				$(this).text('취소');
				$('#ups'+rno).show();
			}else{
				u=0;
				$(this).text('수정');
				$('#ups'+rno).hide();
			}
			*/
		});
		
	});
</script>
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
</head>
<body>
	<div class="row">
		<div class="col-sm-8">
			<%-- 맛집 상세, 댓글 --%>
			<table class="table">
				<tr>
					<td width="30%" class="text-center" rowspan="5">
						<img src="${vo.poster}" style="width:100%">
					</td>
					<td colspan="2"><h3>${vo.name}&nbsp;<span style="color:orange:">${vo.score}</span></h3></td>
				</tr>
				<tr>
					<th class="text-center" width="15%">음식종류</th>
					<td width="55%">${vo.type}</td>
				</tr>
				<tr>
					<th class="text-center" width="15%">주소</th>
					<td width="55%">${vo.address}</td>
				</tr>
				<tr>
					<th class="text-center" width="15%">전화번호</th>
					<td width="55%">${vo.phone}</td>
				</tr>
				<tr>
					<th class="text-center" width="15%">테마</th>
					<td width="55%">${vo.theme}</td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<td>${vo.content}</td>
				</tr>
				<tr>
					<td class="text-right">
						<a href="#" class="btn btn-xs btn-info">찜하기</a>
						<a href="#" class="btn btn-xs btn-success">좋아요</a>
						<a href="#" class="btn btn-xs btn-warning">예약</a>
						<a href="../main/main.do" class="btn btn-xs btn-primary">목록</a>
					</td>
				</tr>
			</table>
			<div style="height:15px;"></div>
			
		</div>
	</div>
</body>
</html>