package com.sist.vo;
/*
 *  1.목록 => 페이징
 *  2.상세
 *  3.CRUD => 게시판 + 댓글
 *  ---------------- 신입사원 요구사항
 *  4.파일업로드
 *  
 *   MVC / Spring
 *   JSON => Ajax / Vue / React
 *   AWS : 호스팅
 */
import java.util.*;
import lombok.Data;
@Data
public class BoardVO {
	private int no, hit;
	private String name, subject, content, pwd, dbday;
	private Date regdate;
	private int rownum;
}
