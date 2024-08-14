package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class NoticeDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	//목록출력
	/*
	<select id="noticeListData" resultType="NoticeVO" parameterType="hashmap">
		SELECT no, subject, name, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, hit, num
		FROM (SELECT no, subject, name, regdate, hit, rownum as num
		FROM (SELECT no, subject, name, regdate, hit
		FROM notice ORDER BY no DESC))
		WHERE num BETWEEN #{start} AND #{end}
	</select> 
	 */
	public static List<NoticeVO> noticeListData(Map map){
		List<NoticeVO> list=new ArrayList<NoticeVO>();
		//Connection => SqlSession
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("noticeListData", map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close(); //DBCP 반환 재사용
			}
		}
		return list;
	}
	
	//공지추가
	/*
	 <insert id="noticeInsert" parameterType="NoticeVO">
		<!-- 시퀀스 -->
		<selectKey keyProperty="no" resultType="int" order="BEFORE">
			SELECT NVL(MAX(no)+1,1) as no FROM notice
		</selectKey>
		INSERT INTO notice(no, type, subject, content)
		VALUES(#{no}, #{type}, #{subject}, #{content})
	</insert> 
	 */
	public static void noticeInsert(NoticeVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("noticeInsert", vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close(); //DBCP 반환 재사용
			}
		}
	}
	
	//공지사항 총 개수 => 순차적 번호 출력
	/*
	<select id="noticeRowCount" resultType="int">
		SELECT COUNT(*) FROM notice 
	</select> 
	 */
	public static int noticeRowCount() {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("noticeRowCount");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close(); //DBCP 반환 재사용
			}
		}
		return count;
	}
	
	/*
	 <select id="noticeTop5Data" resultType="NoticeVO">
		SELECT no, type, subject, rownum
		FROM (SELECT no, type, subject
		FROM notice ORDER BY hit DESC)
		WHERE rownum&lt;=5
	</select> 
	 */
	public static List<NoticeVO> noticeTop5Data(){
		List<NoticeVO> list=new ArrayList<NoticeVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("noticeTop5Data");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return list;
	}
	
	// 수정 / 상세보기
	/*
	 <select id="noticeUpdateData" resultType="NoticeVO" parameterType="int">
		SELECT no, type, hit, name, subject, content, TO_CHAR(regdate, 'YYYY-MM-DD HH24:00:00) as dbday FROM notice
		WHERE no=#{no}
	</select> 
	 */
	public static NoticeVO noticeUpdateData(int no) {
		NoticeVO vo=new NoticeVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("noticeUpdateData", no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return vo;
	}
	
	/*
	 <update id="noticeUpdate" parameterType="NoticeVO">
		UPDATE notice SET
		type=#{type}, subject=#{subject}, content=#{content}
		WHERE no=#{no}
	</update> 
	 */
	public static void noticeUpdate(NoticeVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("noticeUpdate", vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}
	
	/*
	<delete id="noticeDelete" parameterType="int">
		DELETE FROM notice
		WHERE no=#{no}
	</delete> 
	 */
	public static void noticeDelete(int no) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.delete("noticeDelete", no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}
	
	/*
	 <update id="noticeHitIncrement" parameterType="int">
		UPDATE notice SET
		hit=hit+1
		WHERE no=#{no}
	</update> 
	 */
	public static NoticeVO noticeDetailData(int no) {
		NoticeVO vo=new NoticeVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("noticeHitIncrement", no);
			session.commit();
			vo=session.selectOne("noticeUpdateData", no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return vo;
	}
}
