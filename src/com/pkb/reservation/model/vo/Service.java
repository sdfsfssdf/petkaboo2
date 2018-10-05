package com.pkb.reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Service implements Serializable{
	private int contract_no ;
	private String service_status;
	private Date service_date;
	
	public Service() {
		
	}

	public Service(int contract_no, String service_status, Date service_date) {
		super();
		this.contract_no = contract_no;
		this.service_status = service_status;
		this.service_date = service_date;
	}

	public int getContract_no() {
		return contract_no;
	}

	public String getService_status() {
		return service_status;
	}

	public Date getService_date() {
		return service_date;
	}

	public void setContract_no(int contract_no) {
		this.contract_no = contract_no;
	}

	public void setService_status(String service_status) {
		this.service_status = service_status;
	}

	public void setService_date(Date service_date) {
		this.service_date = service_date;
	}

	@Override
	public String toString() {
		return "Service [contract_no=" + contract_no + ", service_status=" + service_status + ", service_date="
				+ service_date + "]";
	}
	
	
}
