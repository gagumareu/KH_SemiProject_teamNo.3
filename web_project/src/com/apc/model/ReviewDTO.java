package com.apc.model;

public class ReviewDTO {
	
	private int review_no;
	private int pno_fk;
	private String pname;
	private String psize;
	private String pcolor;
	private String memid_fk;
	private int review_rate;
	private String review_cont;
	private String review_image;
	private String review_pwd;
	private String review_date;
	private int orderno_fk;
	
	
	
	public int getOrderno_fk() {
		return orderno_fk;
	}
	public void setOrderno_fk(int orderno_fk) {
		this.orderno_fk = orderno_fk;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPsize() {
		return psize;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	public String getPcolor() {
		return pcolor;
	}
	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
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
	public int getReview_rate() {
		return review_rate;
	}
	public void setReview_rate(int review_rate) {
		this.review_rate = review_rate;
	}
	public String getReview_cont() {
		return review_cont;
	}
	public void setReview_cont(String review_cont) {
		this.review_cont = review_cont;
	}
	public String getReview_image() {
		return review_image;
	}
	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}
	public String getReview_pwd() {
		return review_pwd;
	}
	public void setReview_pwd(String review_pwd) {
		this.review_pwd = review_pwd;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	
		
	
	
}
