package com.apc.model;

public class CancelDTO {

	private int cancel_no;
	private int orderno_fk;
	private int pno_fk;
	private String memid_fk;
	private String pname;
	private String pcolor;
	private String psize;
	private int pqty;
	private String cancel_category;
	private String cancel_cont;
	private String cancel_image;
	private String cancel_date;
	private int cancel_state;
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcolor() {
		return pcolor;
	}
	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}
	public String getPsize() {
		return psize;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	public int getPqty() {
		return pqty;
	}
	public void setPqty(int pqty) {
		this.pqty = pqty;
	}
	public int getCancel_no() {
		return cancel_no;
	}
	public void setCancel_no(int cancel_no) {
		this.cancel_no = cancel_no;
	}
	public int getOrderno_fk() {
		return orderno_fk;
	}
	public void setOrderno_fk(int orderno_fk) {
		this.orderno_fk = orderno_fk;
	}
	public int getPno_fk() {
		return pno_fk;
	}
	public void setPno_fk(int pno_fk) {
		this.pno_fk = pno_fk;
	}
	public String getMemid_fk() {
		return memid_fk;
	}
	public void setMemid_fk(String memid_fk) {
		this.memid_fk = memid_fk;
	}
	public String getCancel_category() {
		return cancel_category;
	}
	public void setCancel_category(String cancel_category) {
		this.cancel_category = cancel_category;
	}
	public String getCancel_cont() {
		return cancel_cont;
	}
	public void setCancel_cont(String cancel_cont) {
		this.cancel_cont = cancel_cont;
	}
	public String getCancel_image() {
		return cancel_image;
	}
	public void setCancel_image(String cancel_image) {
		this.cancel_image = cancel_image;
	}
	public String getCancel_date() {
		return cancel_date;
	}
	public void setCancel_date(String cancel_date) {
		this.cancel_date = cancel_date;
	}
	public int getCancel_state() {
		return cancel_state;
	}
	public void setCancel_state(int cancel_state) {
		this.cancel_state = cancel_state;
	}
	
	
}
