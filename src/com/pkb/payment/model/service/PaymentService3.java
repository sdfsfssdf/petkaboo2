package com.pkb.payment.model.service;
import static com.pkb.common.JDBCTemplate.*;
import static com.pkb.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.pkb.payment.model.dao.PaymentDao;
import com.pkb.payment.model.dao.PaymentDao3;
import com.pkb.payment.model.vo.Payment;
public class PaymentService3 {

	public int getBankBookListCount() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int count = new PaymentDao3().getBankBookListCount(con);
		close(con);
		return count;
	}

	public HashMap<String, Object> selectBankBookInfo(int currentPage, int limit) {
		Connection con = getConnection();
		HashMap<String,Object> totalInfo = null;
		ArrayList<Payment> plist = new PaymentDao3().selectTodayInfo(con);
		
		if(plist != null) {
			ArrayList<Payment> plist2 = new PaymentDao3().selectBankBookList(con,currentPage, limit);
			
			if(plist2 != null){
				totalInfo = new HashMap<String,Object>();
				totalInfo.put("todayInfo", plist);
				totalInfo.put("plist", plist2);
			}
		}
		return totalInfo;
	}

	public int[] updateBankApproval(String[] selectUserNos) {
		Connection con = getConnection();
		int[] result = new PaymentDao3().updateBankApproval(con,selectUserNos);
		int[] result2 = null;
		if(result.length > 0){
			result2 = new PaymentDao3().updateCybermoney(con,selectUserNos);
			if(result2.length> 0){
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		
		close(con);
		return result2 ;
	}

}
