package com.pkb.payment.model.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable {
	
	private int pay_no;					//결제번호
	private int user_no;				//회원번호
	private int pay_amount;				//충전금액
	private Date pay_date;				//결제일자
	private String pay_method;			//결제수단
	private int payment_type;			//결제구분(현금/카드/환불/nullable)
	private int payment_cash_status; 	//(현금일경우/nullable)//무통장입금
	private Date payment_cash_date; 	//결제신청날짜 (현금일경우/nullable)
	private String card_apply_no;		//카드승인번호 (카드일경우/nullable)
	
	
	public Payment(){}


	public Payment(int pay_no, int user_no, int pay_amount, Date pay_date, String pay_method, int payment_type,
			int payment_cash_status, Date payment_cash_date, String card_apply_no) {
		super();
		this.pay_no = pay_no;
		this.user_no = user_no;
		this.pay_amount = pay_amount;
		this.pay_date = pay_date;
		this.pay_method = pay_method;
		this.payment_type = payment_type;
		this.payment_cash_status = payment_cash_status;
		this.payment_cash_date = payment_cash_date;
		this.card_apply_no = card_apply_no;
	}


	public int getPay_no() {
		return pay_no;
	}


	public int getUser_no() {
		return user_no;
	}


	public int getPay_amount() {
		return pay_amount;
	}


	public Date getPay_date() {
		return pay_date;
	}


	public String getPay_method() {
		return pay_method;
	}


	public int getPayment_type() {
		return payment_type;
	}


	public int getPayment_cash_status() {
		return payment_cash_status;
	}


	public Date getPayment_cash_date() {
		return payment_cash_date;
	}


	public String getCard_apply_no() {
		return card_apply_no;
	}


	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public void setPay_amount(int pay_amount) {
		this.pay_amount = pay_amount;
	}


	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}


	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}


	public void setPayment_type(int payment_type) {
		this.payment_type = payment_type;
	}


	public void setPayment_cash_status(int payment_cash_status) {
		this.payment_cash_status = payment_cash_status;
	}


	public void setPayment_cash_date(Date payment_cash_date) {
		this.payment_cash_date = payment_cash_date;
	}


	public void setCard_apply_no(String card_apply_no) {
		this.card_apply_no = card_apply_no;
	}


	@Override
	public String toString() {
		return "Payment [pay_no=" + pay_no + ", user_no=" + user_no + ", pay_amount=" + pay_amount + ", pay_date="
				+ pay_date + ", pay_method=" + pay_method + ", payment_type=" + payment_type + ", payment_cash_status="
				+ payment_cash_status + ", payment_cash_date=" + payment_cash_date + ", card_apply_no=" + card_apply_no
				+ "]";
	}

	

	
}