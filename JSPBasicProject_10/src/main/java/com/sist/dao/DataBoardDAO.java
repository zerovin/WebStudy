package com.sist.dao;
/*
 *  DBCP - 보안
 *         Connection을 효율적으로 관리(POOL)
 *         연결에 소모되는 시간 절약
 *         한번에 접속자가 많이 있어도 쉽게 서버다운이 되지 않는다
 *         웹 개발에 일반화 - 실무 대부분에서 사용
 *                        홈페이지, 개인기업 (일반 JDBC)
 *                        공기업, 금융권, 포털 (DBCP)
 *         MyBatis / JPA - DBCP사용, 라이브러리로 제작
 */
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class DataBoardDAO {
	// 오라클 연결 객체 => DBCP(연결에만 사용)
	private Connection conn;
	private PreparedStatement ps; //SQL문장 오라클과 송수신
	private static DataBoardDAO dao; //싱글턴
	
	// 싱글턴 => 객체 생성
	// static => 메모리 공간 한개만 설정 가능
	public static DataBoardDAO newInstance() {
		if(dao==null) {
			dao=new DataBoardDAO();
		}
		return dao;
	}
	
	// 미리 연결해서 저장된 POOL안의 Connection 주소값을 얻어온다
	public void getConnection() {
		try {
			//JNDI (Java Naming Directory Interface) - 메모리 주소를 탐색기 형식으로 제작
			//탐색기 생성
			Context init=new InitialContext();
			//C드라이버 => java://comp//env
			Context c=(Context)init.lookup("java://comp//env");			
			//jdbc/oracle이란 이름의 Connection 주소를 찾아온다
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			//이름으로 객체 찾기 => lookup()
			conn=ds.getConnection();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	// Connection 반환
	public void disConnection() {
		try {
			if(ps!=null) {
				ps.close();
			}
			if(conn!=null) {
				conn.close(); // Connection 반환
			}
			/*
			 * commons-dbcp.jar(Apache)
			 * commons-pool.jar
			 * ===> tomcat > lib 에 넣어놔야 pool 사용가능
			 */
		}catch(Exception ex) {}
	}
	
	//목록
	public List<DataBoardVO> dataBoardListData(int page){
		//DataBoardVO - 자료실 게시물 한개에 대한 모든 정보
		//매개변수 int page = 사용자가 요청한 값
		//리턴형 - 결과값을 브라우저로 전송
		List<DataBoardVO> list=new ArrayList<DataBoardVO>();
		try {
			getConnection();
			String sql="SELECT no, subject, name, TO_CHAR(regdate, 'YYYY-mm-dd'), hit, num "
					+ "FROM (SELECT no, subject, name, regdate, hit, rownum as num "
					+ "FROM (SELECT /*+ INDEX_DESC(databoard db_no_pk)*/no, subject, name, regdate, hit "
					+ "FROM databoard)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				DataBoardVO vo=new DataBoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
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
	//페이징
	public int dataBoardRowCount() {
		int count=0;
		try {
			getConnection();
			String sql="SELECT COUNT(*) FROM databoard";
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
	//상세보기 - 다운로드
	public DataBoardVO dataBoardDetailData(int no) {
		DataBoardVO vo=new DataBoardVO();
		try {
			getConnection();
			//조회수 증가
			String sql="UPDATE databoard SET "
					+ "hit=hit+1 "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			
			//실제 데이터를 읽어온다
			sql="SELECT no, name, subject, content, hit, TO_CHAR(regdate, 'YYYY-MM-DD'), filename, filesize "
					+ "FROM databoard "
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
			vo.setFilename(rs.getString(7));
			vo.setFilesize(rs.getInt(8));
			rs.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
	//글쓰기 - 업로드
	public void dataBoardInsert(DataBoardVO vo) {
		try {
			getConnection();
			String sql="INSERT INTO databoard(no, name, subject, content, pwd, filename, filesize) "
					+ "VALUES(db_no_seq.nextval, ?, ?, ?, ?, ?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.setString(5, vo.getFilename());
			ps.setInt(6, vo.getFilesize());
			
			//실행
			ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
	}
	//수정 - 수정페이지 데이터 출력
	public DataBoardVO dataBoardUpdateData(int no) {
		DataBoardVO vo=new DataBoardVO();
		try {
			getConnection();
			//조회수 증가
			String sql="SELECT no, name, subject, content "
					+ "FROM databoard "
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
	//수정 - 파일 변경시 처리
	public void dataBoardUpdate(DataBoardVO vo) {
		try {
			getConnection();
			String sql="UPDATE databoard SET "
					+ "name=?, subject=?, content=? "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setInt(4, vo.getNo());
			ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
	}
	//데이터 삭제 전 첨부파일 정보 읽기 => 파일을 폴더에서 삭제
	public DataBoardVO dataBoardFileInfoData(int no) {
		DataBoardVO vo=new DataBoardVO();
		try {
			getConnection();
			String sql="SELECT filename, filesize "
					+ "FROM databoard "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setFilename(rs.getString(1));
			vo.setFilesize(rs.getInt(2));
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
	//삭제 - 파일 삭제
	public String dataBoardDelete(int no, String pwd) {
		String result="";
		try {
			getConnection();
			String sql="SELECT pwd FROM databoard "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();			
			if(db_pwd.equals(pwd)) {
				result="yes";
				sql="DELETE FROM databoard "
						+ "WHERE no="+no;
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
			}else {
				result="no";
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return result;
	}
}
