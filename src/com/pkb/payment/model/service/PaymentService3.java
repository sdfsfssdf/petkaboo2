package com.pkb.payment.model.service;
import static com.pkb.common.JDBCTemplate.close;
import static com.pkb.common.JDBCTemplate.commit;
import static com.pkb.common.JDBCTemplate.getConnection;
import static com.pkb.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.pkb.member.model.dao.UserDAO;
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

	public HashMap<String, Object> selectTotalInfo(int curr, int limit) {
		Connection con = getConnection();
		HashMap<String,Object> totalInfo = null;
		ArrayList<HashMap<String,String>> todayList = new PaymentDao3().selectTodayRefund(con);
		
		if(todayList != null){
			ArrayList<HashMap<String,String>> totalList = new PaymentDao3().selectRefundList(con,curr,limit);
			
			if(totalList !=null){
				totalInfo = new HashMap<String,Object>();
				totalInfo.put("todayList", todayList);
				totalInfo.put("totalList", totalList);
			}
		}
		
		close(con);
		
		return totalInfo;
	}

	public int getRefundListCount() {
		Connection con = getConnection();
		
		int count = new PaymentDao3().getRefundListCound(con);
		close(con);
		return count;
	}

	public int refundApproval(int totalAmount, int refundAmount, int user_no, int petsitter_no, int rate, int payment_no) {
		Connection con = getConnection();
		int result = 0;
		int result2 = 0;
		int result3 = 0;
		result = new PaymentDao3().refundApproval(con, refundAmount, user_no);
		if(result > 0) {
			result2 = new PaymentDao3().refundApproval(con,(int)((totalAmount-refundAmount)*((100-rate)*0.01)), petsitter_no);
			if(result2 > 0){
				result3= new PaymentDao3().updateRefundPaymentStatus(con,payment_no);
				
				if(result3 > 0){
					
					commit(con);
				} else {
					rollback(con);
				}
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		close(con);
		
		return result2;
		
	}

}
