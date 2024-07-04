package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.database.*;
/*
NO	NUMBER(38,0)
GOODS_NAME	VARCHAR2(4000 BYTE)
GOODS_SUB	VARCHAR2(4000 BYTE)
GOODS_PRICE	VARCHAR2(26 BYTE)
GOODS_DISCOUNT	NUMBER(38,0)
GOODS_FIRST_PRICE	VARCHAR2(26 BYTE)
GOODS_DELIVERY	VARCHAR2(26 BYTE)
GOODS_POSTER	VARCHAR2(4000 BYTE)
HIT	NUMBER(38,0) 
 */
public class GoodsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static GoodsDAO dao;
	private DataBaseConnection dbConn=new DataBaseConnection();
	private String[] table= {"","goods_all","goods_best","goods_new","goods_special"};
	
	public static GoodsDAO newInstance() {
		if(dao==null) {
			dao=new GoodsDAO();
		}
		return dao;
	}
	
	public List<GoodsVO> goodsListData(int table_num, int page, String word){
		List<GoodsVO> list=new ArrayList<GoodsVO>();
		try {
			conn=dbConn.getConnection();
			if(word==null) {
				String sql="SELECT no, goods_poster, goods_name, goods_discount, goods_price, goods_delivery, num "
						+ "FROM (SELECT no, goods_poster, goods_name, goods_discount, goods_price, goods_delivery, rownum as num "
						+ "FROM (SELECT no, goods_poster, goods_name, goods_discount, goods_price, goods_delivery "
						+ "FROM "+table[table_num]+")) "
						+ "WHERE num BETWEEN ? AND ?";
						//ps.setString을 쓰면 ''가 붙어서 FROM 이후 테이블, 컬럼대입시에는 ?가 아니라 ""끊고 문자열 결합으로 작성
				ps=conn.prepareStatement(sql);
				
				int rowSize=12;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page;
				ps.setInt(1, start);
				ps.setInt(2, end);
			}else {
				String sql="SELECT no, goods_poster, goods_name, goods_discount, goods_price, goods_delivery, num "
						+ "FROM (SELECT no, goods_poster, goods_name, goods_discount, goods_price, goods_delivery, rownum as num "
						+ "FROM (SELECT no, goods_poster, goods_name, goods_discount, goods_price, goods_delivery "
						+ "FROM goods_all "
						+ "WHERE goods_name LIKE '%'||?||'%')) "
						+ "WHERE num BETWEEN ? AND ?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, word);
				int rowSize=12;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page;
				ps.setInt(2, start);
				ps.setInt(3, end);
			}
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				GoodsVO vo=new GoodsVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDiscount(rs.getInt(4));
				vo.setPrice(rs.getString(5));
				vo.setDelivery(rs.getString(6));
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
	public int goodsListTotalPage(int table_num, String word) {
		int totalpage=0;
		String sql;
		try {
			conn=dbConn.getConnection();
			if(word==null) {
				sql="SELECT CEIL(COUNT(*)/12.0) FROM "+table[table_num];
				ps=conn.prepareStatement(sql);
			}else {
				sql="SELECT CEIL(COUNT(*)/12.0) FROM goods_all "
						+ "WHERE goods_name LIKE '%'||?||'%')";
				ps=conn.prepareStatement(sql);
				ps.setString(1, word);
			}
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
	public List<GoodsVO> goodsFindData(String word, int page){
		List<GoodsVO> list=new ArrayList<GoodsVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT no, goods_poster, goods_name, goods_discount, goods_price, goods_delivery, num "
					+ "FROM (SELECT no, goods_poster, goods_name, goods_discount, goods_price, goods_delivery, rownum as num "
					+ "FROM (SELECT no, goods_poster, goods_name, goods_discount, goods_price, goods_delivery "
					+ "FROM goods_all "
					+ "WHERE REGEXT_LIKE(name, ?))) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, word);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				GoodsVO vo=new GoodsVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDiscount(rs.getInt(4));
				vo.setPrice(rs.getString(5));
				vo.setDelivery(rs.getString(6));
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
	
	public int goodsFindTotalPage(String word) {
		int totalpage=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM goods_all "
					+ "WHERE REGEXT_LIKE(name, ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, word);
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
	*/
	//상세
	public GoodsVO goodsDetailData(int no) {
		GoodsVO vo=new GoodsVO();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT no, goods_poster, goods_name, goods_sub, goods_price, goods_discount, goods_delivery, NVL(goods_first_price,' ') "
					+ "FROM goods_all "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setPoster(rs.getString(2));
			vo.setName(rs.getString(3));
			vo.setSub(rs.getString(4));
			vo.setPrice(rs.getString(5));
			vo.setDiscount(rs.getInt(6));
			vo.setDelivery(rs.getString(7));
			vo.setFirstPrice(rs.getString(8));
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
	
}
