package com.pkb.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Pet implements Serializable {
	private int petNo ;
	private int userNo;
	private int petCategory;
	private String petName;
	private Date petBirth;
	private String petCategoryMajorName;
	private String petCategoryMinorName;
	private String petGender;
	private String neutralChk;
	private String petWeight;
	private String petMeno;
	
	public Pet() { }

	public Pet(int petNo, int userNo, int petCategory, String petName, Date petBirth, String petCategoryMajorName,
			String petCategoryMinorName, String petGender, String neutralChk, String petWeight, String petMeno) {
		super();
		this.petNo = petNo;
		this.userNo = userNo;
		this.petCategory = petCategory;
		this.petName = petName;
		this.petBirth = petBirth;
		this.petCategoryMajorName = petCategoryMajorName;
		this.petCategoryMinorName = petCategoryMinorName;
		this.petGender = petGender;
		this.neutralChk = neutralChk;
		this.petWeight = petWeight;
		this.petMeno = petMeno;
	}

	public int getPetNo() {
		return petNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public int getPetCategory() {
		return petCategory;
	}

	public String getPetName() {
		return petName;
	}

	public Date getPetBirth() {
		return petBirth;
	}

	public String getPetCategoryMajorName() {
		return petCategoryMajorName;
	}

	public String getPetCategoryMinorName() {
		return petCategoryMinorName;
	}

	public String getPetGender() {
		return petGender;
	}

	public String getNeutralChk() {
		return neutralChk;
	}

	public String getPetWeight() {
		return petWeight;
	}

	public String getPetMeno() {
		return petMeno;
	}

	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public void setPetCategory(int petCategory) {
		this.petCategory = petCategory;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public void setPetBirth(Date petBirth) {
		this.petBirth = petBirth;
	}

	public void setPetCategoryMajorName(String petCategoryMajorName) {
		this.petCategoryMajorName = petCategoryMajorName;
	}

	public void setPetCategoryMinorName(String petCategoryMinorName) {
		this.petCategoryMinorName = petCategoryMinorName;
	}

	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}

	public void setNeutralChk(String neutralChk) {
		this.neutralChk = neutralChk;
	}

	public void setPetWeight(String petWeight) {
		this.petWeight = petWeight;
	}

	public void setPetMeno(String petMeno) {
		this.petMeno = petMeno;
	}

	@Override
	public String toString() {
		return "Pet [petNo=" + petNo + ", userNo=" + userNo + ", petCategory=" + petCategory + ", petName=" + petName
				+ ", petBirth=" + petBirth + ", petCategoryMajorName=" + petCategoryMajorName
				+ ", petCategoryMinorName=" + petCategoryMinorName + ", petGender=" + petGender + ", neutralChk="
				+ neutralChk + ", petWeight=" + petWeight + ", petMeno=" + petMeno + "]";
	}

	

}