package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class SeoulDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static SeoulDAO dao;
	
	//싱글턴
	public static SeoulDAO newInstance() {
		if(dao==null) {
			dao=new SeoulDAO();
		}
		return dao;
	}
	
	//톰캣이 미리 생성한 Connection의 주소를 읽어서 사용
	//POOL 영역에 10개 생성(maxIdle)
	public void getConnection() {
		try {
			Context init=new InitialContext(); //탐색기 열기
			Context c=(Context)init.lookup("java://comp//env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
			//보안우수 - server.xml은 서버 관리자만 볼 수 있다
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	//반환 => POOL (Connection 객체 관리 영역)
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
	
	public List<LocationVO> seoulLocationListData(int page){
		List<LocationVO> list=new ArrayList<LocationVO>();
		try {
			getConnection();
			String sql="SELECT no, title, poster, num "
					+ "FROM (SELECT no, title, poster, rownum as num "
					+ "FROM (SELECT /*+ INDEX_ASC(seoul_location sl_no_pk)*/no, title, poster "
					+ "FROM seoul_location)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				LocationVO vo=new LocationVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
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
	public int seoulLocationTotalPage() {
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM seoul_location";
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
}
