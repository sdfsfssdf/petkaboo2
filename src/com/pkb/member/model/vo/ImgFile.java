package com.pkb.member.model.vo;

import java.util.Date;

public class ImgFile {
	private int file_no;
	private Date file_date;
	private String file_name;
	private int file_use;
	private int user_no;
	private String file_path;
	private String file_dalete;
	
	public ImgFile(){};
	
	public ImgFile(int file_no, Date file_date, String file_name, int file_use, int user_no, String file_path,
			String file_dalete) 
	{
		this.file_no = file_no;
		this.file_date = file_date;
		this.file_name = file_name;
		this.file_use = file_use;
		this.user_no = user_no;
		this.file_path = file_path;
		this.file_dalete = file_dalete;
	}
	
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public Date getFile_date() {
		return file_date;
	}
	public void setFile_date(Date file_date) {
		this.file_date = file_date;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getFile_use() {
		return file_use;
	}
	public void setFile_use(int file_use) {
		this.file_use = file_use;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getFile_dalete() {
		return file_dalete;
	}
	public void setFile_dalete(String file_dalete) {
		this.file_dalete = file_dalete;
	}
	@Override
	public String toString() {
		return "File [file_no=" + file_no + ", file_date=" + file_date + ", file_name=" + file_name + ", file_use="
				+ file_use + ", user_no=" + user_no + ", file_path=" + file_path + ", file_dalete=" + file_dalete + "]";
	}
	
	

}
