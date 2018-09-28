package com.pkb.payment.model.dao;

import static com.pkb.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.pkb.payment.model.vo.Payment;

public class PaymentDao {
	private Properties prop = new Properties();
	
	public PaymentDao(){
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		
		} catch (IOException e) {
		
			e.printStackTrace();
		}
	}
	
	
	public int insertRecharge(Connection con, Payment py) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		String query = prop.getProperty("insertRecharge");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, py.getUser_no());
			pstmt.setInt(2, py.getPay_amount());
			pstmt.setString(3, py.getPay_method());
			pstmt.setString(4, py.getCard_apply_no());
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}


	public int insertPayHistory(Connection con, int user_no) {
		PreparedStatement pstmt = null;
		int result2 = 0;
		
		String query = prop.getProperty("insertPayHistory");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, user_no);
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result2;
	}

}
