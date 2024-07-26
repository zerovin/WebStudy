<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
	//출력할 데이터
	//자바는 자신의 객체 => this
	//JSP에서 자신의 객체 => page
	String strPage=request.getParameter("page");
	if(strPage==null){
		strPage="1";
	}
	int curpage=Integer.parseInt(strPage);
	FoodDAO dao=FoodDAO.newInstance();
	List<FoodVO> list=dao.foodListData(curpage);
	int totalpage=dao.foodTotalPage();
	
	//쿠키읽기
	Cookie[] cookies=request.getCookies();
	List<FoodVO> cList=new ArrayList<FoodVO>();
	if(cookies!=null){
		for(int i=cookies.length-1;i>=0;i--){
			if(cookies[i].getName().startsWith("food_")){
				String fno=cookies[i].getValue();
				FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
				cList.add(vo);
			}
		}
	}

%>
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
</head>
<body>
	<div class="row">
		<%
			for(FoodVO vo:list){
		%>
				<div class="col-sm-3">
					<a href="detail_before.jsp?fno=<%=vo.getFno()%>">
						<div class="thumbnail">
							<img src="<%=vo.getPoster()%>" style="width:240px;height:200px;">
							<p class="a"><%=vo.getName()%></p>
						</div>
					</a>
				</div>
		<%
			}
		%>
	</div>
	<div style="height:20px;"></div>
	<div class="row">
		<div class="text-center">
			<a href="home.jsp?page=<%=curpage>1?curpage-1:curpage%>" class="btn btn-sm btn-danger">이전</a>
			<%=curpage%> page / <%=totalpage %> pages
			<a href="home.jsp?page=<%=curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-primary">다음</a>
		</div>
	</div>
	<div style="height:20px;"></div>
	<div class="row">
		<h3>최신방문 맛집</h3>
		<hr>
		<a href="all_delete.jsp" class="btn btn-sm btn-success">전체 삭제</a>
		<a href="all_view.jsp" class="btn btn-sm btn-info">전체 보기</a>
		<hr>
			<%
				int i=0;
				for(FoodVO cvo:cList){
					if(i>8) break;
			%>
				<figure style="float:left;margin-left:5px;">
					<a href="detail.jsp?fno=<%=cvo.getFno()%>">
						<img src="<%=cvo.getPoster() %>" alt="<%=cvo.getName() %>" style="width:100px;height:100px;" class="img-rounded">
						<figcaption style="margin:5px 30px;">
							<a href="delete.jsp?fno=<%=cvo.getFno() %>" class="btn btn-xs btn-danger">삭제</a>
						</figcaption>
					</a>
				</figure>
			<%
				i++;
				}
			%>
	</div>
</body>
</html>