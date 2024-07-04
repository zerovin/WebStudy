package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.database.*;
/*
 *  1.오라클 연결 => TCP
 *    Connection : Socket => IP/PORT
 *  
 *  2.SQL문장 전송 / 수신
 *    PrparedStatement : BufferedReader - ResultSet => 브라우저 전송 : List/VO
 *                       OutputStream - executeQuery, executeUpdate
 *               브라우저에서 요청 => 요청값 받기 request => BufferedReader
 *    브라우저 <--------------------> 서버 (DAO, JSP)
 *              서버에서 응답(HTML) => response => OutputStream
 *    네트워크 : 서버 / 클라이언트
 *             오라클, 웹(톰캣)은 이미 서버가 만들어져있음 => 클라이언트 제작
 *    !!순서, SQL문장!!
 *    
 *  JSP
 *   1)오라클로부터 데이터 읽기
 *     <% %>
 *   2)데이터를 HTML로 출력
 *     
 */
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private DataBaseConnection dbConn=new DataBaseConnection();
	private static FoodDAO dao;
	private String[] mode= {"","한식","중식","양식","일식"};
	
	public static FoodDAO newInstance() {
		if(dao==null) {
			dao=new FoodDAO();
		}
		return dao;
	}
	
	public List<FoodVO> foodFindData(String addr, int page){
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT fno, name, poster, num "
					+ "FROM (SELECT fno, name, poster, rownum as num "
					+ "FROM (SELECT fno, name, poster "
					+ "FROM food_house "
					+ "WHERE address LIKE '%'||?||'%')) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setString(1, addr);
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3).replace("https", "http"));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			System.out.println("===== foodFindData() 오류 발생 =====");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	public int foodFindTotalPage(String addr) {
		int totalpage=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM food_house "
					+ "WHERE address LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, addr);
			ResultSet rs=ps.executeQuery();
			rs.next();
			totalpage=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return totalpage;
	}
	
	/*
	 *  INSERT : 게시판 글쓰기, 댓글, 회원가입, 장바구니, 예약
	 *  UPDATE : 게시판, 댓글, 회원가입, 장바구니, 예약 수정
	 *  DELETE : 게시판, 댓글 삭제, 회원탈퇴, 장바구니, 예약 취소
	 *  SELECt : 나머지 
	 */
	//종류별 분리
	public List<FoodVO> foodListData(int type, int page){
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT fno, name, poster, num "
					+ "FROM (SELECT fno, name, poster, rownum as num "
					+ "FROM (SELECT fno, name, poster "
					+ "FROM food_house "
					+ "WHERE type LIKE '%'||?||'%')) "
					+ "WHERE num BETWEEN ? AND ?";
			/*
			String sql="SELECT fno, name, poster, num "
					+ "FROM (SELECT fno, name, poster, rownum as num "
					+ "FROM (SELECT fno, name, poster "
					+ "FROM food_house "
					+ "WHERE REGEXP_LIKE(type,?))) "
					+ "WHERE num BETWEEN ? AND ?";
			        // rownum은 Top-N => 처음부터만 가능 중간에서는 바꾸지 못하기 때문에 인라인뷰로 새목록에 rownum부여
			*/
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setString(1, mode[type]);
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				list.add(vo);
			}
			rs.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);;
		}
		return list;
	}
	
	public int foodListTotalPage(int type) {
		int totalpage=0;
			try {
				conn=dbConn.getConnection();
				String sql="SELECT CEIL(COUNT(*)/12.0) "
						+ "FROM food_house "
						+ "WHERE type LIKE '%'||?||'%'";
				ps=conn.prepareStatement(sql);
				ps.setString(1, mode[type]);
				ResultSet rs=ps.executeQuery();
				rs.next();
				totalpage=rs.getInt(1);
				rs.close();	
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				dbConn.disConnection(conn, ps);
			}
		return totalpage;
	}
}
