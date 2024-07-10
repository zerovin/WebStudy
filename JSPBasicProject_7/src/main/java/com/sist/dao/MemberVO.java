package com.sist.dao;
import lombok.Data;

// request, response, session, cookie
// application(getRealPath), pageContext, out
@Data
public class MemberVO {
	private String id, name, pwd;
}
