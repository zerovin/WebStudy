package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.dao.DbcpConnection;
import com.sist.vo.*;
public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao;
	private DbcpConnection dbConn=new DbcpConnection();
	
	public static BoardDAO newInstance() {
		if(dao==null) {
			dao=new BoardDAO();
		}
		return dao;
	}
	
	//목록
	public List<BoardVO> boardListData(int page){
		 List<BoardVO> list=new ArrayList<BoardVO>();
		 //list에 값을 채워서 브라우저로 전송 => Model에서 처리 => Controller가 전송
		 try {
			 conn=dbConn.getConnection();
			 String sql="SELECT no, subject, name, TO_CHAR(regdate, 'YYYY-MM-DD'), hit, num "
			 		+ "FROM (SELECT no, subject, name, regdate, hit, rownum as num "
			 		+ "FROM (SELECT no, subject, name, regdate, hit "
			 		+ "FROM board ORDER BY no DESC)) "
			 		+ "WHERE num BETWEEN ? AND ?";
			 ps=conn.prepareStatement(sql);
			 int rowSize=10;
			 int start=(rowSize*page)-(rowSize-1);
			 int end=rowSize*page;
			 ps.setInt(1, start);
			 ps.setInt(2, end);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				 BoardVO vo=new BoardVO();
				 vo.setNo(rs.getInt(1));
				 vo.setSubject(rs.getString(2));
				 vo.setName(rs.getString(3));
				 vo.setDbday(rs.getString(4));
				 vo.setHit(rs.getInt(5));
				 list.add(vo);
			 }
			 rs.close();
		 }catch(Exception ex) {
			 //에러처리
			 ex.printStackTrace();
		 }finally {
			 //POOL 반환 => 재사용
			 dbConn.disConnection(conn, ps);
		 }
		 return list;
	 }
	 
	//총페이지
	public int boardRowCount() {
		int count=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT COUNT(*) FROM board";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return count;
	}
	
	//글쓰기
	public void boardInsert(BoardVO vo) {
		try {
			conn=dbConn.getConnection();
			String sql="INSERT INTO board VALUES("
					+ "board_no_seq.nextval, ?, ?, ?, ?, SYSDATE, 0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.executeUpdate(); //자동 commit() => INSERT/UPDATE/DELETE
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
	}
	
	/*
	 *  화면 JSP
	 *    - 오라클에 저장 데이터
	 *      공유된 데이터 => SQL
	 *    - 크롤링 / 공공데이터포털 / SNS => API
	 *    
	 *  1차 - 데이터베이스 사용, MVC이해(구조/동작), 자바스크립트 *AWS
	 *  2차 - Spring 이해 / 기능(보안, 스케줄러), MyBatis, 최신 Front => Vue *AWS
	 *  3차 - 신기술 Spring-Boot, MySQL, JPA, Redux, React-Query
	 */
	//상세
	public BoardVO boardDetailData(int no) {
		BoardVO vo=new BoardVO();
		try {
			conn=dbConn.getConnection();
			String sql="UPDATE board SET "
					+ "hit=hit+1 "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			sql="SELECT no, name, subject, content, TO_CHAR(regdate, 'YYYY-MM-DD'), hit "
					+ "FROM board "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDbday(rs.getString(5));
			vo.setHit(rs.getInt(6));
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
	
	//수정
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
			String sql="SELECT pwd FROM board WHERE no="+vo.getNo();
			ps=conn.prepareStatement(sql);
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
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return bCheck;
	}
	
	public boolean boardDelete(int no, String pwd) {
		boolean bCheck=false;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT pwd FROM board WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			if(db_pwd.equals(pwd)) {
				bCheck=true;
				sql="DELETE FROM board WHERE no="+no;
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return bCheck;
	}
}
