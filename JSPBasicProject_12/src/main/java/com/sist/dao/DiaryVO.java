package com.sist.dao;
import java.util.*;
import lombok.Data;
/*
 NO                                        NOT NULL NUMBER
 ID                                                 VARCHAR2(20)
 SUBJECT                                   NOT NULL VARCHAR2(1000)
 MSG                                       NOT NULL CLOB
 YEAR                                               NUMBER(4)
 MONTH                                              NUMBER(2)
 DAY                                                NUMBER(2)
 REGDATE                                            DATE 
 */
@Data
public class DiaryVO {
	private int no, year, month, day;
	private String id, subject, msg;
	private Date regdate;
}
