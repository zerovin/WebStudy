package com.sist.dao;
/*
 NO                                        NOT NULL NUMBER
 NAME                                      NOT NULL VARCHAR2(50)
 SUBJECT                                   NOT NULL VARCHAR2(2000)
 CONTENT                                   NOT NULL CLOB
 PWD                                       NOT NULL VARCHAR2(10)
 REGDATE                                            DATE
 HIT                                                NUMBER
 FILENAME                                           VARCHAR2(260)
 FILESIZE                                           NUMBER 
 */

/*
 *  데이터베이스 연결, 데이터 값을 저장 후 한번에 브라우저로 전송할 목적
 *    - 데이터 보호 = 캡슐화
 *                 변수 private
 *    - 사용이 가능하게 만든다 = 변수 읽기/쓰기 => 기능을 만들어서 처리 => getter/setter
 *    - JSP : Bean
 *            생성시 사용하는 태그 <jsp:useBean>
 *            변수의 값을 채우는 태그 <jsp:setProperty> => MVC(Spring)에서 사용빈도 없음 
 *    - 데이터베이스 컬럼과 변수 매칭
 *    - 크롤리 데이터와 매칭
 *    - 데이터베이스 데이터형
 *      - 문자형 : CHAR, VARCHAR1, CLOB => String
 *      - 숫자형 : NUMBER, NUMBER(8,2) => 저장된 데이터 확인 => int / double
 *      - 날짜형 : Date => java.util.Date
 */
import java.util.*;
import lombok.Data;
@Data
public class DataBoardVO {
	private int no, filesize, hit;
	private String name, subject, content, pwd, filename, dbday;
	private Date regdate;
}
