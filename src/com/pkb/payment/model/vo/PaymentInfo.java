package com.pkb.payment.model.vo;

import java.sql.Date;

public class PaymentInfo {
	private String userAddress;		//사용자 주소
	private String userName;		//사용자 이름
	private int user_no;			//회원번호
	private int money;				//사용자 보유머니
	private int contract_no;		//계약번호
	private Date contract_date;		//계약신청일
	private Date contract_start;	//계약시작일
	private Date contract_end;		//계약종료일
	private String contract_status;	//계약상태 (대기(W), 취소(C), 완료(E))
	private int pet_service_regno;	//펫시터서비스 등록번호
	private String contract_type;	//계약타입 (위탁(C),방문(V))
	private int service_charge;		//계약요금
	private int pet_count;			//마리수
	private String service_status;	//돌봄서비스 상태(결제대기(W) 진행(P) 결제완료(E) 종료(F)
	private String pet_categoryname;//동물 카테고리 이름
	
	public PaymentInfo(){}

	public PaymentInfo(String userAddress, String userName, int user_no, int money, int contract_no, Date contract_date,
			Date contract_start, Date contract_end, String contract_status, int pet_service_regno, String contract_type,
			int service_charge, int pet_count, String service_status, String pet_categoryname) {
		super();
		this.userAddress = userAddress;
		this.userName = userName;
		this.user_no = user_no;
		this.money = money;
		this.contract_no = contract_no;
		this.contract_date = contract_date;
		this.contract_start = contract_start;
		this.contract_end = contract_end;
		this.contract_status = contract_status;
		this.pet_service_regno = pet_service_regno;
		this.contract_type = contract_type;
		this.service_charge = service_charge;
		this.pet_count = pet_count;
		this.service_status = service_status;
		this.pet_categoryname = pet_categoryname;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public String getUserName() {
		return userName;
	}

	public int getUser_no() {
		return user_no;
	}

	public int getMoney() {
		return money;
	}

	public int getContract_no() {
		return contract_no;
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

	public int getPet_service_regno() {
		return pet_service_regno;
	}

	public String getContract_type() {
		return contract_type;
	}

	public int getService_charge() {
		return service_charge;
	}

	public int getPet_count() {
		return pet_count;
	}

	public String getService_status() {
		return service_status;
	}

	public String getPet_categoryname() {
		return pet_categoryname;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public void setContract_no(int contract_no) {
		this.contract_no = contract_no;
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

	public void setPet_service_regno(int pet_service_regno) {
		this.pet_service_regno = pet_service_regno;
	}

	public void setContract_type(String contract_type) {
		this.contract_type = contract_type;
	}

	public void setService_charge(int service_charge) {
		this.service_charge = service_charge;
	}

	public void setPet_count(int pet_count) {
		this.pet_count = pet_count;
	}

	public void setService_status(String service_status) {
		this.service_status = service_status;
	}

	public void setPet_categoryname(String pet_categoryname) {
		this.pet_categoryname = pet_categoryname;
	}

	@Override
	public String toString() {
		return "PaymentInfo [userAddress=" + userAddress + ", userName=" + userName + ", user_no=" + user_no
				+ ", money=" + money + ", contract_no=" + contract_no + ", contract_date=" + contract_date
				+ ", contract_start=" + contract_start + ", contract_end=" + contract_end + ", contract_status="
				+ contract_status + ", pet_service_regno=" + pet_service_regno + ", contract_type=" + contract_type
				+ ", service_charge=" + service_charge + ", pet_count=" + pet_count + ", service_status="
				+ service_status + ", pet_categoryname=" + pet_categoryname + "]";
	}
	
	
	
	
}
