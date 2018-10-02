package com.pkb.payment.model.dao;

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

import static com.pkb.common.JDBCTemplate.close;
public class PaymentDao3 {
	private Properties prop = new Properties();

	public PaymentDao3() {
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	public int getBankBookListCount(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("getBankBookListCount");
		int count = 0;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return count;
	}

	public ArrayList<Payment> selectTodayInfo(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("selectTodayBankBook");
		Payment p = null;
		ArrayList<Payment> plist = null;
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			plist = new ArrayList<Payment>();
			while(rs.next()){
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

	public ArrayList<Payment> selectBankBookList(Connection con, int currPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Payment> plist = null;
		Payment p = null;
		String query = prop.getProperty("selectBankBookList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();
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
			close(pstmt);
		}

		return plist;
	}

	public int[] updateBankApproval(Connection con, String[] selectUserNos) {
		PreparedStatement pstmt = null;
		int[] result = null;
		String query = prop.getProperty("updateBankApproval");
		
		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < selectUserNos.length; i++) {
				String[] temp = selectUserNos[i].split("/");
				pstmt.setInt(1, Integer.parseInt(temp[0]));
				pstmt.addBatch();
			}
			
			result = pstmt.executeBatch();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int[] updateCybermoney(Connection con, String[] selectUserNos) {
		PreparedStatement pstmt = null;
		int[] result = null;

		String query = prop.getProperty("updateCybermoney");

		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < selectUserNos.length; i++) {
				String[] temp = selectUserNos[i].split("/");
				pstmt.setInt(1, Integer.parseInt(temp[2]));
				pstmt.setInt(2, Integer.parseInt(temp[1]));
				pstmt.addBatch();
			}
		

			result = pstmt.executeBatch();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;
	}
}
