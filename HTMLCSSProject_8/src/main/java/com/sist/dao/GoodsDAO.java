package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.database.*;
public class GoodsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static GoodsDAO dao;
	private DataBaseConnection dbConn=new DataBaseConnection();
	
	//싱글턴
	public static GoodsDAO newInstance() {
		if(dao==null) {
			dao=new GoodsDAO();
		}
		return dao;
	}
	
	//목록 출력
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
	
	//총 페이지 
	public int goodsTotalPage() {
		int totalpage=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM goods_all";
			ps=conn.prepareStatement(sql);
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
	//목록 데이터
	public List<GoodsVO> goodsListData(int page) {
		List<GoodsVO> list=new ArrayList<GoodsVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT no, goods_poster, goods_name, goods_discount, goods_price, goods_delivery, NVL(goods_first_price,' '), num "
					+ "FROM (SELECT no, goods_poster, goods_name, goods_discount, goods_price, goods_delivery, goods_first_price, rownum as num "
					+ "FROM (SELECT /*+ INDEX_ASC(goods_no goods_no_pk)*/no, goods_poster, goods_name, goods_discount, goods_price, goods_delivery, goods_first_price "
					+ "FROM goods_all)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				GoodsVO vo=new GoodsVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDiscount(rs.getInt(4));
				vo.setPrice(rs.getString(5));
				vo.setDelivery(rs.getString(6));
				vo.setFirstPrice(rs.getString(7));
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
