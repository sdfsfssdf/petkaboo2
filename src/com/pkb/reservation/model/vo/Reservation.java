package com.pkb.reservation.model.vo;

import java.sql.Date;

public class Reservation {

	private int contract_no;		//계약번호
	private int user_no;			//회원번호
	private String user_name;		//회원이름
	private int pet_no;				//반려동물 번호
	private String pet_name;		//반려동물 이름
	private int pet_service_regno;	//펫시터서비스등록번호;
	private Date contract_date;		//계약일시
	private Date contract_start;	//계약시작일       
	private Date contract_end;		//계약종료일
	private String address;			//주소(위치)
	private String user_type;		//회원구분
	private String phone;			//휴대폰번호
	private String contract_status; //계약상태
	
	public Reservation(){}

	public Reservation(int contract_no, int user_no, String user_name, int pet_no, int pet_service_regno,
			Date contract_date, Date contract_start, Date contract_end, String address, String user_type, String phone,
			String contract_status, String pet_name) {
		super();
		this.contract_no = contract_no;
		this.user_no = user_no;
		this.user_name = user_name;
		this.pet_no = pet_no;
		this.pet_service_regno = pet_service_regno;
		this.contract_date = contract_date;
		this.contract_start = contract_start;
		this.contract_end = contract_end;
		this.address = address;
		this.user_type = user_type;
		this.phone = phone;
		this.contract_status = contract_status;
		this.pet_name = pet_name;
	}
	

	public int getContract_no() {
		return contract_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public String getUser_name() {
		return user_name;
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

	public String getAddress() {
		return address;
	}

	public String getUser_type() {
		return user_type;
	}

	public String getPhone() {
		return phone;
	}

	public String getContract_status() {
		return contract_status;
	}
	
	public String getPet_name() {
		return pet_name;
	}


	public void setContract_no(int contract_no) {
		this.contract_no = contract_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
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

	public void setAddress(String address) {
		this.address = address;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setContract_status(String contract_status) {
		this.contract_status = contract_status;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	@Override
	public String toString() {
		return "Reservation [contract_no=" + contract_no + ", user_no=" + user_no + ", user_name=" + user_name
				+ ", pet_no=" + pet_no + ", pet_name=" + pet_name + ", pet_service_regno=" + pet_service_regno
				+ ", contract_date=" + contract_date + ", contract_start=" + contract_start + ", contract_end="
				+ contract_end + ", address=" + address + ", user_type=" + user_type + ", phone=" + phone
				+ ", contract_status=" + contract_status + "]";
	}
	

	
	
	
	
	
	
	
}
