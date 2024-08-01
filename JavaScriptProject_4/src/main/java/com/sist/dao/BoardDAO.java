package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
/*
 *  디벨로퍼 : 조립자 => SI/SM
 *  개발자 : 제작자 => 솔루션, 스타트업
 *  코더 : 1년
 */
public class BoardDAO {
	//XML 읽어서 저장 => Map ("id",SQL) => mapper.xml의 id를 찾아 해당 sql을 읽어옴
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml"); //파일명 대소문자 구분
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	/*
	    <select id="boardListData" resultType="BoardVO" parameterType="hashmap">
		SELECT no, subject, name, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, hit, num 
		FROM (SELECT no, subject, name, regdate, hit, rownum as num 
		FROM (SELECT /*+ INDEX_DESC(board board_no_pk) no, subject, name, regdate, hit
		FROM board)) 
		WHERE num BETWEEN #{start} AND #{end} 
		
		resultType="BoardVO" => 결과값 ResultSet
		parameterType="hashmap" => ? ps.setString(1, start)
	*/
	public static List<BoardVO> boardListData(Map map){
		List<BoardVO> list=new ArrayList<BoardVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("boardListData", map);
			// SQL문장 / VO 요청
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close(); //dbcp connection 반환
			}
		}
		return list;
	}
	
	/*
	 <select id="boardRowCount" resultType="int">
		SELECT COUNT(*) FROM board
	 </select> 
	*/
	public static int boardRowCount() {
		SqlSession session=ssf.openSession();
		int count=session.selectOne("boardRowCount");
		session.close(); //반환은 하지만 try~catch가 없기 때문에 에러발생시 print안됨 => 가급적 예외처리
		return count;
	}
	
	/*
	 <insert id="boardInsert" parameterType="BoardVO">
		INSERT INTO board VALUES(
			board_no_seq.nextval, #{name}, #{subject}, #{content}, #{pwd}, SYSDATE, 0
		)
	 </insert> 
	*/
	public static void boardInsert(BoardVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true); // true = autocommit
			session.insert("boardInsert", vo);
			//session.commit(); //AutoCommit 해제 상태, 트랜잭션, commit날려야 추가/수정가능
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}
	
	/*
	 	<update id="hitIncrement" parameterType="int">
		UPDATE board SET
		hit=hit+1
		WHERE no=#{no}
	</update>
	<select id="boardDetailData" resultType="BoardVO" parameterType="int">
		SELECT no, name, subject, content, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, hit 
		FROM board
		WHERE no=#{no}
	</select> 
	 */
	public static BoardVO boardDetailData(int no) {
		SqlSession session=null;
		BoardVO vo=new BoardVO();
		try {
			session=ssf.openSession();
			session.update("hitIncrement", no);
			session.commit();
			
			vo=session.selectOne("boardDetailData", no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			//connection 반환 (DBCP) => 재사용
			if(session!=null) {
				session.close();
			}
		}
		return vo;
	}
	
	/*
	 <select id="boardGetPassword" resultType="String" parameterType="int">
		SELECT pwd FROM board
		WHERE no=#{no}
	 </select>
	 <delete id="boardDelete" parameterType="int">
		DELETE FROM board
		WHERE no=#{no}
	 </delete> 
	 */
	public static boolean boardDelete(int no, String pwd) {
		boolean bCheck=false;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			String db_pwd=session.selectOne("boardGetPassword", no);
			if(db_pwd.equals(pwd)) {
				bCheck=true;
				session.delete("boardDelete", no);
				session.commit();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return bCheck;
	}
	
	public static BoardVO boardUpdateData(int no) {
		SqlSession session=null;
		BoardVO vo=new BoardVO();
		try {
			session=ssf.openSession();
			vo=session.selectOne("boardDetailData", no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			//connection 반환 (DBCP) => 재사용
			if(session!=null) {
				session.close();
			}
		}
		return vo;
	}
	public static boolean boardUpdate(BoardVO vo) {
		boolean bCheck=false;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			String db_pwd=session.selectOne("boardGetPassword", vo.getNo());
			if(db_pwd.equals(vo.getPwd())) {
				bCheck=true;
				session.update("boardUpdate", vo);
				session.commit();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return bCheck;
	}
}
