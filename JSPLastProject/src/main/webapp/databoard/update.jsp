<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
	.row1{
		margin:0px auto;
		width:960px;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#up_pwd').keyup(function(){
		let no=$('input[type="hidden"]').val()
		let pwd=$('#up_pwd').val()
		$.ajax({
			type:'POST',
			url:'../databoard/password_check.do',
			data:{"no":no, "pwd":pwd},
			success:function(result){
				if(result==='yes'){
					$('#result').text("비밀번호가 맞습니다")
					$('input[type="submit"]').show()
					$('#up_pwd').attr('disabled',true)
				}else{
					$('#result').text("비밀번호가 틀립니다")
				}
			},
			error:function(request, status, error){
				console.log(error)
			}
		})
	})
})
</script>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
	  	    <h2 class="sectiontitle">수정하기</h2>
	  	    <div class="row row1">
	  	    	<form method="POST" action="../databoard/update_ok.do" enctype="multipart/form-data">
	  	    	<!-- enctype="multipart/form-data" 파일 업로드 프로토콜, 업로드시 없으면 오류 --> 
		  	    	<table class="table">
		  	    		<tr>
		  	    			<th width="15%" class="text-right">이름</th>
		  	    			<td width="85%">
		  	    				<input type="hidden" name="no" value="${vo.no}">
		  	    				<input type="text" name="name" size="20" class="input-sm" required value="${vo.name}">
		  	    			</td>
		  	    		</tr>
		  	    		<tr>
		  	    			<th width="15%" class="text-right">제목</th>
		  	    			<td width="85%">
		  	    				<input type="text" name="subject" size="50" class="input-sm" required value="${vo.subject}">
		  	    			</td>
		  	    		</tr>
		  	    		<tr>
		  	    			<th width="15%" class="text-right">내용</th>
		  	    			<td width="85%">
		  	    				<textarea rows="10" cols="50" name="content" required>${vo.content}</textarea>
		  	    			</td>
		  	    		</tr>
		  	    		<tr>
		  	    			<th width="15%" class="text-right">첨부파일</th>
		  	    			<td width="85%">
		  	    				<input type="file" name="upload" size="30" class="input-sm" value="${vo.filename}">
		  	    			</td>
		  	    		</tr>
		  	    		<tr>
		  	    			<th width="15%" class="text-right">비밀번호</th>
		  	    			<td width="85%">
		  	    				<input type="password" name="pwd" size="10" class="input-sm" required id="up_pwd">
		  	    			</td>
		  	    		</tr>
		  	    		<tr>
		  	    			<td colspan="2">
		  	    				<span id="result" style="color:red"></span>
		  	    			</td>
		  	    		</tr>
		  	    		<tr>
		  	    			<td colspan="2" class="text-center inline">
		  	    				<input type="submit" value="수정하기" class="btn-sm btn-danger" style="display:none;">
		  	    				<input type="button" value="취소" class="btn-sm btn-primary" onclick="javascript:history.back()">
		  	    			</td>
		  	    		</tr>
		  	    	</table>
	  	    	</form>
	  	    </div>
		</main>
	</div>	  	   
</body>
</html>