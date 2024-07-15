package com.sist.dao;
import java.util.*;
/*
 NO                                        NOT NULL NUMBER
 NAME                                      NOT NULL VARCHAR2(50)
 SUBJECT                                   NOT NULL VARCHAR2(2000)
 CONTENT                                   NOT NULL CLOB
 PWD                                       NOT NULL VARCHAR2(10)
 REGDATE                                            DATE
 HIT                                                NUMBER
 ========================
 GROUP_ID                                           NUMBER
 GROUP_STEP    출력관련                               NUMBER
 GROUP_TAB                                          NUMBER
 =======================
 ROOT                                               NUMBER
 DEPTH         삭제관련                               NUMBER
 ======================= 
 */
public class BoardVO {
	private int no, hit;
	private String name, subject, content, pwd;
	private Date regdate;
	private int group_id; // 같은 답변을 모아서 관리
	private int group_step; //답변 순서 지정
	private int group_tab; //들여쓰기 공백
	private int root; //어떤 게시물에 대한 답변인지 확인
	private int depth; //게시물에 몇개의 답변이 있는지 확인
	//관리자, 사용자 => 묻고 답하기 or 실시간채팅 (사이트 필수)
}
