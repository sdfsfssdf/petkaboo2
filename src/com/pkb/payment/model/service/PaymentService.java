
package com.pkb.payment.model.service;

import java.sql.Connection;

import com.pkb.payment.model.dao.PaymentDao;
import com.pkb.payment.model.dao.PaymentDao2;
import com.pkb.payment.model.vo.Payment;

import static com.pkb.common.JDBCTemplate.*;

import java.util.ArrayList;
import java.util.HashMap;

import com.pkb.payment.model.vo.PayHistory;

public class PaymentService {

	public HashMap<String, Object> selectMainInfo(int currPage, int limit) {
		Connection con = getConnection();
		HashMap<String, Object> totalInfo = null;
		ArrayList<PayHistory> phlist = new PaymentDao().selectTodayPaymentHistoryList(con);

		if (phlist != null) {
			ArrayList<Payment> plist = new PaymentDao().selectTotalList(con, currPage, limit);
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

	public int insertRecharge(Payment py, int user_no) {
		Connection con = getConnection();

		int result = new PaymentDao().insertRecharge(con, py);

		int result2 = 0;
		int result3 = 0;
		if (result > 0) { // 결제 테이블 insert한 결과가 1일시
			result2 = new PaymentDao().insertPayHistory(con, user_no);

			if (result2 > 0) {
				// 사이버머니 이력 테이블에 insert한 결과가 1일시

				result3 = new PaymentDao().updateCybermoney(con, user_no, py);

				if (result3 > 0) { // 잔액 업데이트한 결과가 1일시

					commit(con);
				} else {
					rollback(con);
				}
				close(con);

			} else {
				rollback(con);
			}

		} else {
			rollback(con);
		}

		return result3; // *??
	}

	public HashMap<String, Object> selectRecPay(int contract_no, int user_no) {
		Connection con = getConnection();

		HashMap<String, Object> rp = new PaymentDao().selectRecPay(contract_no, user_no, con);
		if (rp != null) {

		}

		return rp;
	}

	public ArrayList<Payment> selectListInquiry(String pay_date, String pay_method) {
		Connection con = getConnection();
		ArrayList<Payment> inquiry = new PaymentDao2().selectListInquiry(pay_date,pay_method, con);

		close(con);

		return inquiry;
	}

}
