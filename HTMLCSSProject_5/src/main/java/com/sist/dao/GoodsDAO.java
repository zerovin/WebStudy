package com.sist.dao;
import java.util.*;
import java.sql.*;
public class GoodsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static GoodsDAO dao;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	//드라이버 등록
	public GoodsDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
	
	//오라클 연결
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL, "hr", "happy");
		}catch(Exception ex) {}
	}
	
	//오라클 해제
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
	
	//싱글턴
	public static GoodsDAO newInstance() {
		if(dao==null) {
			dao=new GoodsDAO();
		}
		return dao;
	}
	
	//목록출력 50개만
	 public List<GoodsVO> goodsListData(){
		 List<GoodsVO> list=new ArrayList<GoodsVO>();
		 try {
			 getConnection();
			 String sql="SELECT no, goods_poster, goods_name, goods_price, rownum "
			 		+ "FROM goods_all "
			 		+ "WHERE rownum<=50";
			 ps=conn.prepareStatement(sql);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				 GoodsVO vo=new GoodsVO();
				 vo.setNo(rs.getInt(1));
				 vo.setPoster(rs.getString(2));
				 vo.setName(rs.getString(3));
				 vo.setPrice(rs.getString(4));
				 
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
	//상세보기 => URL?no=1
	public GoodsVO goodsDetailData(int no) {
		GoodsVO vo=new GoodsVO();
		try {
			getConnection();
			String sql="SELECT no, goods_poster, goods_name, goods_price, goods_sub, goods_delivery, goods_discount "
					+ "FROM goods_all "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setPoster(rs.getString(2));
			vo.setName(rs.getString(3));
			String price=rs.getString(4);
			vo.setPrice(price);
			vo.setSub(rs.getString(5));
			vo.setDelivery(rs.getString(6));
			vo.setDiscount(rs.getInt(7));
			String rp=price.replaceAll("[^0-9]", "");
			vo.setRprice(Integer.parseInt(rp));
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
}
