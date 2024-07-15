<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. HTML / 자바 분리 => MVC, Spring(실무)에서는 <% %>, <%= %>로 분리하지 않는다
	   <% 자바 %> => <c:~>
	   <%=브라우저 출력 %> => ${}
	2. 지시자
	   page - import
	          contentType
	          errorPage => web.xml(등록)
	   taglib - prefix, uri => JSP에서 자바대체
 ***3. 내장객체 - MVC, Spring에서 사용
       - request
          - getParameter()
          - getParameterValues()
          - setCharacterEncoding()
          - getSession() / getCookie()
          - setAttribute() / getAttribute()
          - getContextPath() / getRequestURI()
       - response
          - setHeader()
          - sendRedirect()
          - addCookie()
       - session
          - setAttribute()
          - getAttribute()
          - invalidate()
          - removeAttribute()
       - application
          - getRealPath()
       - cookie(내장객체는 아니지만 공부해야함)
          - setPath() : 저장경로
          - setMaxAge() : 저장기간, 0이면 삭제
          - getName() : 키를 읽어 올 때 사용
          - getValue() : 값을 읽는 경우
          - new Cookie(키, 값) : 쿠키 생성, 보안에 취약 => 쿠키보다 세션사용
    4. 액션태그
       - <jsp:include> : 계속 사용(tiles가 사라짐), 조립식
    5. 데이터베이스 : DBCP, JDBC => 자바와 오라클 연결
    
    MVC를 위한 준비 : EL / JSTL
    라이브러리 cos.jar - 파일업로드
            commons-dbcp.jar, commos-pool,jar - tomcat
            
    Session / Cookie 301page - 기술면접 96%
    Cookie : 브라우저에 저장
             보안이 취약
             아마존에서 주로 사용(로그인)
             최근 방문, 자동 로그인
     - 저장 : 생성자 이용
             Cookie cookie=new Cookie(String key, String value)
              => 키는 중복불가, 동일한 키가 들어오면 덮어쓴다
     - 저장기간 설정 : setMaxAge(1800) => 초단위
                      ex) 60*60*24 - 24시간
     - 저장 위치 설정 : setPath("/")
     - 브라우저로 전송 : response.addCookie()
     - 키 얻기 : getName()
     - 값 얻기 : getValue()
     - 쿠키 전체 읽기 : request.getCookies()
     
	Session : 서버에 저장(사용자 일부 정보 저장)
	            ex) 상품정보(장바구니), 로그인시 처리
	          데이터를 지속적으로 관리하는 클래스
	 - 저장 : setAttribute()
	 - 저장값 읽기 : getAttribute()
	 - 저장된 데이터를 1개씩 삭제 : removeAttribute()
	 - 저장된 데이터 전체 삭제 : invalidate()
	 - 저장 기간 설정 : 디폴트 30분
	                 setMaxInactiveInterval(초단위)
	 - 세션 고유번호 : getId()
	               사용자마다 세션은 서버에 한개만 생성 => 구분자
	 - 새로운 세션 여부 : isNew()
	 
	 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>