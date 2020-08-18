package com.jachi.DTO;

public class Product_cartDTO {
 public int getCart_orderCode() {
		return cart_orderCode;
	}
	public void setCart_orderCode(int cart_orderCode) {
		this.cart_orderCode = cart_orderCode;
	}
	public String getCart_procode() {
		return cart_procode;
	}
	public void setCart_procode(String cart_procode) {
		this.cart_procode = cart_procode;
	}
	public int getCart_count() {
		return cart_count;
	}
	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}
	public String getCart_option() {
		return cart_option;
	}
	public void setCart_option(String cart_option) {
		this.cart_option = cart_option;
	}
	public int getCart_price() {
		return cart_price;
	}
	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}
int cart_orderCode;
 String cart_procode;
 int cart_count;
 String cart_option;
 int cart_price;
 String cart_us_id;
public String getCart_us_id() {
	return cart_us_id;
}
public void setCart_us_id(String cart_us_id) {
	this.cart_us_id = cart_us_id;
}
String pro_mainimg;
public String getPro_mainimg() {
	return pro_mainimg;
}
public void setPro_mainimg(String pro_mainimg) {
	this.pro_mainimg = pro_mainimg;
}
}
