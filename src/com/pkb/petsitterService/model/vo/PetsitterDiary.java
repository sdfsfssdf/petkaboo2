package com.pkb.petsitterService.model.vo;

import java.sql.Date;

public class PetsitterDiary {
	private int ps_user_no;
	private int client_user_no;
	private int article_no;
	private Date article_date;
	private String article_title;
	private String article_contents;
	private String article_type;
	private int article_lv;
	private int contract_no;
	private int article_status;
	private int article_refno;
	private Date article_modify_date;
	
	public PetsitterDiary(){}

	public PetsitterDiary(int ps_user_no, int client_user_no, int article_no, Date article_date, String article_title,
			String article_contents, String article_type, int article_lv, int contract_no, int article_status,
			int article_refno, Date article_modify_date) {
		super();
		this.ps_user_no = ps_user_no;
		this.client_user_no = client_user_no;
		this.article_no = article_no;
		this.article_date = article_date;
		this.article_title = article_title;
		this.article_contents = article_contents;
		this.article_type = article_type;
		this.article_lv = article_lv;
		this.contract_no = contract_no;
		this.article_status = article_status;
		this.article_refno = article_refno;
		this.article_modify_date = article_modify_date;
	}

	public int getPs_user_no() {
		return ps_user_no;
	}

	public int getClient_user_no() {
		return client_user_no;
	}

	public int getArticle_no() {
		return article_no;
	}

	public Date getArticle_date() {
		return article_date;
	}

	public String getArticle_title() {
		return article_title;
	}

	public String getArticle_contents() {
		return article_contents;
	}

	public String getArticle_type() {
		return article_type;
	}

	public int getArticle_lv() {
		return article_lv;
	}

	public int getContract_no() {
		return contract_no;
	}

	public int getArticle_status() {
		return article_status;
	}

	public int getArticle_refno() {
		return article_refno;
	}

	public Date getArticle_modify_date() {
		return article_modify_date;
	}

	public void setPs_user_no(int ps_user_no) {
		this.ps_user_no = ps_user_no;
	}

	public void setClient_user_no(int client_user_no) {
		this.client_user_no = client_user_no;
	}

	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}

	public void setArticle_date(Date article_date) {
		this.article_date = article_date;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public void setArticle_contents(String article_contents) {
		this.article_contents = article_contents;
	}

	public void setArticle_type(String article_type) {
		this.article_type = article_type;
	}

	public void setArticle_lv(int article_lv) {
		this.article_lv = article_lv;
	}

	public void setContract_no(int contract_no) {
		this.contract_no = contract_no;
	}

	public void setArticle_status(int article_status) {
		this.article_status = article_status;
	}

	public void setArticle_refno(int article_refno) {
		this.article_refno = article_refno;
	}

	public void setArticle_modify_date(Date article_modify_date) {
		this.article_modify_date = article_modify_date;
	}

	@Override
	public String toString() {
		return "PetsitterDiary [ps_user_no=" + ps_user_no + ", client_user_no=" + client_user_no + ", article_no="
				+ article_no + ", article_date=" + article_date + ", article_title=" + article_title
				+ ", article_contents=" + article_contents + ", article_type=" + article_type + ", article_lv="
				+ article_lv + ", contract_no=" + contract_no + ", article_status=" + article_status
				+ ", article_refno=" + article_refno + ", article_modify_date=" + article_modify_date + "]";
	}
	
}
