package com.apc.model;

public class PaymentDTO {
	
	private int order_no;				//주문번호
	private int cartno_fk;				//카트번호
	private String order_id;			//주문아이디
	private int pno_fk;					//제품번호
	private String pname;				//상품명
	private int pqty;					//싱품수량
	private int price;					//가격
	private int transcost;				//배송비
	private int paytype;				//결제타입
	private String orderdate;			//주문날짜
	private String ordername;			//주문자이름
	private String orderaddr;			//주문자 주소
	private String orderphone;			//주문자 연락차
	private String pay_pimage;
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getCartno_fk() {
		return cartno_fk;
	}
	public void setCartno_fk(int cartno_fk) {
		this.cartno_fk = cartno_fk;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public int getPno_fk() {
		return pno_fk;
	}
	public void setPno_fk(int pno_fk) {
		this.pno_fk = pno_fk;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPqty() {
		return pqty;
	}
	public void setPqty(int pqty) {
		this.pqty = pqty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTranscost() {
		return transcost;
	}
	public void setTranscost(int transcost) {
		this.transcost = transcost;
	}
	public int getPaytype() {
		return paytype;
	}
	public void setPaytype(int paytype) {
		this.paytype = paytype;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getOrdername() {
		return ordername;
	}
	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}
	public String getOrderaddr() {
		return orderaddr;
	}
	public void setOrderaddr(String orderaddr) {
		this.orderaddr = orderaddr;
	}
	public String getOrderphone() {
		return orderphone;
	}
	public void setOrderphone(String orderphone) {
		this.orderphone = orderphone;
	}
	public String getPay_pimage() {
		return pay_pimage;
	}
	public void setPay_pimage(String pay_pimage) {
		this.pay_pimage = pay_pimage;
	}
	
	
	
	
	
	

}
