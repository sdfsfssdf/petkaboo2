

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
import java.util.HashMap;
import java.util.Properties;

import com.pkb.member.model.vo.User;
import com.pkb.notice.model.vo.Notice;
import com.pkb.payment.model.vo.CyberMoney;
import com.pkb.payment.model.vo.PayHistory;
import com.pkb.payment.model.vo.Payment;
import com.pkb.petsitterService.model.vo.PetsitterService;
import com.pkb.reservation.model.vo.Contract;

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
			pstmt.setString(5, py.getImp_uid());
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


	public HashMap<String, Object> selectRecPay(int contract_no, int user_no, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> rp = null;
		User user = null;
		Contract c = null;
		PetsitterService p = null;
		CyberMoney cm = null;
		
		String query = prop.getProperty("selectRecPay");
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, contract_no);
			pstmt.setInt(2, user_no);
			rset = pstmt.executeQuery();
			
			rp = new HashMap<String, Object>();
			
			if(rset.next()){
				user = new User();
				c = new Contract();
				p = new PetsitterService();
				cm = new CyberMoney();
				user.setUser_no(rset.getInt("user_no"));
				user.setEmail(rset.getString("email"));
				user.setUser_pwd(rset.getString("user_pwd"));
				user.setUser_type(rset.getInt("user_type"));
				user.setUser_name(rset.getString("user_name"));
				user.setPhone(rset.getString("phone"));
				user.setBirthday(rset.getDate("birthday"));
				user.setGender(rset.getString("gender"));
				user.setAddress(rset.getString("address"));
				user.setSms_chk(rset.getString("sms_chk"));
				user.setEmail_chk(rset.getString("email_chk"));
				user.setEnrollDate(rset.getDate("enrolldate"));
				user.setNickname(rset.getString("nickname"));
				user.setUser_grade(rset.getInt("user_grade"));
				user.setPet_auth(rset.getString("pet_auth"));
				user.setUser_status(rset.getInt("user_status"));
				user.setFile_no(rset.getInt("file_no"));
				user.setEmail_hash(rset.getString("email_hash"));
				user.setArticle_no(rset.getInt("article_no"));
				user.setSms_number(rset.getString("sms_number"));
				c.setContract_no(rset.getInt("contract_no"));
				c.setUser_no(rset.getInt("user_no"));
				c.setPet_no(rset.getInt("pet_no"));
				c.setPet_service_regno(rset.getInt("pet_service_regno"));
				c.setContract_date(rset.getDate("contract_date"));
				c.setContract_start(rset.getDate("contract_start"));
				c.setContract_end(rset.getDate("contract_end"));
				c.setContract_status(rset.getString("contract_status"));
				c.setContract_star(rset.getInt("contract_star"));
				p.setPet_service_regno(rset.getInt("pet_service_regno"));
				p.setUser_no(rset.getInt("user_no"));
				p.setUser_name(rset.getString("user_name"));
				p.setNickname(rset.getString("nickname"));
				p.setAddress(rset.getString("address"));
				p.setPhone(rset.getString("phone"));
				p.setGender(rset.getString("gender"));
				String file_path = rset.getString("file_path");
				String file_name = rset.getString("file_name");
				String fullpath = "/" + file_path + file_name;
				p.setProfileImage(fullpath);
				p.setContract_type(rset.getString("contract_type"));
				p.setPet_category(rset.getInt("pet_category"));
				p.setPet_count(rset.getInt("pet_count"));
				p.setService_charge(rset.getInt("service_charge"));
				p.setContract_days(rset.getString("contract_days"));
				p.setContract_start(rset.getDate("contract_start"));
				p.setContract_end(rset.getDate("contract_end"));
				p.setService_detail(rset.getString("service_detail"));
				p.setService_restrict(rset.getString("service_restrict"));
				cm.setMoney_no(rset.getInt("money_no"));
				cm.setUser_no(rset.getInt("user_no"));
				cm.setMoney(rset.getInt("money"));
				
				rp.put("user", user);
				rp.put("contract", c);
				rp.put("psv", p);
				rp.put("money", cm);
				
				}
			}catch(SQLException e){
				
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
		
		return rp;
	}


}