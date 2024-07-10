package com.sist.dao;
import lombok.Data;

/*
NO	NUMBER(38,0)
GOODS_NAME	VARCHAR2(4000 BYTE)
GOODS_SUB	VARCHAR2(4000 BYTE)
GOODS_PRICE	VARCHAR2(26 BYTE)
GOODS_DISCOUNT	NUMBER(38,0)
GOODS_FIRST_PRICE	VARCHAR2(26 BYTE)
GOODS_DELIVERY	VARCHAR2(26 BYTE)
GOODS_POSTER	VARCHAR2(4000 BYTE)
HIT	NUMBER(38,0) 
 */
@Data
public class GoodsVO {
	private int no, discount, hit;
	private String name, sub, price, first_price, delivery, poster;
}
