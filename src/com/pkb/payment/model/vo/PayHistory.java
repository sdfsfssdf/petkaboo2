package com.pkb.payment.model.vo;

import java.io.Serializable;

public class PayHistory implements Serializable{
	private int pay_recordno;		//결제이력번호
	private int pay_no;				//결제번호
	private int user_no;			//회원번호
	
	public PayHistory(){}

	public PayHistory(int pay_recordno, int pay_no, int user_no) {
		super();
		this.pay_recordno = pay_recordno;
		this.pay_no = pay_no;
		this.user_no = user_no;
	}

	public int getPay_recordno() {
		return pay_recordno;
	}

	public int getPay_no() {
		return pay_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setPay_recordno(int pay_recordno) {
		this.pay_recordno = pay_recordno;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	@Override
	public String toString() {
		return "PayHistory [pay_recordno=" + pay_recordno + ", pay_no=" + pay_no + ", user_no=" + user_no + "]";
	}
	
	
}
