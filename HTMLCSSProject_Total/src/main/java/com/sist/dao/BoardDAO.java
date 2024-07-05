package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.database.*;
/*
 NO                                        NOT NULL NUMBER
 NAME                                      NOT NULL VARCHAR2(51)
 SUBJECT                                   NOT NULL VARCHAR2(4000)
 CONTENT                                   NOT NULL CLOB
 PWD                                       NOT NULL VARCHAR2(10)
 REGDATE                                            DATE
 HIT                                                NUMBER  
 */
public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao;
	private DataBaseConnection dbConn=new DataBaseConnection();
	
	public static BoardDAO newInstance() {
		if(dao==null) {
			dao=new BoardDAO();
		}
		return dao;
	}
	
	//목록 SELECT, paging(인라인뷰) <table><a>
	public List<BoardVO> boardListDate(int page){
		List<BoardVO> list=new ArrayList<BoardVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT no, subject, name, TO_CHAR(regdate, 'YYYY-MM-DD'), hit, num "
					+ "FROM (SELECT no, subject, name, regdate, hit, rownum as num "
					+ "FROM (SELECT /*+ INDEX_DESC(board board_no_pk)*/no, subject, name, regdate, hit "
					+ "FROM board)) "
					+ "WHERE num BETWEEN ? AND ?";
			        //ORDER BY 보다 /*+ INDEX_ASC(테이블명 pk명)*/가 더 빠르다
			        //index는 pk, uk 자동 생성
			//오라클 전송
			ps=conn.prepareStatement(sql);
			//실행 전에 ?가 있는 경우 값을 채운다
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			//실행을 요청하고 결과값을 받는다
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				BoardVO vo=new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDb_day(rs.getString(4));
				vo.setHit(rs.getInt(5));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			System.out.println("======= boardListData(int page) 오류발생 =======");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	//총 페이지
	public int boardTotalPage() {
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT COUNT(*) FROM board";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			System.out.println("===== boardTotalPage() 오류 발생 =====");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
	//상세 UPDATE(조회수), SELECT(WHERE) <table>
	//반드시 primary key 값을 넘겨준다 (중복이 없는 데이터)
	public BoardVO boardDetailData(int no) {
		BoardVO vo=new BoardVO();
		try {
			conn=dbConn.getConnection();
			String sql="UPDATE board SET "
					+ "hit=hit+1 "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate(); //조회수 증가 => commit()
			
			sql="SELECT no, name, subject, content, TO_CHAR(regdate,'YYYY-MM-DD'), hit "
					+ "FROM board "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDb_day(rs.getString(5));
			vo.setHit(rs.getInt(6));
			rs.close();
		}catch(Exception ex) {
			System.out.println("===== boardDetailData(int no) =====");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
	//글쓰기 INSERT <input>
	public void boardInsert(BoardVO vo) {
		try {
			conn=dbConn.getConnection();
			String sql="INSERT INTO board Values("
					+ "board_no_seq.nextval, ?, ?, ?, ?, SYSDATE, 0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			
			//실행요청
			ps.executeUpdate();
		}catch(Exception ex) {
			System.out.println("===== boardInset(BoardVO vo) ======");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
	}
	
	//수정 UPDATE <input>
	public BoardVO boardUpdateData(int no) {
		BoardVO vo=new BoardVO();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT no, name, subject, content "
					+ "FROM board "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			rs.close();
		}catch(Exception ex) {
			System.out.println("===== boardUpdateData(int no) =====");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
	public boolean boardUpdate(BoardVO vo) {
		boolean bCheck=false;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT pwd FROM board "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			if(db_pwd.equals(vo.getPwd())) {
				bCheck=true;
				sql="UPDATE board SET "
						+ "name=?, subject=?, content=? "
						+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getContent());
				ps.setInt(4, vo.getNo());
				ps.executeUpdate();
			}else {
				bCheck=false;
			}
		}catch(Exception ex) {
			System.out.println("===== boardUpdate(BoardVO vo) 오류발생 =====");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return bCheck;
	}
	//삭제 DELETE <input>
	public boolean boardDelete(int no, String pwd) {
		boolean bCheck=false;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT pwd FROM board "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			if(db_pwd.equals(pwd)) {
				bCheck=true;
				sql="DELETE FROM board "
						+ "WHERE no="+no;
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
			}else {
				bCheck=false;
			}
		}catch(Exception ex) {
			System.out.println("===== boardDelete(int no, String pwd) 오류발생 =====");
			ex.printStackTrace();
		}finally{
			dbConn.disConnection(conn, ps);
		}
		return bCheck;
	}
	
	//검색 SELECT <select>
	public List<BoardVO> boardFindData(String cate, String word, int page){
		List<BoardVO> list=new ArrayList<BoardVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT no, subject, name, TO_CHAR(regdate, 'YYYY-MM-DD'), hit, num "
					+ "FROM (SELECT no, subject, name, regdate, hit, rownum as num "
					+ "FROM (SELECT /*+ INDEX_DESC(board board_no_pk)*/no, subject, name, regdate, hit "
					+ "FROM board WHERE "+cate+" LIKE '%'||?||'%')) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, word);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				BoardVO vo=new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDb_day(rs.getString(4));
				vo.setHit(rs.getInt(5));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			System.out.println("===== boardFindData(String cate, String word) 오류발생 =====");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	public int boardFindTotalPage(String cate, String word) {
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT COUNT(*) FROM board "
					+ "WHERE "+cate+" LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, word);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
}
