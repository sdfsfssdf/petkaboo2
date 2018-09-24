package com.pkb.payment.model.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable {
	
	private int pay_no;			//결제번호
	private int user_no;		//회원번호
	private int pay_amount;		//금액
	private Date pay_date;		//결제일자
	private int payment_type; //결제구분(현금/카드/환불)
	private int payment_cash_status; // (현금일경우)
	private Date payment_cash_date;  //결제신청날짜 (현금일경우)
	private String card_apply_no;	//카드승인번호 (카드일경우)
	private int pay_recordno;		//결제이력번호
	
	//아임포트 관련
	private String imp_uid;				//아임포트 거래 고유 번호
	private String pg_provider;			//결제승인/시도된 PG사
	private int amount;					//결제할 금액
	private String name;				//주문명
	private String pay_method;			//결제수단
	private boolean permission;
	private boolean validation;
	private String status;				//결제상태 ready(미결제), paid(결제완료), cancelled(결제취소, 부분취소포함), failed(결제실패)
	private String receipt_url;			//PG사에서 발행되는 거래 매출전표 URL
	private String merchan_uid;			//가맹점에서 생성/관리하는 고유 주문번호
	
	

	
	
	public Payment(){}



	public Payment(int pay_no, int user_no, int pay_amount, Date pay_date, String pay_method, int payment_type,
			int payment_cash_status, Date payment_cash_date, String card_apply_no, int pay_recordno) {
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
		this.pay_recordno = pay_recordno;
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



	public int getPay_recordno() {
		return pay_recordno;
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



	public void setPay_recordno(int pay_recordno) {
		this.pay_recordno = pay_recordno;
	}



	@Override
	public String toString() {
		return "Payment [pay_no=" + pay_no + ", user_no=" + user_no + ", pay_amount=" + pay_amount + ", pay_date="
				+ pay_date + ", pay_method=" + pay_method + ", payment_type=" + payment_type + ", payment_cash_status="
				+ payment_cash_status + ", payment_cash_date=" + payment_cash_date + ", card_apply_no=" + card_apply_no
				+ ", pay_recordno=" + pay_recordno + "]";
	}

	
	
}


