package com.pkb.commiAndAccount.model.vo;

import java.io.Serializable;
import java.util.ArrayList;


public class CommissionAndAccountList implements Serializable{
	private ArrayList<Account> alist;
	private ArrayList<Commission> clist;
	private ArrayList<PetCategory> plist;
	
	public CommissionAndAccountList() { }

	public CommissionAndAccountList(ArrayList<Account> alist, ArrayList<Commission> clist,
				ArrayList<PetCategory> plist) {
		super();
		this.alist = alist;
		this.clist = clist;
		this.plist = plist;
	}

	public ArrayList<Account> getAlist() {
		return alist;
	}

	public ArrayList<Commission> getClist() {
		return clist;
	}

	public void setAlist(ArrayList<Account> alist) {
		this.alist = alist;
	}

	public void setClist(ArrayList<Commission> clist) {
		this.clist = clist;
	}

	public ArrayList<PetCategory> getPlist() {
		return plist;
	}

	public void setPlist(ArrayList<PetCategory> plist) {
		this.plist = plist;
	}

	@Override
	public String toString() {
		return "CommissionAndAccountList [alist=" + alist + ", clist=" + clist + ", plist=" + plist + "]";
	}

}
