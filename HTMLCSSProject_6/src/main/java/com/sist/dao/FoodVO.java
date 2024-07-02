package com.sist.dao;
import lombok.Data;

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
 
 화면 : HTML / CSS
 데이터 저장 : 데이터베이스(오라클)
 데이터 관리 - 서버 : 자바
          - 클라이언트 : 자바스크립트
 ==============================> 표준화 - 스프링/마이바티스(라이브러리)
 
 파이썬 / 넘파이 / 판다스 / MatPlotLib
 => React (장고 => 데이터 분석)
 엘라스틱서치, 몽고디비(NoSQL)
 => 데이터 수집 후 처리
 
 */
@Data
public class FoodVO {
	private int fno;
	private String name, type, poster;
}
