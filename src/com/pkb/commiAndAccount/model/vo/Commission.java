package com.pkb.commiAndAccount.model.vo;

import java.io.Serializable;

public class Commission implements Serializable{
	private int petCategory;
	private String petCategoryName;
	private int fee_rate;
	
	public Commission(){}

	public Commission(int petCategory, String petCategoryName, int fee_rate) {
		super();
		this.petCategory = petCategory;
		this.petCategoryName = petCategoryName;
		this.fee_rate = fee_rate;
	}

	public int getPetCategory() {
		return petCategory;
	}

	public String getPetCategoryName() {
		return petCategoryName;
	}

	public int getFee_rate() {
		return fee_rate;
	}

	public void setPetCategory(int petCategory) {
		this.petCategory = petCategory;
	}

	public void setPetCategoryName(String petCategoryName) {
		this.petCategoryName = petCategoryName;
	}

	public void setFee_rate(int fee_rate) {
		this.fee_rate = fee_rate;
	}

	@Override
	public String toString() {
		return "Commition [petCategory=" + petCategory + ", petCategoryName=" + petCategoryName + ", fee_rate="
				+ fee_rate + "]";
	}

	
}