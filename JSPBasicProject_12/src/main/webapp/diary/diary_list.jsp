<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%--
	데이터 전송 - 사용 후 버리는 데이터
	             => <form>, <a>
	           사용 후 유지하는 데이터
	             => id, 방문내용, 상품구매내역
	             => 지속적으로 데이터 관리
	             =>          session(보안)    cookie(일반 데이터)
	                저장기간    로그아웃까지         지정한 만큼
	                저장위치    서버(getId())       브라우저
	                         공유, static
	jsp <-> jsp - 공유하지 않고 하나의 jsp파일에만 전송할 경우 request 이용
	session - 공유, static 개념 
	          필요시마다 어떤 jsp든 상관없이 사용가능
	          단, 세션은 사용자 브라우저마다 메모리공간 1개 생성
	          데이터는 여러개 저장가능
	=> 1. 요청값 전송
	       ex) 검색 - 사용자 검색어 전송(검색창)
	           로그인 - id, pwd => id 저장, 자동로그인
	   2. 요청값을 받아 데이터베이스 연동 : SQL => DAO
	   3. HTML 실행화면 : 자바 => for, if
	   
	JSP - 화면출력용
	      - 자바 : Model
	               DAO,VO,Service
	         HTML : View
	                자바스크립트 - 브라우저에서 이벤트처리
	      - MV 패턴 : 기능별 메소드 => JSP호출
	      - 자동화 처리 : 자동 메소드 호출 => Controller (Spring)
	  1. 내장 객체 - request : 사용자 요청처리
	               response : 응답정보(화면 이동 정보)
	               session : 서버에 데이터를 저장해서 모든 JSP에 공유 목적
	               application : 데이터 실제 경로
	               pageContext : include / forward
	               Cookie : 내장 객체가 아님, 생성
	session (HttpSession)
	  - 내장객체가 아닌 경우에는 request로 생성가능
	    HttpSession session=request.getSession()
	  - 저장
	    setAttribute(String key, Object value) => Object(모든 클래스 저장)
	  - 저장된 데이터 읽기
	    Object getAttribute(String key) => Object리턴이라 반드시 형변환
	  - 저장 기간 설정
	    setMaxInactiveInterval(초) => 디폴트 30분
	  - 일부삭제
	    removeAttribute(String key) => 장바구니, 회원정보 변경(테이블, 세션정보 모두 변경)
	  - 전체삭제
	    invalidate() : session에 저장된 모든 데이터 삭제 => 로그아웃
	  - 구분자 얻기
	    String getId() : 사용자의 브라우저 정보 => JSP 실시간 채팅
 --%>
 <%
 	/*
 		MVC - front(HTML) / back(Java) 분리
 		Spring : 파일 처리, 이동 => 요즘 X
 		Spring-boot : 서버에서 결과값 전송 => 결과값은 ThymeLeaf(HTML+제어문), Vue, React
 		    
 	*/
 	
 	//diary_list.jsp?year=&month=&day=
 	
 	//1. 사용자가 보내준 데이터 받기
 	String year=request.getParameter("year");
 	String month=request.getParameter("month");
 	String day=request.getParameter("day");
 	String id=(String)session.getAttribute("id");
 	DiaryVO vo=new DiaryVO();
 	vo.setId(id);
 	vo.setYear(Integer.parseInt(year));
 	vo.setMonth(Integer.parseInt(month));
 	vo.setDay(Integer.parseInt(day));
 	
 	//2. 데이터베이스 연동
 	DiaryService dao=DiaryService.newInstance();

 	//3. 결과값 받기
 	List<DiaryVO> list=dao.diaryListData(vo);
 	
 	//4. HTML 이용해서 결과값 출력
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
		width:700px;
	}
	h3{
		text-align:center;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
$(function(){
	$('.checks').click(function(){
		let no=$(this).attr('data-no');
		$('.msgs').hide();
		if(i==0){
			$('#msg'+no).show();
			i=1;
		}else{
			$('#msg'+no).hide();
			i=0;
		}
	});
	
});
</script>
</head>
<body>
	<div class="container">
		<h3><%=session.getAttribute("name")%>님의 <%=year%>년 <%=month%>월 <%=day%>일 일정목록</h3>
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th width="10%" class="text-center">번호</th>
						<th width="40%" class="text-center">일정</th>
						<th width="20%" class="text-center">작성일</th>
						<th width="30%" class="text-center"></th>
					</tr>
				</thead>
				<tbody>
					<% for(DiaryVO dvo:list){ %>
						<tr>
							<td width="10%" class="text-center"><%=dvo.getNo()%></td>
							<td width="40%"><%=dvo.getSubject()%></td>
							<td width="20%" class="text-center"><%=dvo.getDbday()%></td>
							<td width="30%" class="text-center">
								<span class="btn btn-xs btn-warning checks" data-no="<%=dvo.getNo()%>">일정확인</span>
								<a href="diary_update.jsp?no=<%=dvo.getNo()%>" class="btn btn-xs btn-info">수정</a>
								<a href="diary_delete.jsp?no=<%=dvo.getNo()%>" class="btn btn-xs btn-success">취소</a>
							</td>
						</tr>
						<tr id="msg<%=dvo.getNo()%>" class="msgs" style="display:none;">
							<td colspan="4" class="text-left" valign="top">
								<pre style="white-space:wrap;"><%=dvo.getMsg()%></pre>
							</td>
						</tr>
					<%} %>
					<tr>
						<td colspan="4" class="text-right">
							<a href="diary.jsp" class="btn btn-xs btn-success">일정</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>