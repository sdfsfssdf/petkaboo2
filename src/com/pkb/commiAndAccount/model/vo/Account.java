package com.pkb.commiAndAccount.model.vo;

import java.io.Serializable;

public class Account implements Serializable {
	private int withdrawInfoNo ;
	private String accountNo;
	private String bankName;
	private String user_name;
	
	public Account(){ }
	
	public Account(int withdrawInfoNo, String accountNo, String bankName, String user_name) {
		super();
		this.withdrawInfoNo = withdrawInfoNo;
		this.accountNo = accountNo;
		this.bankName = bankName;
		this.user_name = user_name;
	}

	public int getWithdrawInfoNo() {
		return withdrawInfoNo;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public String getBankName() {
		return bankName;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setWithdrawInfoNo(int withdrawInfoNo) {
		this.withdrawInfoNo = withdrawInfoNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Override
	public String toString() {
		return "Account [withdrawInfoNo=" + withdrawInfoNo + ", accountNo=" + accountNo + ", bankName=" + bankName
				+ ", user_name=" + user_name + "]";
	}
}
