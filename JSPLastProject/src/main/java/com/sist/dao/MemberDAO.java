package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.MemberVO;
public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	
	/*
	 <select id="memberIdCountData" resultType="int" parameterType="string">
 		SELECT COUNT(*) FROM member WHERE id=#{id}
 	</select>
 	
 	<select id="memberInfoData" resultType="MemberVO" parameterType="string">
 		SELECT * FROM member WHERE id=#{id}
 	</select> 
 	*/
	public static MemberVO isLogin(String id, String pwd) {
		MemberVO vo=new MemberVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			int count=session.selectOne("memberIdCountData", id); //id=>#{id}
			if(count==0) {
				vo.setMsg("NOID");
			}else {
				vo=session.selectOne("memberInfoData", id);
				if(pwd.equals(vo.getPwd())) {
					//로그인
					vo.setMsg("OK");
				}else {
					//비밀번호 불일치
					vo.setMsg("NOPWD");
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close(); //DBCP => POOL 안으로 반환 => 재사용
			}
		}
		return vo;
	}
	
	//아이디 중복체크
	public static int memberIdCheck(String id) {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("memberIdCountData", id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return count;
	}
	
	/*
	 <insert id="memberInsert" parameterType="MemberVO">
 	 	INSERT INTO project_member VALUES(
 	 		#{id}, #{pwd}, #{name}, #{sex}, #{birthday}, #{post}, #{addr1}, #{addr2}, #{phone}, #{email}, #{content}, SYSDATE, 'n'
 	 	)
 	 </insert> 
	 */
	public static void memberInsert(MemberVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("memberInsert", vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}
	
	//수정
	/*
	 <select id="memberUpdateData" resultType="MemberVO" parameterType="string">
 	 	SELECT id, name, sex, birthday, post, addr1, addr2, phone, email, content
 	 	FROM project_member
 	 	WHERE id=#{id}
 	 </select> 
	 */
	public static MemberVO memberUpdateData(String id) {
		MemberVO vo=new MemberVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("memberUpdateData", id);
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
	 <select id="memberGetPassword" resultType="string" parameterType="string">
 	 	SELECT pwd FROM project_member
 	 	WHERE id=#{id}
 	 </select>
 	 <update id="memberUpdate" parameterType="MemberVO">
 	 	UPDATE project_member SET
 	 	name=#{name}, birthday=#{birthday}, post=#{post}, addr1=#{addr1}, addr2=#{addr2}, phone=#{phone}, email=#{email}, content=#{content}
 	 	WHERE id=#{id}
 	 </update> 
	 */
	public static boolean memberUpdate(MemberVO vo) {
		boolean bCheck=false;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			String db_pwd=session.selectOne("memberGetPassword", vo.getId());
			if(db_pwd.equals(vo.getPwd())){
				bCheck=true;
				session.update("memberUpdate", vo);
				session.commit();
			}else {
				
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
