package com.pkb.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable {
	private int article_no;				//게시물 번호
	private String user_name;			//작성자 이름
	private Date article_date;			//작성일시
	private String article_title;		//글제목
	private String article_contents;	//글내용
	private String article_type;		//게시물타입
	private int article_lv;				//게시물레벨
	private int article_refno;			//참고게시물번호	
	private int article_status;			//게시물 삭제여부
	private Date article_modify_date;	//게시물 수정일

	public Notice() { }

	public Notice(int article_no, String user_name, Date article_date, String article_title, String article_contents,
			String article_type, int article_lv, int article_refno, int article_status, Date article_modify_date) {
		super();
		this.article_no = article_no;
		this.user_name = user_name;
		this.article_date = article_date;
		this.article_title = article_title;
		this.article_contents = article_contents;
		this.article_type = article_type;
		this.article_lv = article_lv;
		this.article_refno = article_refno;
		this.article_status = article_status;
		this.article_modify_date = article_modify_date;
	}

	public int getArticle_no() {
		return article_no;
	}

	public String getUser_name() {
		return user_name;
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

	public int getArticle_refno() {
		return article_refno;
	}

	public int getArticle_status() {
		return article_status;
	}

	public Date getArticle_modify_date() {
		return article_modify_date;
	}

	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
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

	public void setArticle_refno(int article_refno) {
		this.article_refno = article_refno;
	}

	public void setArticle_status(int article_status) {
		this.article_status = article_status;
	}

	public void setArticle_modify_date(Date article_modify_date) {
		this.article_modify_date = article_modify_date;
	}

	@Override
	public String toString() {
		return "Notice [article_no=" + article_no + ", user_name=" + user_name + ", article_date=" + article_date
				+ ", article_title=" + article_title + ", article_contents=" + article_contents + ", article_type="
				+ article_type + ", article_lv=" + article_lv + ", article_refno=" + article_refno + ", article_status="
				+ article_status + ", article_modify_date=" + article_modify_date + "]";
	}

	
	
	
	
}