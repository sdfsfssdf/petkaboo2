package com.pkb.reservation.model.vo;

import java.sql.Date;

public class ContractServiceHistory {
	private int contract_no;			//계약번호
	private String service_status;		//돌봄서비스 상태
	private Date service_date;			//이력발생일시
	
	public ContractServiceHistory(){}

	public ContractServiceHistory(int contract_no, String service_status, Date service_date) {
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
		return "ContractServiceHistory [contract_no=" + contract_no + ", service_status=" + service_status
				+ ", service_date=" + service_date + "]";
	}
	
	
	
	
}
