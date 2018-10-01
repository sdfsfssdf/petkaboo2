
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
import com.pkb.payment.model.vo.PaymentInfo;
import com.pkb.petsitterService.model.vo.PetsitterService;
import com.pkb.reservation.model.vo.Contract;

public class PaymentDao {
	private Properties prop = new Properties();

	public PaymentDao() {
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	public HashMap<String, Integer> selectTodayPaymentHistoryList(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		HashMap<String, Integer> todayInfo = null;
		String query = prop.getProperty("selectPaymentHistoryList");

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			todayInfo = new HashMap<String, Integer>();
			while (rs.next()) {
				todayInfo.put("count", rs.getInt(1));
				todayInfo.put("totalAmout", rs.getInt(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return todayInfo;
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
		} finally {
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

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, contract_no);
			pstmt.setInt(2, user_no);
			rset = pstmt.executeQuery();

			rp = new HashMap<String, Object>();

			if (rset.next()) {
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
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return rp;
	}

	public int getSearchListCount(Connection con, String date, String method, String division) {
		Statement stmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("getSearchListCount");
		int count = 0;
		StringBuilder sb = null;
		try {
			stmt = con.createStatement();
			if (!date.equals("all")) {
				sb = new StringBuilder();
				if (date.equals("today")) {
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				} else if (date.equals("week")) {
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE-7,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				} else if (date.equals("month")) {
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE-30,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				} else if(date.equals("year")){
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE-365,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				}
			}
			if (method.equals("creditCard")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAYMENT_TYPE = 0 ");
				} else {
					sb.append("AND PAYMENT_TYPE = 0 ");
				}
			} else if (method.equals("bankBook")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAYMENT_TYPE = 1 ");
				} else {
					sb.append("AND PAYMENT_TYPE = 1 ");
				}
			}

			if (division.equals("use")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAY_METHOD = 'U' ");
				} else {
					sb.append("AND PAY_METHOD = 'U' ");
				}
			} else if (division.equals("cencel")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAY_METHOD = 'R' ");
				} else {
					sb.append("AND PAY_METHOD = 'R' ");
				}
			} else if(division.equals("reCharge")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAY_METHOD = 'C' ");
				} else {
					sb.append("AND PAY_METHOD = 'C' ");
				}
			}
			if(sb !=null){
				query = query + sb.toString();
			}
			System.out.println(query);
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

	public CyberMoney searchCyberMoney(Connection con, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		CyberMoney cm = null;
		
		String query = prop.getProperty("searchCyberMoney");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, user_no);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				cm = new CyberMoney();
				cm.setMoney_no(rset.getInt("money_no"));
				cm.setUser_no(rset.getInt("user_no"));
				cm.setMoney(rset.getInt("money"));
				
				
			}
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
			
			
		}
		
		return cm;
	}


	public PaymentInfo searchRecPayInfo(Connection con, int contract_no, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		PaymentInfo pi = null;
		
		String query = prop.getProperty("searchRecPayInfo");
		
		try {
			

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, contract_no);
			pstmt.setInt(2, user_no);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				pi = new PaymentInfo();
				
				pi.setUserAddress(rset.getString("address"));
				pi.setUserName(rset.getString("user_name"));
				pi.setContract_no(rset.getInt("contract_no"));
				pi.setContract_date(rset.getDate("contract_date"));
				pi.setContract_start(rset.getDate("contract_start"));
				pi.setContract_end(rset.getDate("contract_end"));
				pi.setContract_status(rset.getString("contract_status"));
				pi.setPet_service_regno(rset.getInt("pet_service_regno"));
				pi.setContract_type(rset.getString("contract_type"));
				pi.setService_charge(rset.getInt("service_charge"));
				pi.setPet_count(rset.getInt("pet_count"));
				pi.setService_status(rset.getString("service_status"));
				pi.setPet_categoryname(rset.getString("pet_categoryname"));
				
			}
				
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				close(rset);
				close(pstmt);
			}
			
		
		return pi;
	}


	public ArrayList<Payment> searchMainInfo(Connection con, int currentPage, int limit, String date, String method,
			String division) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Payment> plist = null;
		Payment p = null;
		String query = prop.getProperty("selectSearchList");
		StringBuilder sb = null;
		
		try {
			stmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			if (!date.equals("all")) {
				sb = new StringBuilder();
				if (date.equals("today")) {
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				} else if (date.equals("week")) {
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE-7,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				} else if (date.equals("month")) {
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE-30,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				} else if(date.equals("year")){
					sb.append(
							"WHERE TO_CHAR(PAY_DATE,'YYYYmmdd') BETWEEN TO_CHAR(SYSDATE-365,'YYYYmmdd') AND TO_CHAR(SYSDATE,'YYYYmmdd') ");
				}
			}
			if (method.equals("creditCard")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAYMENT_TYPE = 0 ");
				} else {
					sb.append("AND PAYMENT_TYPE = 0 ");
				}
			} else if (method.equals("bankBook")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAYMENT_TYPE = 1 ");
				} else {
					sb.append("AND PAYMENT_TYPE = 1 ");
				}
			}

			if (division.equals("use")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAY_METHOD = 'U' ");
				} else {
					sb.append("AND PAY_METHOD = 'U' ");
				}
			} else if (division.equals("cencel")) {
				if (sb == null) {
					sb = new StringBuilder();
					sb.append("WHERE PAY_METHOD = 'R' ");
				} else {
					sb.append("AND PAY_METHOD = 'R' ");
				}
			} else if(division.equals("reCharge")) {
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

	public ArrayList<HashMap<String, String>> selectTodayIncomeList(Connection con) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<HashMap<String,String>> list = null;
		HashMap<String,String> infoMap = null;
		String query = prop.getProperty("selectTodayIncome");
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String,String>>();
			while(rs.next()){
				infoMap = new HashMap<String,String>();
				infoMap.put("count", String.valueOf(rs.getInt(1)));
				infoMap.put("totalIncome", String.valueOf(rs.getInt(2)));
				infoMap.put("category", rs.getString("PET_CATEGORYNAME"));
				infoMap.put("rate", rs.getString("FEE_RATE"));
				
				list.add(infoMap);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}