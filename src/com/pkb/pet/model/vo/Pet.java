package com.pkb.pet.model.vo;

import java.sql.Date;

public class Pet {
	private int pet_no;				//반려동물번호
	private int user_no;			//회원번호
	private int pet_category;		//동물카테고리번호
	private String pet_categoryname;//동물카테고리명
	private String pet_name;		//반려동물이름
	private Date pet_birth;			//반려동물생일
	private String pet_gender;		//반려동물성별
	private String neutral_chk;		//중성화여부
	private String pet_weight;		//무게
	private String pet_memo;		//메모
	
	public Pet(){}

	public Pet(int pet_no, int user_no, int pet_category, String pet_categoryname, String pet_name, Date pet_birth,
			String pet_gender, String neutral_chk, String pet_weight, String pet_memo) {
		super();
		this.pet_no = pet_no;
		this.user_no = user_no;
		this.pet_category = pet_category;
		this.pet_categoryname = pet_categoryname;
		this.pet_name = pet_name;
		this.pet_birth = pet_birth;
		this.pet_gender = pet_gender;
		this.neutral_chk = neutral_chk;
		this.pet_weight = pet_weight;
		this.pet_memo = pet_memo;
	}

	public int getPet_no() {
		return pet_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public int getPet_category() {
		return pet_category;
	}

	public String getPet_categoryname() {
		return pet_categoryname;
	}

	public String getPet_name() {
		return pet_name;
	}

	public Date getPet_birth() {
		return pet_birth;
	}

	public String getPet_gender() {
		return pet_gender;
	}

	public String getNeutral_chk() {
		return neutral_chk;
	}

	public String getPet_weight() {
		return pet_weight;
	}

	public String getPet_memo() {
		return pet_memo;
	}

	public void setPet_no(int pet_no) {
		this.pet_no = pet_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public void setPet_category(int pet_category) {
		this.pet_category = pet_category;
	}

	public void setPet_categoryname(String pet_categoryname) {
		this.pet_categoryname = pet_categoryname;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public void setPet_birth(Date pet_birth) {
		this.pet_birth = pet_birth;
	}

	public void setPet_gender(String pet_gender) {
		this.pet_gender = pet_gender;
	}

	public void setNeutral_chk(String neutral_chk) {
		this.neutral_chk = neutral_chk;
	}

	public void setPet_weight(String pet_weight) {
		this.pet_weight = pet_weight;
	}

	public void setPet_memo(String pet_memo) {
		this.pet_memo = pet_memo;
	}

	@Override
	public String toString() {
		return "Pet [pet_no=" + pet_no + ", user_no=" + user_no + ", pet_category=" + pet_category
				+ ", pet_categoryname=" + pet_categoryname + ", pet_name=" + pet_name + ", pet_birth=" + pet_birth
				+ ", pet_gender=" + pet_gender + ", neutral_chk=" + neutral_chk + ", pet_weight=" + pet_weight
				+ ", pet_memo=" + pet_memo + "]";
	}

	
	
	
}
