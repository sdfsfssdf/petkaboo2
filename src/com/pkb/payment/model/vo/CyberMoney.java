package com.pkb.payment.model.vo;

public class CyberMoney implements java.io.Serializable {
	private int money_no;		//사이버머니잔액일련번호
	private int user_no;		//회원번호
	private int money;			//잔액
	
	public CyberMoney(){}

	public CyberMoney(int money_no, int user_no, int money) {
		super();
		this.money_no = money_no;
		this.user_no = user_no;
		this.money = money;
	}

	public int getMoney_no() {
		return money_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney_no(int money_no) {
		this.money_no = money_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	@Override
	public String toString() {
		return "CyberMoney [money_no=" + money_no + ", user_no=" + user_no + ", money=" + money + "]";
	}
	
	
}
