
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
	
	
	

}

package com.pkb.payment.model.dao;


import java.io.FileNotFoundException;

import static com.pkb.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import static com.pkb.common.JDBCTemplate.*;
import com.pkb.notice.model.dao.NoticeDao;
import com.pkb.notice.model.vo.Notice;
import com.pkb.payment.model.vo.PayHistory;

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

	private Properties prop = new Properties();

	public PaymentDao() {
		String fileName = PaymentDao.class.getResource("/sql/notice/payment-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<PayHistory> selectTodayPaymentHistoryList(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		PayHistory ph = null;
		ArrayList<PayHistory> phlist = null;
		String query = prop.getProperty("selectTodayPaymentHistoryList");

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			phlist = new ArrayList<PayHistory>();
			while (rs.next()) {
				ph = new PayHistory();
				ph.setPay_no(rs.getInt("pay_no"));
				ph.setPay_recordno(rs.getInt("pay_recordno"));
				ph.setUser_no(rs.getInt("user_no"));

				phlist.add(ph);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return phlist;
	}

	public ArrayList<HashMap<String, Object>> selectTotalList(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("getListCount");
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

	public ArrayList<Payment> selectTotalList(Connection con, int currPage, int limit) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Payment> plist = null;
		Payment p = null;
		String query = prop.getProperty("selectList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();
			list = new ArrayList<Notice>();

			while (rs.next()) {
				nt = new Notice();

				nt.setArticle_no(rs.getInt("ARTICLE_NO"));
				nt.setUser_name(rs.getString("NICKNAME"));
				nt.setArticle_date(rs.getDate("ARTICLE_DATE"));
				nt.setArticle_title(rs.getString("ARTICLE_TITLE"));
				nt.setArticle_contents(rs.getString("ARTICLE_CONTENTS"));
				nt.setArticle_type(rs.getString("ARTICLE_TYPE"));
				nt.setArticle_lv(rs.getInt("ARTICLE_LV"));
				nt.setArticle_refno(rs.getInt("article_refno"));
				nt.setArticle_status(rs.getInt("article_status"));
				nt.setArticle_modify_date(rs.getDate("ARTICLE_MODIFY_DATE"));

				list.add(nt);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}
  
  public int insertRecharge(Connection con, Payment py) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		String query = prop.getProperty("insertRecharge");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, py.getUser_no());
			pstmt.setInt(2, py.getPay_amount());
			pstmt.setInt(3, py.getPayment_type());
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


	public int updateCybermoney(Connection con, int user_no, Payment py) {
		PreparedStatement pstmt = null;
		int result3 = 0;
		
		String query = prop.getProperty("updateCybermoney");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, py.getPay_amount());
			pstmt.setInt(2, user_no);
			
			result3 = pstmt.executeUpdate();
			
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(pstmt);
			
			
		}
		
		
		return result3;
	}
}

