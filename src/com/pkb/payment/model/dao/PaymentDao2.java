package com.pkb.payment.model.dao;

import static com.pkb.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.pkb.member.model.vo.ImgFile;
import com.pkb.payment.model.vo.Payment;

public class PaymentDao2 {
	private Properties prop = new Properties();
	
	public PaymentDao2(){
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		
		} catch (IOException e) {
		
			e.printStackTrace();
		}
	}
	//여기부터
	public ArrayList<Payment> selectListInquiry(Payment payment, Connection con) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Payment> inquiry = null;

		String query = prop.getProperty("selectListInquiry");
		try {
			pstmt = con.prepareStatement(query);
//			pstmt.setInt(1,payment.getUser_no());
//			pstmt.setDate(2,payment.getPay_date());
//			pstmt.setString(3,payment.getPay_method());
			rset = pstmt.executeQuery();//이 물음표 들어있는 쿼리에 자리에 맞춰 값을 넣고 실행해라얌
			inquiry = new ArrayList<Payment>();

			if (rset.next()) {//뒤에있냐? 없으면 너가 마지막, 있으면 끝날때까지 돌령 ex) for(int i =0; i< rset.length(); i++)
				Payment p = new Payment();
				p.setUser_no(rset.getInt("user_no"));
				//payment VO 다 set get맞춰서 하기
				p.setPay_date(rset.getDate("pay_date"));
				p.setPay_method(rset.getString("pay_method"));
				
				
				inquiry.add(p);
				System.out.println("inquiry 들어옴/" + inquiry );
				
				//웨어절 + ?
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

}
