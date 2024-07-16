package com.sist.dao;
import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao;
	
	public static FoodDAO newInstance() {
		if(dao==null) {
			dao=new FoodDAO();
		}
		return dao;
	}
	
	public void getConnection() {
		try {
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp//env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public void disConnection() {
		try {
			if(ps!=null) {
				ps.close();
			}
			if(conn!=null) {
				conn.close();
			}
		}catch(Exception ex) {}
	}
	
	public List<FoodVO> foodListData(int page){
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			getConnection();
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
				vo.setPoster(rs.getString(2).replace("https","http"));
				vo.setName(rs.getString(3));
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
	public int foodTotalPage() {
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM food_house";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return total;
	}
	
	/*
	private int fno;
	private String name, type, phone, address, theme, poster, content;
	private double score; 
	 */
	public FoodVO foodDetailData(int fno) {
		FoodVO vo=new FoodVO();
		try {
			getConnection();
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
			disConnection();
		}
		return vo;
	}
}
