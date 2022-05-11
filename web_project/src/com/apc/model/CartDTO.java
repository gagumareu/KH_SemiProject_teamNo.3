package com.apc.model;

public class CartDTO {
	
	private int cart_no;
	private int pno_fk;
	private String cart_memid;
	private String cart_pname;
	private int cart_pqty;
	private String cart_psize; 
	private String cart_pcolor;
	private int cart_price;
	private int cart_trans;
	private String cart_pimage;
	private int cart_mileage;
	
	
	public int getCart_mileage() {
		return cart_mileage;
	}
	public void setCart_mileage(int cart_mileage) {
		this.cart_mileage = cart_mileage;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getPno_fk() {
		return pno_fk;
	}
	public void setPno_fk(int pno_fk) {
		this.pno_fk = pno_fk;
	}
	public String getCart_memid() {
		return cart_memid;
	}
	public void setCart_memid(String cart_memid) {
		this.cart_memid = cart_memid;
	}
	public String getCart_pname() {
		return cart_pname;
	}
	public void setCart_pname(String cart_pname) {
		this.cart_pname = cart_pname;
	}
	public int getCart_pqty() {
		return cart_pqty;
	}
	public void setCart_pqty(int cart_pqty) {
		this.cart_pqty = cart_pqty;
	}
	public String getCart_psize() {
		return cart_psize;
	}
	public void setCart_psize(String cart_psize) {
		this.cart_psize = cart_psize;
	}
	public String getCart_pcolor() {
		return cart_pcolor;
	}
	public void setCart_pcolor(String cart_color) {
		this.cart_pcolor = cart_color;
	}
	public int getCart_price() {
		return cart_price;
	}
	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}
	public int getCart_trans() {
		return cart_trans;
	}
	public void setCart_trans(int cart_trans) {
		this.cart_trans = cart_trans;
	}
	public String getCart_pimage() {
		return cart_pimage;
	}
	public void setCart_pimage(String cart_pimage) {
		this.cart_pimage = cart_pimage;
	}
	
	
}
