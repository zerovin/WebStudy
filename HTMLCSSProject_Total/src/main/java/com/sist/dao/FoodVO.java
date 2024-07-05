package com.sist.dao;
import lombok.Data;

/*
 *  자바 - 오라클 - JSP - Spring - Spring-Boot
 *         JDBC - DBCP - MyBatis - JPA 
 */

/*
 FNO                                       NOT NULL NUMBER
 NAME                                      NOT NULL VARCHAR2(200)
 TYPE                                      NOT NULL VARCHAR2(200)
 PHONE                                              VARCHAR2(30)
 ADDRESS                                            VARCHAR2(700)
 SCORE                                              NUMBER(2,1)
 THEME                                              CLOB
 POSTER                                    NOT NULL VARCHAR2(260)
 CONTENT                                            CLOB
 
 desc table_name; 확인
 VO => 데이터를 브라우저로 전송할 목록 VO (~DTO) => JSP(Bean)
 변수명 = 컬럼명 동일하게 작성 => 해킹방지 캡슐화 private, 메소드를 이용해서 접근
 	      - MyBatis / JPA => 컬럼이 다르면 변경 필요 ex)@Column(name="goods_name")
        데이터형 일치 - CHAR, VARCHAR2, CLOB => String
                     NUMBER => int, double
                     DATE => java.util.Date (java.sql.DateX)
                             오늘 : SYSDATE
                             예약일 : YY/MM/DD => TO_DATE로 변환 후 INSERT
                            
 VO => 데이터 한개 ex)상세보기
 List => VO 여러개 ex)목록
 */
@Data
public class FoodVO {
	private int fno;
	private String name, type, phone, address, theme, poster, content;
	private double score;
}
