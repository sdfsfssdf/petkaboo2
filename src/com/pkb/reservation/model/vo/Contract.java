package com.pkb.reservation.model.vo;

import java.sql.Date;

public class Contract implements java.io.Serializable {
	private static final long serialVersionUID = -5252671657642151168L;
	
	private int contract_no;			//계약번호
	private int user_no;				//회원번호
	private int pet_service_regno;		//펫시터서비스등록번호
	private Date contract_date;			//계약일시
	private Date contract_start;		//계약시작일
	private Date contract_end;			//계약종료일
	private String contract_status;		//계약상태
	private int contract_star;			//계약평점
	private int pet_no;					//펫시팅 동물 마리수	
	private String userAddress;			//소비자 주소
	private String userPhone;			//소비자 휴대폰번호
	private String userName;			//소비자 이름
	private String userNickname;		//소비자 닉네임
	private String userGender;			//소비자 성별
	private int pet_user_no;			//펫시터 회원번호
	private String pet_name;			//펫시터 이름
	private Date pet_birth;				//펫시터 생년월일
	private String petAddress;			//펫시터 주소
	private String petPhone;			//펫시터 핸드폰번호
	private String petNickname;			//펫시터 닉네임
	private String petGender;			//펫시터 성별
	private String pet_categoryName;	//펫 종류
	private String contract_type;		//계약 종류
	
	public Contract(){}

	public Contract(int contract_no, int user_no, int pet_service_regno, Date contract_date, Date contract_start,
			Date contract_end, String contract_status, int contract_star, int pet_no, String userAddress,
			String userPhone, String userName, String userNickname, String userGender, int pet_user_no, String pet_name,
			Date pet_birth, String petAddress, String petPhone, String petNickname, String petGender,
			String pet_categoryName, String contract_type) {
		super();
		this.contract_no = contract_no;
		this.user_no = user_no;
		this.pet_service_regno = pet_service_regno;
		this.contract_date = contract_date;
		this.contract_start = contract_start;
		this.contract_end = contract_end;
		this.contract_status = contract_status;
		this.contract_star = contract_star;
		this.pet_no = pet_no;
		this.userAddress = userAddress;
		this.userPhone = userPhone;
		this.userName = userName;
		this.userNickname = userNickname;
		this.userGender = userGender;
		this.pet_user_no = pet_user_no;
		this.pet_name = pet_name;
		this.pet_birth = pet_birth;
		this.petAddress = petAddress;
		this.petPhone = petPhone;
		this.petNickname = petNickname;
		this.petGender = petGender;
		this.pet_categoryName = pet_categoryName;
		this.contract_type = contract_type;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getContract_no() {
		return contract_no;
	}

	public int getUser_no() {
		return user_no;
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

	public int getPet_no() {
		return pet_no;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public String getUserGender() {
		return userGender;
	}

	public int getPet_user_no() {
		return pet_user_no;
	}

	public String getPet_name() {
		return pet_name;
	}

	public Date getPet_birth() {
		return pet_birth;
	}

	public String getPetAddress() {
		return petAddress;
	}

	public String getPetPhone() {
		return petPhone;
	}

	public String getPetNickname() {
		return petNickname;
	}

	public String getPetGender() {
		return petGender;
	}

	public String getPet_categoryName() {
		return pet_categoryName;
	}

	public String getContract_type() {
		return contract_type;
	}

	public void setContract_no(int contract_no) {
		this.contract_no = contract_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
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

	public void setPet_no(int pet_no) {
		this.pet_no = pet_no;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public void setPet_user_no(int pet_user_no) {
		this.pet_user_no = pet_user_no;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public void setPet_birth(Date pet_birth) {
		this.pet_birth = pet_birth;
	}

	public void setPetAddress(String petAddress) {
		this.petAddress = petAddress;
	}

	public void setPetPhone(String petPhone) {
		this.petPhone = petPhone;
	}

	public void setPetNickname(String petNickname) {
		this.petNickname = petNickname;
	}

	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}

	public void setPet_categoryName(String pet_categoryName) {
		this.pet_categoryName = pet_categoryName;
	}

	public void setContract_type(String contract_type) {
		this.contract_type = contract_type;
	}

	@Override
	public String toString() {
		return "Contract [contract_no=" + contract_no + ", user_no=" + user_no + ", pet_service_regno="
				+ pet_service_regno + ", contract_date=" + contract_date + ", contract_start=" + contract_start
				+ ", contract_end=" + contract_end + ", contract_status=" + contract_status + ", contract_star="
				+ contract_star + ", pet_no=" + pet_no + ", userAddress=" + userAddress + ", userPhone=" + userPhone
				+ ", userName=" + userName + ", userNickname=" + userNickname + ", userGender=" + userGender
				+ ", pet_user_no=" + pet_user_no + ", pet_name=" + pet_name + ", pet_birth=" + pet_birth
				+ ", petAddress=" + petAddress + ", petPhone=" + petPhone + ", petNickname=" + petNickname
				+ ", petGender=" + petGender + ", pet_categoryName=" + pet_categoryName + ", contract_type="
				+ contract_type + "]";
	}



}