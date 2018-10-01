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
	public ArrayList<Payment> selectListInquiry(String pay_date, String pay_method,Connection con) {
		System.out.println("헤니다오들옴!");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Payment> inquiry = null;
		String date1 = "";
		String date2 = "";
		/*if(pay_date.equals("today")){
  			if(pay_method.equals("all")){
				
			} else if (pay_method.equals("use")){
				
				
			} else {
				
			}
		} */
		if(pay_method.equals("all")){
			String r ="";
		}
		
		String query = prop.getProperty("selectListInquiry");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,payment.getUser_no());
			rset = pstmt.executeQuery();//이 물음표 들어있는 쿼리에 자리에 맞춰 값을 넣고 실행해라얌
			inquiry = new ArrayList<Payment>();

			if (rset.next()) {//뒤에있냐? 없으면 너가 마지막, 있으면 끝날때까지 돌령 ex) for(int i =0; i< rset.length(); i++)
				Payment p = new Payment();
				p.setPay_no(rset.getInt("pay_no"));
				p.setUser_no(rset.getInt("user_no"));
				//payment VO 다 set get맞춰서 하기
				p.setPay_amount(rset.getInt("pay_amount"));
				p.setPay_date(rset.getDate("pay_date"));
				p.setPay_method(rset.getString("pay_method"));
				p.setPayment_type(rset.getInt("payment_type"));
				p.setPayment_cash_status(rset.getInt("payment_cash_status"));
				p.setPayment_cash_date(rset.getDate("payment_cash_date"));
				p.setCard_apply_no(rset.getString("card_apply_no"));
				p.setImp_uid(rset.getString("import_auth_no"));
				p.setEnter_account_no(rset.getInt("payment_dist_account"));
				
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
