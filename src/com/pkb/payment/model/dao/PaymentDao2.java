package com.pkb.payment.model.dao;

import static com.pkb.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.pkb.payment.model.vo.Payment;

public class PaymentDao2 {
	private Properties prop = new Properties();

	public PaymentDao2() {
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	// 여기부터
	public ArrayList<Payment> selectListInquiry(int user_no, String pay_date, String pay_method, Connection con,int currentPage, int limit) {
		System.out.println("헤니다오들옴!");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Payment> inquiry = null;
		StringBuilder sb = null;
		String query=prop.getProperty("selectListInquiry");
		
		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			if (!pay_date.equals("all")) {
				sb = new StringBuilder();
				if (pay_date.equals("today")) {
					sb.append(
							"WHERE TO_CHAR(PAY_pay_date,'YYYYmmdd') BETWEEN TO_CHAR(SYSpay_date,'YYYYmmdd') AND TO_CHAR(SYSpay_date,'YYYYmmdd') ");
				} else if (pay_date.equals("week")) {
					sb.append(
							"WHERE TO_CHAR(PAY_pay_date,'YYYYmmdd') BETWEEN TO_CHAR(SYSpay_date-7,'YYYYmmdd') AND TO_CHAR(SYSpay_date,'YYYYmmdd') ");
				} else if (pay_date.equals("month")) {
					sb.append(
							"WHERE TO_CHAR(PAY_pay_date,'YYYYmmdd') BETWEEN TO_CHAR(SYSpay_date-30,'YYYYmmdd') AND TO_CHAR(SYSpay_date,'YYYYmmdd') ");
				} else if (pay_date.equals("year")) {
					sb.append(
							"WHERE TO_CHAR(PAY_pay_date,'YYYYmmdd') BETWEEN TO_CHAR(SYSpay_date-365,'YYYYmmdd') AND TO_CHAR(SYSpay_date,'YYYYmmdd') ");
				}
			}
			/*
			 * if (method.equals("creditCard")) { if (sb == null) { sb = new
			 * StringBuilder(); sb.append("WHERE PAYMENT_TYPE = 0 "); } else {
			 * sb.append("AND PAYMENT_TYPE = 0 "); } } else if
			 * (method.equals("bankBook")) { if (sb == null) { sb = new
			 * StringBuilder(); sb.append("WHERE PAYMENT_TYPE = 1 "); } else {
			 * sb.append("AND PAYMENT_TYPE = 1 "); } }
			 */
			if (pay_method.equals("use")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAY_METHOD = 'U' ");
				} else {
					sb.append("AND PAY_METHOD = 'U' ");
				}
			} else if (pay_method.equals("cencel")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAY_METHOD = 'R' ");
				} else {
					sb.append("AND PAY_METHOD = 'R' ");
				}
			} else if (pay_method.equals("reCharge")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAY_METHOD = 'C' ");
				} else {
					sb.append("AND PAY_METHOD = 'C' ");
				}
			}

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, user_no);
			rset = pstmt.executeQuery();// 이 물음표 들어있는 쿼리에 자리에 맞춰 값을 넣고 실행해라얌
			inquiry = new ArrayList<Payment>();

			if (rset.next()) {// 뒤에있냐? 없으면 너가 마지막, 있으면 끝날때까지 돌령 ex) for(int i
								// =0; i< rset.length(); i++)
				Payment p = new Payment();
				p.setPay_no(rset.getInt("pay_no"));
				p.setUser_no(rset.getInt("user_no"));
				// payment VO 다 set get맞춰서 하기
				p.setPay_amount(rset.getInt("pay_amount"));
				p.setPay_date(rset.getDate("pay_date"));
				p.setPay_method(rset.getString("pay_method"));
				p.setPayment_type(rset.getInt("payment_type"));
				p.setPayment_cash_status(rset.getInt("payment_cash_status"));
				p.setCard_apply_no(rset.getString("card_apply_no"));
				p.setImp_uid(rset.getString("import_auth_no"));
				p.setEnter_account_no(rset.getInt("payment_dist_account"));

				inquiry.add(p);
				System.out.println("inquiry 들어옴/" + inquiry);

				// 웨어절 + ?
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return inquiry;

	}

	public int selectListInquiryCount(Connection con, int user_no, String pay_date, String pay_method) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("getSelectListInquiryCount");
		int count = 0;
		StringBuilder sb = null;
		
		try {
			pstmt = con.prepareStatement(query);
			if (!pay_date.equals("all")) {
				sb = new StringBuilder();
				if (pay_date.equals("today")) {
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				} else if (pay_date.equals("week")) {
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE-7,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				} else if (pay_date.equals("month")) {
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE-30,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				} else if(pay_date.equals("year")){
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE-365,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				}
			}

			if (pay_method.equals("use")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAY_METHOD = 'U' ");
				} else {
					sb.append("AND PAY_METHOD = 'U' ");
				}
			} else if (pay_method.equals("cencel")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAY_METHOD = 'R' ");
				} else {
					sb.append("AND PAY_METHOD = 'R' ");
				}
			} else if(pay_method.equals("reCharge")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAY_METHOD = 'C' ");
				} else {
					sb.append("AND PAY_METHOD = 'C' ");
				}
			}
			if(sb !=null){
				System.out.println(sb.toString() + " 조건쓰");
				pstmt.setString(1, sb.toString());
			} else {
				pstmt.setString(1, " ");
			}
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("count="+count);
		return count;
	}

	public ArrayList<Payment> searchMainInfo(Connection con, int currentPage, int limit, String pay_date,
			String pay_method) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Payment> plist = null;
		Payment p = null;
		String query = prop.getProperty("selectListInquiry");
		StringBuilder sb = null;
		
		try {
			stmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			if (!pay_date.equals("all")) {
				sb = new StringBuilder();
				if (pay_date.equals("today")) {
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				} else if (pay_date.equals("week")) {
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE-7,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				} else if (pay_date.equals("month")) {
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE-30,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				} else if(pay_date.equals("year")){
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE-365,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				}
			}
			if (pay_method.equals("creditCard")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAYMENT_TYPE = 0 ");
				} else {
					sb.append("AND PAYMENT_TYPE = 0 ");
				}
			} else if (pay_method.equals("bankBook")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAYMENT_TYPE = 1 ");
				} else {
					sb.append("AND PAYMENT_TYPE = 1 ");
				}
			}

			if (pay_method.equals("use")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAY_METHOD = 'U' ");
				} else {
					sb.append("AND PAY_METHOD = 'U' ");
				}
			} else if (pay_method.equals("cencel")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAY_METHOD = 'R' ");
				} else {
					sb.append("AND PAY_METHOD = 'R' ");
				}
			} else if(pay_method.equals("reCharge")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAY_METHOD = 'C' ");
				} else {
					sb.append("AND PAY_METHOD = 'C' ");
				}
			}
			
			if(sb !=null){
				query = query + sb.toString() + " )) WHERE RNUM BETWEEN "+startRow + " AND " + endRow;
			} else {
				query = query + " )) WHERE RNUM BETWEEN "+startRow + " AND " + endRow;
			}

			System.out.println(query);
			rs = stmt.executeQuery(query);
			plist = new ArrayList<Payment>();

			while (rs.next()) {
				p = new Payment();

				p.setPay_no(rs.getInt("pay_no"));
				p.setUser_no(rs.getInt("user_no"));
				p.setPay_amount(rs.getInt("pay_amount"));
				p.setPay_date(rs.getDate("pay_date"));
				p.setPay_method(rs.getString("pay_method"));
				p.setPayment_type(rs.getInt("payment_type"));
				p.setPayment_cash_status(rs.getInt("payment_cash_status"));
				p.setPayment_cash_date(rs.getDate("payment_cash_date"));
				p.setCard_apply_no(rs.getString("card_apply_no"));
				p.setImp_uid(rs.getString("import_auth_no"));
				p.setAccount_no(rs.getString("account_no"));
				p.setEmail(rs.getString("email"));

				plist.add(p);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return plist;
	}
}
