package com.pkb.payment.model.service;

import static com.pkb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.pkb.payment.model.dao.PaymentDao;
import com.pkb.payment.model.vo.PayHistory;
import com.pkb.payment.model.vo.Payment;
public class PaymentService {

	public HashMap<String, Object> selectMainInfo(int currPage, int limit) {
		Connection con = getConnection();
		HashMap<String,Object> totalInfo = null;
		ArrayList<PayHistory> phlist = new PaymentDao().selectTodayPaymentHistoryList(con);
		
		if(phlist != null){
			ArrayList<Payment> plist = new PaymentDao().selectTotalList(con,currPage, limit);
		} 
		
		close(con);
		
		
		return totalInfo;
	}

	public int getListCount() {
		Connection con = getConnection();
		int count = new PaymentDao().getListCount(con); 
		close(con);
		return count;
	}
}




