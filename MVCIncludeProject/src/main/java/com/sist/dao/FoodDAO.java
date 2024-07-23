package com.sist.dao;
import java.util.*;
import java.sql.*;
/*
FNO                                       NOT NULL NUMBER
NAME                                      NOT NULL VARCHAR2(200)
TYPE                                      NOT NULL VARCHAR2(200)
PHONE                                              VARCHAR2(30)
ADDRESS                                            VARCHAR2(700)
SCORE                                              NUMBER(2,1)
THEME                                              CLOB
POSTER                                    NOT NULL VARCHAR2(260)
CONTENT                                            CLOB
HIT                                                NUMBER
JJIMCOUNT                                          NUMBER
LIKECOUNT                                          NUMBER 
*/
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao;
	private DbcpConnection dbConn=new DbcpConnection();
	
	public static FoodDAO newInstance() {
		if(dao==null) {
			dao=new FoodDAO();
		}
		return dao;
	}
	
	public List<FoodVO> foodListData(int page){
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT fno, poster, name, type, num "
					+ "FROM (SELECT fno, poster, name, type, rownum as num "
					+ "FROM (SELECT fno, poster, name, type "
					+ "FROM food_house ORDER BY fno ASC)) "
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
				vo.setType(rs.getString(4));
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
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
	public FoodVO foodDetailData(int fno) {
		FoodVO vo=new FoodVO();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT name, type, phone, address, theme, poster, content, score, fno "
					+ "FROM food_house "
					+ "WHERE fno="+fno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setName(rs.getString(1));
			vo.setType(rs.getString(2));
			vo.setPhone(rs.getString(3));
			vo.setAddress(rs.getString(4));
			vo.setTheme(rs.getString(5));
			vo.setPoster(rs.getString(6).replace("https", "http"));
			vo.setContent(rs.getString(7));
			vo.setScore(rs.getDouble(8));
			vo.setFno(rs.getInt(9));
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
}
