package com.pkb.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ApplyHistory implements Serializable {
	private int apply_record_no;
	private int apply_no;
	private Date apply_rec_date;
	private String apply_rec_status;
	private String apply_refuse;
	private int user_no;
	private String email;
	public ApplyHistory() {
		
	}
	public ApplyHistory(int apply_record_no, int apply_no, Date apply_rec_date, String apply_rec_status,
			String apply_refuse, int user_no, String email) {
		super();
		this.apply_record_no = apply_record_no;
		this.apply_no = apply_no;
		this.apply_rec_date = apply_rec_date;
		this.apply_rec_status = apply_rec_status;
		this.apply_refuse = apply_refuse;
		this.user_no = user_no;
		this.email = email;
	}
	public int getApply_record_no() {
		return apply_record_no;
	}
	public int getApply_no() {
		return apply_no;
	}
	public Date getApply_rec_date() {
		return apply_rec_date;
	}
	public String getApply_rec_status() {
		return apply_rec_status;
	}
	public String getApply_refuse() {
		return apply_refuse;
	}
	public int getUser_no() {
		return user_no;
	}
	public String getEmail() {
		return email;
	}
	public void setApply_record_no(int apply_record_no) {
		this.apply_record_no = apply_record_no;
	}
	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
	}
	public void setApply_rec_date(Date apply_rec_date) {
		this.apply_rec_date = apply_rec_date;
	}
	public void setApply_rec_status(String apply_rec_status) {
		this.apply_rec_status = apply_rec_status;
	}
	public void setApply_refuse(String apply_refuse) {
		this.apply_refuse = apply_refuse;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "ApplyHistory [apply_record_no=" + apply_record_no + ", apply_no=" + apply_no + ", apply_rec_date="
				+ apply_rec_date + ", apply_rec_status=" + apply_rec_status + ", apply_refuse=" + apply_refuse
				+ ", user_no=" + user_no + ", email=" + email + "]";
	}

}
