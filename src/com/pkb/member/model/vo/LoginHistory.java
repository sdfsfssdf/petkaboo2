package com.pkb.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class LoginHistory implements Serializable {
	private int userNo ;
	private Date loginDate;
	private String loginIp;
	private String location;
	
	public LoginHistory(){ }

	public LoginHistory(int userNo, Date loginDate, String loginIp, String location) {
		super();
		this.userNo = userNo;
		this.loginDate = loginDate;
		this.loginIp = loginIp;
		this.location = location;
	}

	public int getUserNo() {
		return userNo;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public String getLocation() {
		return location;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "LoginHistory [userNo=" + userNo + ", loginDate=" + loginDate + ", loginIp=" + loginIp + ", location="
				+ location + "]";
	}
	
	
}
