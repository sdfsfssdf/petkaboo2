package com.pkb.member.model.vo;

import java.io.Serializable;

public class CyberMoney implements Serializable{

	private int cyberMoneyNo ;
	private int userNo ;
	private int money;
	
	public CyberMoney(){ }

	public CyberMoney(int cyberMoneyNo, int userNo, int money) {
		super();
		this.cyberMoneyNo = cyberMoneyNo;
		this.userNo = userNo;
		this.money = money;
	}

	public int getCyberMoneyNo() {
		return cyberMoneyNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public int getMoney() {
		return money;
	}

	public void setCyberMoneyNo(int cyberMoneyNo) {
		this.cyberMoneyNo = cyberMoneyNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	@Override
	public String toString() {
		return "CyberMoney [cyberMoneyNo=" + cyberMoneyNo + ", userNo=" + userNo + ", money=" + money + "]";
	}
	
	
}
