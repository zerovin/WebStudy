package com.sist.dao;
import java.util.*;
import java.util.Date;
import lombok.Data;
import java.sql.*;
/*
 NO                                        NOT NULL NUMBER
 NAME                                      NOT NULL VARCHAR2(51)
 SUBJECT                                   NOT NULL VARCHAR2(4000)
 CONTENT                                   NOT NULL CLOB
 PWD                                       NOT NULL VARCHAR2(10)
 REGDATE                                            DATE
 HIT                                                NUMBER 
 */
@Data
public class BoardVO {
	private int no, hit;
	private String name, subject, content, pwd, db_day;
	private Date regdate;
}
