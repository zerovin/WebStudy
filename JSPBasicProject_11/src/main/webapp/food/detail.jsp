<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<jsp:useBean id="rDao" class="com.sist.dao.ReplyDAO"></jsp:useBean>
<%
	String id=(String)session.getAttribute("id");
	String fno=request.getParameter("fno");
	// include => 파일 전체에서 request 공유 가능
	// mode 화면변경 => include되는 파일 찾기
	// 나머지 데이터는 해당 JSP에서 처리
	FoodDAO dao=FoodDAO.newInstance();
	FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
	
	//댓글 목록 => fno
	List<ReplyVO> list=rDao.replyListData(Integer.parseInt(fno), 1);		
	
%>
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
						<img src="<%=vo.getPoster()%>" style="width:100%">
					</td>
					<td colspan="2"><h3><%=vo.getName()%>&nbsp;<span style="color:orange:"><%=vo.getScore()%></span></h3></td>
				</tr>
				<tr>
					<th class="text-center" width="15%">음식종류</th>
					<td width="55%"><%=vo.getType() %></td>
				</tr>
				<tr>
					<th class="text-center" width="15%">주소</th>
					<td width="55%"><%=vo.getAddress() %></td>
				</tr>
				<tr>
					<th class="text-center" width="15%">전화번호</th>
					<td width="55%"><%=vo.getPhone() %></td>
				</tr>
				<tr>
					<th class="text-center" width="15%">테마</th>
					<td width="55%"><%=vo.getTheme() %></td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<td><%=vo.getContent() %></td>
				</tr>
				<tr>
					<td class="text-right">
						<a href="#" class="btn btn-xs btn-info">찜하기</a>
						<a href="#" class="btn btn-xs btn-success">좋아요</a>
						<a href="#" class="btn btn-xs btn-warning">예약</a>
						<a href="home.jsp" class="btn btn-xs btn-primary">목록</a>
					</td>
				</tr>
			</table>
			<div style="height:15px;"></div>
			<table class="table">
				<tr>
					<td>
					<%
						for(ReplyVO rvo:list){
					%>
							<table class="table">
								<tr>
									<td class="text-left">◑<%=rvo.getName()%>&nbsp;<%=rvo.getDbday()%></td>
									<td class="text-right">
									<%
										if(rvo.getId().equals(id)){
									%>
											<span class="btn btn-danger btn-xs updates" data-no="<%=rvo.getRno()%>">수정</span>
											<a href="../reply/delete.jsp?rno=<%=rvo.getRno()%>&fno=<%=rvo.getFno()%>&type=1" class="btn btn-primary btn-xs">삭제</a>
									<%
										}
									%>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<pre style="white-space:wrap;background-color:white;border:none;"><%=rvo.getMsg()%></pre>
									</td>
								</tr>
								<tr style="display:none;" class="ups" id="ups<%=rvo.getRno()%>">
									<td>
										<form method="POST" action="../reply/update.jsp">
											<input type="hidden" name="fno" value="<%=vo.getFno()%>">
											<input type="hidden" name="rno" value="<%=rvo.getRno()%>">
											<textarea rows="4" cols="45" name="msg" style="float:left;" required><%=rvo.getMsg()%></textarea>
											<button style="height:82px;width:100px;background-color:blue;color:white;">댓글수정</button>
										</form>
									</td>
								</tr>
							</table>
					<%
						}
					%>
					</td>
				</tr>	
			</table>
			<%
				if(id!=null){
			%>
				<table class="table">
					<tr>
						<td>
							<form method="POST" action="../reply/insert.jsp">
								<input type="hidden" name="fno" value="<%=vo.getFno()%>">
								<input type="hidden" name="type" value="1">
								<textarea rows="4" cols="60" name="msg" style="float:left;" required></textarea>
								<button style="height:82px;width:100px;background-color:blue;color:white;">댓글쓰기</button>
							</form>
						</td>
					</tr>
				</table>
			<%
				}
			%>
		</div>
		<div class="col-sm-4">
			<%-- 지도, 근처 맛집 --%>
		</div>
	</div>
</body>
</html>