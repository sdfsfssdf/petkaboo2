package com.pkb.commiAndAccount.model.vo;

import java.io.Serializable;

public class PetCategory implements Serializable{
	private int petCategory;
	private String categoryName;
	private int categoryLV;
	private int categoryRefNo;
	
	public PetCategory(){ }

	public PetCategory(int petCategory, String categoryName, int categoryLV, int categoryRefNo) {
		super();
		this.petCategory = petCategory;
		this.categoryName = categoryName;
		this.categoryLV = categoryLV;
		this.categoryRefNo = categoryRefNo;
	}

	public int getPetCategory() {
		return petCategory;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public int getCategoryLV() {
		return categoryLV;
	}

	public int getCategoryRefNo() {
		return categoryRefNo;
	}


	public void setPetCategory(int petCategory) {
		this.petCategory = petCategory;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public void setCategoryLV(int categoryLV) {
		this.categoryLV = categoryLV;
	}
	

	public void setCategoryRefNo(int categoryRefNo) {
		this.categoryRefNo = categoryRefNo;
	}

	@Override
	public String toString() {
		return "PetCategory [petCategory=" + petCategory + ", categoryName=" + categoryName + ", categoryLV="
				+ categoryLV + ", categoryRefNo=" + categoryRefNo + "]";
	}
}
