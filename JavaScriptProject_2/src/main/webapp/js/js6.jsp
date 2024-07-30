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
		width:800px;
	}
</style>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
	window.onload=()=>{
		axios.get('http://localhost/JavaScriptProject_2/js/js6.do')
		.then(function(response){
			console.log(response)
			let data=response.data
			let html='';
			data.map(function(emp){
				html+='<tr>'
					+'<td class="text-center">'+emp.empno+'</td>'
					+'<td class="text-center">'+emp.ename+'</td>'
					+'<td class="text-center">'+emp.job+'</td>'
					+'<td class="text-center">'+emp.dbday+'</td>'
					+'<td class="text-center">'+emp.sal+'</td>'
					+'</tr>'
			})
			let tbody=document.querySelector('tbody');
			tbody.innerHTML=html
		})
	}
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">사원목록</h3>
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th class="text-center">사번</th>
						<th class="text-center">이름</th>
						<th class="text-center">직위</th>
						<th class="text-center">입사일</th>
						<th class="text-center">급여</th>
					<tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>