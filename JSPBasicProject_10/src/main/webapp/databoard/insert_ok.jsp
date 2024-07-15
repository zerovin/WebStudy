<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*, java.io.*"%>
<%--
	사용자가 보내준 데이터를 받아서 처리 후 다시 목록으로 이동
	JSP 
	 1.입력값을 받아서 처리(데이터베이스 처리) 후 이동 => _ok.jsp
	 2.브라우저에 화면 출력
--%>

<%
	request.setCharacterEncoding("UTF-8");
	String path="c:\\upload";
	try{
		File dir=new File(path);
		if(!dir.exists()){
			dir.mkdir();
		}
	}catch(Exception ex){}
	String euctype="UTF-8"; //한글 파일명
	int max=1024*1024*100; //파일의 최대크기는 100MB
	MultipartRequest mr=new MultipartRequest(request, path, max, euctype, new DefaultFileRenamePolicy()); //업로드
	//new DefaultFileRenamePolicy() => 파일명이 같은 경우 파일명 자동 변경 ex) a.jps => a1.jpg => a2.jpg
	String name=mr.getParameter("name");
	String subject=mr.getParameter("subject");
	String content=mr.getParameter("content");
	String pwd=mr.getParameter("pwd");
	String filename=mr.getFilesystemName("upload"); //파일명이 중복일 경우 파일명이 변경되기때문에 실제로 저장된, 변경된 이름으로 불러오기
	DataBoardVO vo=new DataBoardVO();
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	if(filename==null){ //업로드가 없는 경우
		vo.setFilename("");
		vo.setFilesize(0);
	}else{ //업로드가 되는 상태
		File f=new File(path+"\\"+filename);
		vo.setFilename(filename); //실제 저장된 파일명
		vo.setFilesize((int)f.length()); //실제 크기
	}
	
	DataBoardDAO dao=DataBoardDAO.newInstance();
	dao.dataBoardInsert(vo); //데이터베이스에 추가
	
	//이동
	response.sendRedirect("list.jsp");
%>