<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
	/*
		JSP : Java Server Page 
		      서버에서 실행되는 자바 파일
		      메소드 영역에 클래스 제작 => 컴파일 => HTML만 메모리에 저장 => 저장된 HTLM을 브라우저에서 읽어서 출력
		      -----------------------------------------------Tomcat
		상단 contentType="" 부분으로 HTML/XML 구분
		  - contentType="text/html;" => default
		  - contentType="text/xml;"
		    
		1. 지시자 : page, include, taglib
		2. 구분자 : 자바 / html 구분
		3. 내장 객체 : request
		4. cookie / session
		5. JSTL / EL
	  **6. MVC
	*/
	/*
		초기화면 addr=null
		http://localhost/HTMLCSSProject_10/food/food_find.jsp
		
		검색어없이 검색 addr=''
		http://localhost/HTMLCSSProject_10/food/food_find.jsp?addr=
	*/
	//브라우저 : 1byte
	//자바 : 2byte
	// 한글깨짐 => 변환(decoding) 유니코드로 변경, getParameter 받기전에 작성
	request.setCharacterEncoding("UTF-8");
	
	/*
		GET방식 = URL로 입력값 전송
		http://localhost/HTMLCSSProject_10/food/food_find.jsp?addr=%EC%84%9C%EB%8C%80%EB%AC%B8
		서대문 -> %EC%84%9C%EB%8C%80%EB%AC%B8 ===> Encoding
		%EC%84%9C%EB%8C%80%EB%AC%B8 -> 서대문 ===> Decoding request.setCharacterEncoding("UTF-8")
	*/
	
	String addr=request.getParameter("addr");
	if(addr==null || addr.equals("")){ //addr.equals("") 처리 안하면 검색어없이 검색시 전체출력
		addr="마포";
	}
	String strPage=request.getParameter("page");
	if(strPage==null){
		strPage="1";
	}
	int curpage=Integer.parseInt(strPage); //현재 보여주는 페이지
	
	FoodDAO dao=FoodDAO.newInstance();
	List<FoodVO> list=dao.foodFindData(addr, curpage);
	int totalpage=dao.foodFindTotalPage(addr);
	
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
	<div class="container">
		<div class="row">
			<form method="POST" action="food_find.jsp">
				<input type="text" name="addr" size=20 class="input-sm" value="<%=addr%>">
				<input type="submit" value="검색" class="btn-sm btn-danger">
			</form>
		</div>
		<div style="height:20px;"></div>
		<div class="row">
		<%
			for(FoodVO vo:list){
		%>
			<div class="col-sm-3">
				<a href="#">
					<div class="thumbnail">
						<img src="<%=vo.getPoster() %>" style="width:240px;height:240px;" class="img-rounded">
						<p class="a"><%=vo.getName() %></p>
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
				<a href="food_find.jsp?addr=<%=addr %>&page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-primary">이전</a>
				<%=curpage %> page / <%=totalpage %> pages
				<a href="food_find.jsp?addr=<%=addr %>&page=<%=curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-primary">다음</a>
			</div>
		</div>
	</div>
</body>
</html>