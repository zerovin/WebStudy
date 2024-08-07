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
	$('#updateBtn').on('click',function(){
		//유효성 검사
		let name=$('#name').val()
		if(name.trim()===""){
			$('#name').focus()
			return
		}
		let subject=$('#subject').val()
		if(subject.trim()===""){
			$('#subject').focus()
			return
		}
		let content=$('#content').val()
		if(content.trim()===""){
			$('#content').focus()
			return
		}
		let pwd=$('#pwd1').val()
		if(pwd.trim()===""){
			$('#pwd1').focus()
			return
		}
		let no=$('#no').val()
		$.ajax({
			type:'post',
			url:'../board/update_ok.do',
			data:{"no":no,"name":name,"subject":subject,"content":content,"pwd":pwd},
			success:function(result){
				//yes 비밀번호 일치 or no 비밀번호 불일치
				if(result==='yes'){
					//이동
					location.href="../board/detail.do?no="+no
				}else{
					alert("비밀번호가 틀립니다")
					$('#pwd1').val("")
					$('#pwd1').focus()
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
	  	    	<table class="table">
	  	    		<tr>
	  	    			<th width="15%" class="text-right">이름</th>
	  	    			<td width="85%">
	  	    				<input type="hidden" id="no" value="${vo.no}">
	  	    				<input type="text" id="name" size="20" class="input-sm" value="${vo.name}">
	  	    			</td>
	  	    		</tr>
	  	    		<tr>
	  	    			<th width="15%" class="text-right">제목</th>
	  	    			<td width="85%">
	  	    				<input type="text" id="subject" size="50" class="input-sm" value="${vo.subject}">
	  	    			</td>
	  	    		</tr>
	  	    		<tr>
	  	    			<th width="15%" class="text-right">내용</th>
	  	    			<td width="85%">
	  	    				<textarea rows="10" cols="50" id="content">${vo.content}</textarea>
	  	    			</td>
	  	    		</tr>
	  	    		<tr>
	  	    			<th width="15%" class="text-right">비밀번호</th>
	  	    			<td width="85%">
	  	    				<input type="password" id="pwd1" size="10" class="input-sm">
	  	    			</td>
	  	    		</tr>
	  	    		<tr>
	  	    			<td colspan="2" class="text-center inline">
	  	    				<input type="button" value="수정" class="btn-sm btn-danger" id="updateBtn">
	  	    				<input type="button" value="취소" class="btn-sm btn-primary" onclick="javascript:history.back()">
	  	    			</td>
	  	    		</tr>
	  	    	</table>
	  	    </div>
		</main>
	</div>	  	   
</body>
</html>