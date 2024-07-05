package com.sist.dao;
/*
 *  클래스의 종류 (역할) - 클래스는 한개의 기능을 수행 => 컴포넌트
 *  
 *  VO => 데이터를 모아서 한번에 브라우저 / 모바일로 전송
 *  DAO => 데이터베이스 연동
 *  Manager => 관리 => 데이터수집 / Open API
 *  Service => 사용자 요청에 대한 처리
 *  Model(Controller) => 사용자 요청을 받아서 결과 전송
 *  ===================== MVC (Spring MVC)
 */
import java.util.*;
import com.sist.database.DataBaseConnection;
import java.sql.*;
/*
 *              JSP프로젝트      Spring프로젝트    Spring-Boot(개인프로젝트)
 *	JDBC ========> DBCP =========> ORM =========> DataSet
 *  기본           연결속도      라이브러리(DB만 연결)  자동SQL문장 생성(JPA)
 *             Connection관리     MyBatis         
 *             
 *  자격요건 : Spring(Java+JSP+Oracle), jQuery|Vue|React, MySQL, Spring-Boot, AWS => FullStack
 *  우대사항 : 리눅스, 정보처리, DevOps(개발+운영=Docker/쿠바네티스/젠킨스)-실시간 배포CI/CD
 *  
 *  프로그램 => 데이터 관리 - 변수(배열/클래스/파일/RDBMS), 연산자, 제어문 이용
 */
public class FoodDAO {
	private Connection conn; //오라클 연결 담당
	private PreparedStatement ps; //SQL문장 전송 => 실행결과를 가지고 온다
	//      미리 SQL문장ㅇ르 전송하고 필요한 데이터는 나중에 전송 한다
	private static FoodDAO dao;
	//싱글턴 - 메모리 공간을 1개만 사용 => 메모리 누수현상 방지, Connection을 남발하지 않는다 => 서버 부하 방지
	private DataBaseConnection dbConn=new DataBaseConnection();
	// 연결/해제 => 50명 => 모든 데이터 베이스에서 공통 사용 => 라이브러리화
	
	//싱글턴
	public static FoodDAO newInstance() {
		if(dao==null) {
			dao=new FoodDAO();
		}
		return dao;
	}
	
	//기능 수행
	public List<FoodVO> foodListData(){
		List<FoodVO> list=new ArrayList<FoodVO>();
		/*
		 *  예외처리
		 *  java.sql, java.io, java.net => 컴파일 예외(반드시 예외처리) 
		 */
		try {
			//연결
			conn=dbConn.getConnection();
			//SQL문장 제작
			String sql="SELECT fno, name, poster, rownum "
					+ "FROM food_house "
					+ "WHERE rownum<=20";
			//SQL문장 전송
			ps=conn.prepareStatement(sql);
			//필요한 데이터 있는지 확인 => ?
			//오라클에서 실행된 결과값을 받는다
			ResultSet rs=ps.executeQuery();
			//List에 첨부
			while(rs.next()) {
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3).replace("https","http"));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			System.out.println("======= foodListData() 오류 발생 =======");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
}
