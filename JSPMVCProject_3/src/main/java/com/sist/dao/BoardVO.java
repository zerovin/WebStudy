package com.sist.dao;
/*
 NO                                        NOT NULL NUMBER
 NAME                                      NOT NULL VARCHAR2(50)
 SUBJECT                                   NOT NULL VARCHAR2(2000)
 CONTENT                                   NOT NULL CLOB
 PWD                                       NOT NULL VARCHAR2(10)
 REGDATE                                            DATE
 HIT                                                NUMBER
 GROUP_ID                                           NUMBER
 GROUP_STEP                                         NUMBER
 GROUP_TAB                                          NUMBER
 ROOT                                               NUMBER
 DEPTH                                              NUMBER 
 */
import java.util.*;
import lombok.Data;
// 응용 => 대댓글, 묻고 답하기
// 묻기 - 사용자 / 답하기 - 관리자
@Data
public class BoardVO {
	private int no, hit, group_id, group_step, group_tab, root, depth;
	private String name, subject, content, pwd, dbday;
	private Date regdate;
}
