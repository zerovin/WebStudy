package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*; //DataSource : 데이터베이스의 모든 정보를 가지고 있다
import javax.naming.*; //Context 이름으로 객체 주소를 찾는다 => lookup()
public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao;
	
	//싱글턴
	public static BoardDAO newInstance() {
		if(dao==null) {
			dao=new BoardDAO();
		}
		return dao;
	}
	
	//미리 오라클을 연결해서 저장해 둔 Connection 주소를 얻어온다
	public void getConnection() {
		
	}
	//사용후에는 반드시 반환 => 재사용
	public void disConnection() {
		
	}
	
	//기능
	//목록출력
	//페이지
	//상세보기
	//글쓰기
	//수정
	//삭제 - 트랜잭션
	//답변 - 트랜잭션
	//검색
}
