<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	pageContext - 파일 연결, 흐름제어
	 - 클래스명 : PageContext
	 1) 내장객체 얻기
	    - getRequest() : request 객체를 얻어오는 경우
	    - getResponse(), getOut(), getSession()
	    
	      request.getParameter() ==> 얘가 간단하니까 주로 얘 사용
	      pageContext.getReqeust().getParameter()
	 2) 흐름제어*****
	    - include() => <jsp:include> => pageContext.include("파일명")
	      main._jspServiece(request){
	          a._jspService()
	          b._jspService()
	          c._jspService()
	      }
	    - forward() => <jsp:forward>
	       a._jspService(HttpServletRequesr request){
	          b._jspService() => request 공유를 위해서 _jspService()안에 )_jspService() 또 호출
	       }
	    =====> request 공유 가능
	    
	 
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