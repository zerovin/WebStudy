<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*, java.util.*"%>
<jsp:useBean id="dao" class="com.sist.dao.GoodsDAO"/>
<jsp:useBean id="rDao" class="com.sist.dao.ReplyDAO"/>
<%
	String id=(String)session.getAttribute("id");
	String fno=request.getParameter("no");
	GoodsVO vo=dao.goodsDetailData(Integer.parseInt(fno));
	
	List<ReplyVO> list=rDao.replyListData(Integer.parseInt(fno), 2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){ //main => window.onload=function(){}
		$('.update_btn').click(function(){
			//$('.update_form').hide();
			//$('.update_form').remove('active');
			let rno=$(this).attr('data-no');
			if(!$(this).hasClass('active')){
				$('#update'+rno).addClass('active');
				$(this).addClass('active');
				$('.update_btn').text('수정');
				$(this).text('취소');
			}else{
				$('.update_btn').text('수정');
				$(this).removeClass('active');
				$('#update'+rno).removeClass('active');
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="detail">
			<img src="<%=vo.getPoster() %>" alt="<%=vo.getName() %>">
			<div class="info">
				<p class="goods_tt"><%=vo.getName() %></p>
				<p class="sub_tt"><%=vo.getSub() %></p>
				<div class="price_icon">
					<div class="prices">
						<p class="discount"><%=vo.getDiscount() %>%</p>
						<P class="price"><%=vo.getPrice() %></P>
					</div>
					<div class="icon">
						<button class="like"><img src="https://recipe1.ezmember.co.kr/img/mobile/icon_zzim2.png"></button>
						<button class="share"><img src="https://recipe1.ezmember.co.kr/img/mobile/icon_share10.png"></button>
					</div>	
				</div>
				<p class="first_price"><span>첫구매할인가</span> <%=vo.getFirstPrice() %></p>
				<dl class="deli_point">
					<dt class="delivery">
						<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_delivery3.png">
						<span>배송</span>
					</dt>
					<dd><%=vo.getDelivery() %></dd>
				</dl>
				<dl class="deli_point">
					<dt class="delivery">
						<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_point.png">
						<span>적립</span>
					</dt>		
					<dd><span>70</span>원 적립 (모든 회원 구매액의 0.5% 적립</dd>		
				</dl>
				<form action="#" class="sel_form">
					<select>
						<option>[선택]옵션을 선택하세요.</option>
						<option value="option1">옵션 1</option>
						<option value="option2">옵션 2</option>
					</select>
					<div class="form_btn">
						<button class="cart">장바구니</button>
						<button class="buy">바로구매</button>
					</div>
				</form>
			</div>
		</div>
		<div class="goods_reply">
			<ul class="reply_list">
			<%
				for(ReplyVO rvo:list){
			%>
				<li class="reply_li">
					<div class="reply_top">
						<p><%=rvo.getName() %></p>
						<%
							if(rvo.getId().equals(id)){
						%>
						<div class="reply_btns">
							<button class="update_btn" data-no="<%=rvo.getRno()%>">수정</button>
							<a href="../reply/delete.jsp?rno=<%=rvo.getRno()%>&fno=<%=rvo.getFno()%>&type=2">삭제</a>
						</div>
						<%
							}
						%>
					</div>
					<div class="reply_msg">
						<pre><%=rvo.getMsg()%></pre>
					</div>
					<form method="POST" action="../reply/update.jsp" class="reply_form update_form" id="update<%=rvo.getRno()%>">
						<input type="hidden" name="fno" value="<%=vo.getNo()%>">
						<input type="hidden" name="rno" value="<%=rvo.getRno()%>">
						<input type="hidden" name="type" value="2">
						<div class="reply_form">
							<textarea rows="3" cols="110" name="msg" required><%=rvo.getMsg() %></textarea>
							<button>댓글수정</button>			
						</div>
					</form>
				</li>
			<%
				}
			%>
			</ul>
			<%
				if(id!=null){
			%>
				<form method="POST" action="../reply/insert.jsp" class="reply_form">
					<input type="hidden" name="fno" value="<%=vo.getNo()%>">
					<input type="hidden" name="type" value="2">
					<div class="reply_form">
						<textarea rows="3" cols="118" name="msg" required></textarea>
						<button>댓글쓰기</button>			
					</div>
				</form>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>