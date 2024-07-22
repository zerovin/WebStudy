package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao;
	
	public static BoardDAO newInstance() {
		if(dao==null) {
			dao=new BoardDAO();
		}
		return dao;
	}
	
	public void getConnection() {
		try {
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public void disConnection() {
		try {
			//POOL 안으로 반환 => 재사용
			if(ps!=null) {
				ps.close();
			}
			if(conn!=null) {
				conn.close();
			}
		}catch(Exception ex) {}
	}
	
	//관련된 기능을 한개의 클래스로 => 메소드화 => 응집성
	//목록 출력
	public List<BoardVO> boardListData(int page){
		List<BoardVO> list=new ArrayList<BoardVO>();
		try {
			getConnection();
			String sql="SELECT no, subject, name, TO_CHAR(regdate, 'YYYY-MM-DD'), hit, group_tab, num "
					+ "FROM (SELECT no, subject, name, regdate, hit, group_tab, rownum as num "
					+ "FROM (SELECT no, subject, name, regdate, hit, group_tab "
					+ "FROM replyboard ORDER BY group_id DESC, group_step ASC)) "
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
				vo.setGroup_tab(rs.getInt(6));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	//전체 row의 개수
	public int boardRowCount() {
		int count=0;
		try {
			getConnection();
			String sql="SELECT COUNT(*) FROM replyboard";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return count;
	}
	//글쓰기
	public void boardInsert(BoardVO vo) {
		try {
			getConnection();
			String sql="INSERT INTO replyboard(no, name, subject, content, pwd, group_id) "
					+ "VALUES(rb_no_seq.nextval, ?, ?, ?, ?, "
					+ "(SELECT NVL(MAX(group_id)+1,1) FROM replyboard))";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
	}
	//상세
	// DML INSERT / UPDATE / DELETE 여러개 사용시 트랜잭션
	public BoardVO boardDetailData(int no) {
		BoardVO vo=new BoardVO();
		try {
			getConnection();
			String sql="UPDATE replyboard SET "
					+ "hit=hit+1 "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			
			sql="SELECT no, name, subject, content, hit, TO_CHAR(regdate, 'YYYY-MM-DD') "
					+ "FROM replyboard "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setHit(rs.getInt(5));
			vo.setDbday(rs.getString(6));
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
	//답변 => 트랜잭션 - 금융권, 공기업 => 일괄처리
	//최신답변이 가장 위에 배치 
	//같은 답을 가지고 있는 경우, 먼저 INSERT된 내용이 먼저 출력
	/*
	 *                     no     group_id     group_step     group_tab      root      depth
	 *  AAAAAAAAAAA        1          1            0              0           0          2
	 *   => BBBBBBB        2          1            2              1           1          1
	 *      => CCCCCCCCC   3          1            3              2           2          0
	 *   => KKKKKKKKK      6          1            1              1           1          0
	 *  DDDDDDDDD          4          2            0              0           0          1
	 *   => EEEEEEEE       5          2            1              1           4          0
	 */
	public void boardReplyInsert(int pno, BoardVO vo) {
		try {
			getConnection();
			conn.setAutoCommit(false);
			
			//답변 대상의 group_id, group_step, group_tab => SELECT
			String sql="SELECT group_id, group_step, group_tab "
					+ "FROM replyboard "
					+ "WHERE no="+pno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int groupId=rs.getInt(1);
			int groupStep=rs.getInt(2);
			int groupTab=rs.getInt(3);
			rs.close();
			
			//group_step 증가 => UPDATE => 대댓글 문장출력순서 핵심
			sql="UPDATE replyboard SET "
					+ "group_step=group_step+1 "
					+ "WHERE group_id=? AND group_step>?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, groupId);
			ps.setInt(2, groupStep);
			ps.executeUpdate();
			
			//insert => INSERT
			sql="INSERT INTO replyboard(no, name, subject, content, pwd, group_id, group_step, group_tab, root) "
					+ "VALUES(rb_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.setInt(5, groupId);
			ps.setInt(6, groupStep+1);
			ps.setInt(7, groupTab+1);
			ps.setInt(8, pno);
			ps.executeUpdate();
			
			//depth 증가 => UPDATE
			sql="UPDATE replyboard SET "
					+ "depth=depth+1 "
					+ "WHERE no="+pno;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			//정상 수행
			conn.commit();
		}catch(Exception ex) {
			try {
				//비정상 => SQL문장이 틀린 경우
				conn.rollback(); //전체 취소
			}catch(Exception e){
				ex.printStackTrace();
			}
		}finally {
			try {
				conn.setAutoCommit(true);
				disConnection();
			}catch(Exception ex) {}
		}
	}
	//수정
	public BoardVO boardUpdateData(int no) {
		BoardVO vo=new BoardVO();
		try {
			getConnection();
			String sql="SELECT no, name, subject, content "
					+ "FROM replyboard "
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
			disConnection();
		}
		return vo;
	}
}
