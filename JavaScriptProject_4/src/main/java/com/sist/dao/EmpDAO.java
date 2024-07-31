package com.sist.dao;
import java.util.*;
import java.io.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
public class EmpDAO {
	//XML 파싱
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public static List<EmpVO> empListData(){
		List<EmpVO> list=new ArrayList<EmpVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("empListData");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close(); //Connection 반환
			}
		}
		return list; 
		//return ssf.openSession().selectList("empListData"); //emp-mapper <select id="empListData"> id값 입력
		//try~catch절 안쓰면 ↑ 이렇게 출력, 메모리 자동반환 안될시 일정 수 이후 작동 안 할 수도 있음
		// VO여러개를 list로 받으면 => selectList
	}
	
	//<select id="empDetailData" resultType="EmpVO" parameterType="int">
	public static EmpVO empDetailData(int empno) {
		EmpVO vo=new EmpVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("empDetailData", empno);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close(); //Connection 반환
			}
		}
		return vo;
		//return ssf.openSession().selectOne("empDetailData", empno);
		// VO 한개를 받으면 => selectOne
	}
	
}
