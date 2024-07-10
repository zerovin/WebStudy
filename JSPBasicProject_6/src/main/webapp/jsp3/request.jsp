<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSP 파일 내의 메소드 구현 
	_jspService() {내장객체, 소스코딩}
	
	165page
	내부객체 (내장객체, 기본객체) - 선언이 되어있는 객체
	
 ***HttpServletRequest request
    사용자가 보내준 값을 묶어서 한번에 전송
    입력해서 서버롤 전송하는 데이터는 모두 request
    Django, NodeJS, ASP, PHP에도 request 존재
     1. 서버 정보 / 브라우저 정보
        http://localhost/JSPBasicProject_6/jsp3/request.jsp => URL
        ---------------- ----------------- -----------------
           서버IP/PORT       contextPath          파일명
         => 80은 생략가능   => 파일명 자체가 구분자
                         ----------------------------------- => URI
        - 서버IP/PORT
            getServerName() => localhost
                               AWS - 각자마다 고정 IP부여
            getProtocol() => http
            getPort() => 80
        - URI
            getRequestURL()
         ***getRequeestURI()
         ***getContextPath() 
            getRemoteAddress() : 클라이언트 IP
        
     2. 사용자 요청 정보 : 사용자가 보내준 데이터를 받는 메소드
       ***String getParameter() : 단일값을 받을 때 사용
        - String[] getParameterValues() : 여러개의 값을 받을 때 사용, checkbox, select(multiple)
       ***setCharacterEncoding() : 디코딩, 한글변환
        
     3. 데이터 추가 정보
       ***setAttribute() : 추가
       ***getAttribute() : 추가된 데이터 읽기
        - removeAttribute() : 삭제
 ***HttpServletResponse response
 ***PageContext pageContext;
                <jsp:include>, <jsp:forward>
 ***HttpSession session = null;
  **ServletContext application;
	ServletConfig config;
   *JspWriter out = null;
	Object page = this;
	Exception exception

 --%>
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
		width:600px;
	}
</style>
<%--
	사용자가 전송하는 모든 데이터는 서버를 거쳐 톰캣에 의해 request에 전송된 데이터를 묶어서 넘겨줌
	=> 처리는 웹개발자
	
	묶는 방식 => Map 방식 (키=값)
           	    - getParameter("키")
	            - setAttribute(키,값)
	            - 키 중복 불가
	            ex) list.jsp?num=1&num=2&num=3&num=4&num=5
	getRequestURI()
	 물음표 (?) 기준으로 앞은 URI, 뒤는 요청값
	 => /프로젝트폴더명/폴더명/파일명?id=admin%pwd=1234
	    ---------------------- -----------------
	             URI              request 첨부
 --%>
</head>
<body>
	<div class="container">
		<h3 class="text-center">전송</h3>
		<div class="row">
			<form method="POST" action="request_ok.jsp">
				<table class="table">
					<tr>
						<th width="20%">이름</th>
						<td width="80%">
							<input type="text" size="20" class="input-sm" name="name">
						</td>
					</tr>
					<tr>
						<th width="20%">성별</th>
						<td width="80%">
							<input type="radio" name="sex" value="남자" checked>남자
							<input type="radio" name="sex" value="여자">여자
						</td>
					</tr>
					<tr>
						<th width="20%">전화</th>
						<td width="80%">
							<select name="phone1" class="input-sm">
								<option>010</option>
								<option>011</option>
							</select>
							<input type="text" name="phone2" class="input-sm" size="20">
						</td>
					</tr>
					<tr>
						<th width="20%">소개</th>
						<td width="80%">
							<textarea rows="5" cols="30" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<th width="20%">취미</th>
						<td width="80%">
							<input type="checkbox" name="hobby" value="등산">등산
							<input type="checkbox" name="hobby" value="낚시">낚시
							<input type="checkbox" name="hobby" value="여행">여행
							<input type="checkbox" name="hobby" value="게임">게임
							<input type="checkbox" name="hobby" value="자전거">자전거
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="submit" value="전송" class="btn-sm btn-primary">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>