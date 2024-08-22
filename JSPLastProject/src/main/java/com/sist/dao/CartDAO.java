package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class CartDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	/*
	 <insert id="cartInsert" parameterType="CartVO">
		INSERT INTO project_cart VALUES(
			pc_cno_seq.nextval, #{gno}, #{type}, #{id}, #{account}, #{price}, 'n', SYSDATE
		)
	</insert> 
	 */
	public static void cartInsert(CartVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("cartInsert", vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}
	
	/*
	<select id="cartListData" resultMap="cartMap" parameterType="string">
		SELECT cno, goods_name, goods_poster, goods_price, account, price
		FROM project_cart pc, goods_all g
		WHERE id=#{id} AND isbuy=0
		AND pc.gno=g.no
	</select> 
	
	goods
	no cno
	1   1
	2   1
	3   1
	4   2
	*/
	public static List<CartVO> cartListData(String id){
		List<CartVO> list=new ArrayList<CartVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("cartListData", id);
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
	트리거
	<select id="cartGetGnoCount" resultType="int" parameterType="hashmap">
		SELECT COUNT(*) FROM project_cart
		WHERE gno=#{gno} AND id=#{id}
	</select>
	*/
	public static int cartGetGnoCount(Map map) {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("cartGetGnoCount", map);
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
	<select id="cartGetGno" resultType="int" parameterType="hashmap">
		SELECT cno FROM project_cart
		WHERE gno=#{gno} AND id=#{id}
	</select>
	*/
	public static int cartGetGno(Map map) {
		int cno=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			cno=session.selectOne("cartGetGno", map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return cno;
	}
	
	/*
	<update id="cartGnoUpdate" parameterType="hashmap">
		UPDATE proejct_cart SET
		account=account+#{account}
		WHERE cno=#{cno}
	</update> 
	 */
	public static void cartGnoUpdate(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("cartGnoUpdate", map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}
	
	/*
	 <!-- 구매 -->
	<insert id="buyInsert" parameterType="CartVO">
		INSERT INTO project_cart VALUES(
			pc_cno_seq.nextval, #{gno}, #{id}, #{account}, #{price}, 'y', SYSDATE
		)
	</insert>
	*/
	public static void buyInsert(CartVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("buyInsert", vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}
	/*
	<!-- 구매 목록 mypage-->
	<select id="buyListData" resultMap="cartMap" parameterType="string">
		SELECT cno, goods_name, goods_poster, goods_price, account, price
		FROM project_cart pc, goods_all g
		WHERE id=#{id} AND isbuy='y'
		AND pc.gno=g.no
	</select>
	*/
	public static List<CartVO> buyListData(String id){
		List<CartVO> list=new ArrayList<CartVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("buyListData", id);
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
	<select id="buyTotalPrice" resultType="int" parameterType="string">
		SELECT SUM(price*account) FROM project_cart
		WHERE id=#{id} AND isbuy='y'
	</select> 
	 */
	public static int buyTotalPrice(String id) {
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("buyTotalPrice", id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return total;
	}
	
	/*
	 <delete id="cartCancel" parameterType="int">
		DELETE FROM project_cart
		WHERE cno=#{cno}
	</delete> 
	 */
	public static void cartCancel(int cno) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.delete("cartCancel", cno);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}
	
	/*
	 <update id="cartBuyUpdate" parameterType="int">
		UPDATE project_cart SET
		isbuy='y'
		WHERE cno=#{cno}
	</update> 
	 */
	public static void cartBuyUpdate(int cno) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("cartBuyUpdate", cno);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}
}
