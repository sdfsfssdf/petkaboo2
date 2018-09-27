package com.pkb.reservation.model.vo;

import java.sql.Date;

public class Contract implements java.io.Serializable {
	private int contract_no;			//계약번호
	private int user_no;				//회원번호
	private int pet_no;					//반려동물번호
	private int pet_service_regno;		//펫시터서비스등록번호
	private Date contract_date;			//계약일시
	private Date contract_start;		//계약시작일
	private Date contract_end;			//계약종료일
	private String contract_status;		//계약상태
	private int contract_star;			//계약평점
	

	
	public Contract(){}



	public Contract(int contract_no, int user_no, int pet_no, int pet_service_regno, Date contract_date,
			Date contract_start, Date contract_end, String contract_status, int contract_star) {
		super();
		this.contract_no = contract_no;
		this.user_no = user_no;
		this.pet_no = pet_no;
		this.pet_service_regno = pet_service_regno;
		this.contract_date = contract_date;
		this.contract_start = contract_start;
		this.contract_end = contract_end;
		this.contract_status = contract_status;
		this.contract_star = contract_star;
	}



	public int getContract_no() {
		return contract_no;
	}



	public int getUser_no() {
		return user_no;
	}



	public int getPet_no() {
		return pet_no;
	}



	public int getPet_service_regno() {
		return pet_service_regno;
	}



	public Date getContract_date() {
		return contract_date;
	}



	public Date getContract_start() {
		return contract_start;
	}



	public Date getContract_end() {
		return contract_end;
	}



	public String getContract_status() {
		return contract_status;
	}



	public int getContract_star() {
		return contract_star;
	}



	public void setContract_no(int contract_no) {
		this.contract_no = contract_no;
	}



	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}



	public void setPet_no(int pet_no) {
		this.pet_no = pet_no;
	}



	public void setPet_service_regno(int pet_service_regno) {
		this.pet_service_regno = pet_service_regno;
	}



	public void setContract_date(Date contract_date) {
		this.contract_date = contract_date;
	}



	public void setContract_start(Date contract_start) {
		this.contract_start = contract_start;
	}



	public void setContract_end(Date contract_end) {
		this.contract_end = contract_end;
	}



	public void setContract_status(String contract_status) {
		this.contract_status = contract_status;
	}



	public void setContract_star(int contract_star) {
		this.contract_star = contract_star;
	}



	@Override
	public String toString() {
		return "Contract [contract_no=" + contract_no + ", user_no=" + user_no + ", pet_no=" + pet_no
				+ ", pet_service_regno=" + pet_service_regno + ", contract_date=" + contract_date + ", contract_start="
				+ contract_start + ", contract_end=" + contract_end + ", contract_status=" + contract_status
				+ ", contract_star=" + contract_star + "]";
	}




}