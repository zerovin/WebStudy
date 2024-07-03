package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.database.*;
public class FoodDAO {
	private Connection conn; //연결담당
	private PreparedStatement ps; //SQL문장 송수신 => SQL문장을 전송하고 결과값을 받는다
	private static FoodDAO dao; //싱글턴
	private DataBaseConnection dbConn=new DataBaseConnection();
	
	//라이브러리 형식 .jar 보안이 뛰어남
	
	//싱글턴
	public static FoodDAO newInstance() {
		if(dao==null) {
			dao=new FoodDAO();
		}
		return dao;
	}
	
	//기능
	/*
	 * 사용자가 페이지를 선택하면 오라클에 저장된 데이터 중 페이지에 해당되는 데이터를 보낸다
	 * List, VO, int, String, void
	 *   목록출력 => List
	 *   상세보기 => VO
	 *   총페이지, 검색개수...확인 => int
	 *   조건, 아이디, 비번... => String
	 *   
	 *   1.데이터 설계 => DDL(CREATE, ALTER, RENAME, DROP, TRUNCATE)
	 *   2.프로그램 구현 => DML
	 *     SELECT : 목록출력 / 상세보기 / 데이터 검색
	 *              => 페이징 - 인라인뷰
	 *              => 예약/구매 - JOIN / SUBQUERY
	 *              => 사용자 -----예약(매핌테이블)----- 맛집
	 *     UPDATE : 조회수 증가 / 찜 증가 / 좋아요 증가
	 *     DELETE : 회원탈퇴 / 구매취소 / 예약취소
	 *     INSERT : 회원가입 / 장바구니 / 예약
	 */
	public List<FoodVO> foodListData(int page){
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT fno, poster, name, num "
					+ "FROM (SELECT fno, poster, name, rownum as num "
					+ "FROM (SELECT /*+ INDEX_ASC(food_house fh_fno_pk)*/fno, poster, name "
					+ "FROM food_house)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	
	public int foodTotalPage() {
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM food_house";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);;
		}
		return total;
	}
	
	//상세보기
	public FoodVO foodDetailData(int fno) {
		FoodVO vo=new FoodVO();
		try {
			conn=dbConn.getConnection();
			String sql="UPDATE food_house SET "
					+ "hit=hit+1 "
					+ "WHERE fno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fno);
			ps.executeUpdate();
			
			sql="SELECT fno, name, type, phone, address, theme, poster, content, score "
					+ "FROM food_house "
					+ "WHERE fno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setFno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setType(rs.getString(3));
			vo.setPhone(rs.getString(4));
			vo.setAddress(rs.getString(5));
			vo.setTheme(rs.getString(6));
			vo.setPoster(rs.getString(7).replace("https", "http"));
			vo.setContent(rs.getString(8));
			vo.setScore(rs.getDouble(9));
			rs.close();
		}catch(Exception ex) {
			System.out.println("===== foodDetailData() 오류 =====");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
}
