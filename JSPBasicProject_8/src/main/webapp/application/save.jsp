<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String path="C:\\webDev\\webStudy\\JSPBasicProject_8\\src\\main\\webapp\\application";
	String path=application.getRealPath("/application");
	String euctype="UTF-8";
	int max=1024*1024*100; //100MB
	
	//cos.jar - 파일 업로드 라이브러리 (com.oreilly.servlet)
	MultipartRequest mr=new MultipartRequest(request, path, max, euctype, new DefaultFileRenamePolicy());
	//new DefaultFileRenamePolicy() - 파일명이 같은 경우 파일명 1씩 증가
	
	String fn=mr.getOriginalFileName("upload"); //name=upload에 등록되는 파일명 읽어오기
	response.sendRedirect("output.jsp?fn="+fn);
%>
