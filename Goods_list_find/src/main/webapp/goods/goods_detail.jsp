<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	GoodsDAO dao=GoodsDAO.newInstance();
	String no=request.getParameter("no");
	GoodsVO vo=dao.goodsDetailData(Integer.parseInt(no));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="goods_detail.css">
<title>Insert title here</title>
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
				<form action="#">
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
	</div>
</body>
</html>