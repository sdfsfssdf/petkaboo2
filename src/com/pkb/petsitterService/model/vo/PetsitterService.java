package com.pkb.petsitterService.model.vo;

import java.sql.Connection;
import java.sql.Date;

public class PetsitterService {
	private int pet_service_regno;		// 펫시터 서비스 등록번호
	private int pet_regno;				// 펫시터 서비스 상세 번호
	private int user_no;				// 회원번호
	private String user_name;			// 회원이름
	private String nickname;			// 닉네임
	private String gender;				// 성별
	private String phone;				// 전화번호
	private String address;				// 주소
	private String contract_type;		// 계약종류
	private int pet_category;			// 계약가능동물
	private int pet_count;				// 계약가능동물 마리수
	private int service_charge;			// 요금
	private String contract_days;		// 계약가능요일
	private Date contract_start;		// 계약가능시작일
	private Date contract_end;			// 계약가능종료일
	private String service_detail;		// 서비스 상세 내용
	private String service_restrict;	// 서비스 제한 사항
	
	public PetsitterService(){}

	public PetsitterService(int pet_service_regno, int pet_regno, int user_no, String user_name, String nickname,
			String gender, String phone, String address, String contract_type, int pet_category, int pet_count,
			int service_charge, String contract_days, Date contract_start, Date contract_end, String service_detail,
			String service_restrict) {
		super();
		this.pet_service_regno = pet_service_regno;
		this.pet_regno = pet_regno;
		this.user_no = user_no;
		this.user_name = user_name;
		this.nickname = nickname;
		this.gender = gender;
		this.phone = phone;
		this.address = address;
		this.contract_type = contract_type;
		this.pet_category = pet_category;
		this.pet_count = pet_count;
		this.service_charge = service_charge;
		this.contract_days = contract_days;
		this.contract_start = contract_start;
		this.contract_end = contract_end;
		this.service_detail = service_detail;
		this.service_restrict = service_restrict;
	}

	public int getPet_service_regno() {
		return pet_service_regno;
	}

	public int getPet_regno() {
		return pet_regno;
	}

	public int getUser_no() {
		return user_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public String getNickname() {
		return nickname;
	}

	public String getGender() {
		return gender;
	}

	public String getPhone() {
		return phone;
	}

	public String getAddress() {
		return address;
	}

	public String getContract_type() {
		return contract_type;
	}

	public int getPet_category() {
		return pet_category;
	}

	public int getPet_count() {
		return pet_count;
	}

	public int getService_charge() {
		return service_charge;
	}

	public String getContract_days() {
		return contract_days;
	}

	public Date getContract_start() {
		return contract_start;
	}

	public Date getContract_end() {
		return contract_end;
	}

	public String getService_detail() {
		return service_detail;
	}

	public String getService_restrict() {
		return service_restrict;
	}

	public void setPet_service_regno(int pet_service_regno) {
		this.pet_service_regno = pet_service_regno;
	}

	public void setPet_regno(int pet_regno) {
		this.pet_regno = pet_regno;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setContract_type(String contract_type) {
		this.contract_type = contract_type;
	}

	public void setPet_category(int pet_category) {
		this.pet_category = pet_category;
	}

	public void setPet_count(int pet_count) {
		this.pet_count = pet_count;
	}

	public void setService_charge(int service_charge) {
		this.service_charge = service_charge;
	}

	public void setContract_days(String contract_days) {
		this.contract_days = contract_days;
	}

	public void setContract_start(Date contract_start) {
		this.contract_start = contract_start;
	}

	public void setContract_end(Date contract_end) {
		this.contract_end = contract_end;
	}

	public void setService_detail(String service_detail) {
		this.service_detail = service_detail;
	}

	public void setService_restrict(String service_restrict) {
		this.service_restrict = service_restrict;
	}

	@Override
	public String toString() {
		return "PetsitterService [pet_service_regno=" + pet_service_regno + ", pet_regno=" + pet_regno + ", user_no="
				+ user_no + ", user_name=" + user_name + ", nickname=" + nickname + ", gender=" + gender + ", phone="
				+ phone + ", address=" + address + ", contract_type=" + contract_type + ", pet_category=" + pet_category
				+ ", pet_count=" + pet_count + ", service_charge=" + service_charge + ", contract_days=" + contract_days
				+ ", contract_start=" + contract_start + ", contract_end=" + contract_end + ", service_detail="
				+ service_detail + ", service_restrict=" + service_restrict + "]";
	}


}
