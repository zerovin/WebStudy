package com.sist.bean;
import lombok.Data;
/*
 * 데이터를 모아서 한번에 전송할 목적
 * - VO (Value Object) => Spring
 * - DTO (Data Transfer Object) => MyBatis
 * - Beans => JSP
 * 
 * 변수제어 => 읽기(getter) / 쓰기(setter)
 * 데이터 해킹방지 => 숨겨서 보냄 => 캡슐화, 데이터를 보호할 목적
 * 
 */
@Data
public class MemberVO {
	private String name, sex, address, phone;
}
