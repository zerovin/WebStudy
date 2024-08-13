package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class SeoulDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	/*
	<select id="seoulLocationListData" resultType="SeoulLocationVO" parameterType="hashmap">
		SELECT no, title, poster, num
		FROM (SELECT no, title, poster, rownum as num 
		FROM (SELECT no, title, poster 
		FROM location ORDERY BY no ASC))
		WHERE num BETWEEN #{start} AND #{end}
	</select>
	 */
	public static List<SeoulLocationVO> seoulLocationListData(Map map){
		List<SeoulLocationVO> list=new ArrayList<SeoulLocationVO>();
		SqlSession session=null;
		try {
			//연결
			session=ssf.openSession();
			list=session.selectList("seoulLocationListData", map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return list;
	}
	
	/*
	<select id="seoulLocationTotalPage" resultType="int">
		SELECT CEIL(COUNT(*)/20.0) FROM location
	</select> 
	 */
	public static int seoulLocationTotalPage() {
		int total=0;
		SqlSession session=null;
		try {
			//연결
			session=ssf.openSession();
			total=session.selectOne("seoulLocationTotalPage");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return total;
	}
	
	public static List<SeoulNatureVO> seoulNatureListData(Map map){
		List<SeoulNatureVO> list=new ArrayList<SeoulNatureVO>();
		SqlSession session=null;
		try {
			//연결
			session=ssf.openSession();
			list=session.selectList("seoulNatureListData", map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return list;
	}
	
	public static int seoulNatureTotalPage() {
		int total=0;
		SqlSession session=null;
		try {
			//연결
			session=ssf.openSession();
			total=session.selectOne("seoulNatureTotalPage");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return total;
	}
	
	public static List<SeoulShopVO> seoulShopListData(Map map){
		List<SeoulShopVO> list=new ArrayList<SeoulShopVO>();
		SqlSession session=null;
		try {
			//연결
			session=ssf.openSession();
			list=session.selectList("seoulShopListData", map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return list;
	}
	
	public static int seoulShopTotalPage() {
		int total=0;
		SqlSession session=null;
		try {
			//연결
			session=ssf.openSession();
			total=session.selectOne("seoulShopTotalPage");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return total;
	}
}
