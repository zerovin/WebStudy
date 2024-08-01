<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		width:300px;
	}
</style>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
	function idcheck(){
		let id=document.querySelector("#id");
		if(id.value.trim()===""){
			//입력이 안된 상태
			alert("ID를 입력하세요")
			id.focus()
			return
		}
		//server로 전송 => Controller => MemberModel <=> MemberDAO
		//server로 전송 - axios / ajax
		axios.get('idcheck_ok.do',{
			params:{
				id:id.value
			}
		}).then(function(result){ //Model에서 out.write로 보낸값을 result로 받음
			let count=Number(result.data)
			if(count===0){
				let span=document.querySelector("#result")
				span.innerHTML='<font color="blue">'+id.value+'는(은) 사용 가능한 아이디입니다</font>'
				let btn=document.querySelector("#okbtn")
				btn.style.display=''
			}else{
				let span=document.querySelector("#result")
				span.innerHTML='<font color="red">'+id.value+'는(은) 이미 사용중인 아이디입니다</font>'
			}
		})
		
	}
	function ok(){
		opener.frm.id.value=document.querySelector('#id').value
		self.close();
	}
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">아이디 중복체크</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td>
						ID : <input type="text" name="id" id="id" size="15" class="input-sm">
						<input type="button" value="중복체크" class="btn-sm btn-danger" onclick="idcheck()">
					</td>
				</tr>
				<tr>
					<td class="text-center">
						<span id="result"></span>
					</td>
				</tr>
				<tr>
					<td class="text-center">
						<input type="button" value="확인" class="btn-sm btn-success" style="display:none;" onclick="ok()" id="okbtn">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>