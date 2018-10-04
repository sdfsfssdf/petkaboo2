package com.pkb.petsitterService.model.dao;

import static com.pkb.common.JDBCTemplate.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.pkb.member.model.vo.CyberMoney;
import com.pkb.reservation.model.vo.Contract;

public class ContractS2Dao {

	private Properties prop = new Properties();	// Properties
	
	public ContractS2Dao(){
		// 경로 가져오기
		String fileName = ContractS2Dao.class.getResource("/sql/petsitterService/petsitterService-query.properties").getPath();
		
		try {
			
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}			
		
	}
	
	public int insertContract(Connection con, Contract c) {
		PreparedStatement pstmt = null;
		int result  = 0;
		
		String query = prop.getProperty("insertContract");
		System.out.println(c);
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, c.getUser_no());
			pstmt.setInt(2, c.getPet_no());
			pstmt.setInt(3, c.getPet_service_regno());
			pstmt.setDate(4, c.getContract_start());
			pstmt.setDate(5, c.getContract_end());
			pstmt.setString(6, "W");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Contract selectOne(Connection con, int parseInt, int parseInt2) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Contract c = null;
		
		String query = prop.getProperty("selectOneContract");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, parseInt);
			pstmt.setInt(2, parseInt2);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				c = new Contract();
				
				c.setContract_date(rset.getDate("contract_date"));
				c.setContract_start(rset.getDate("contract_start"));
				c.setContract_end(rset.getDate("contract_end"));
				c.setUser_no(rset.getInt("user_no"));
				c.setContract_no(rset.getInt("contract_no"));
				c.setContract_status(rset.getString("contract_status"));
				c.setContract_star(rset.getInt("contract_star"));
				c.setUserAddress(rset.getString("address"));
				c.setUserName(rset.getString("user_name"));
				c.setUserPhone(rset.getString("phone"));
				c.setUserNickname(rset.getString("nickname"));
				c.setPet_no(rset.getShort("pet_no"));
				c.setPet_service_regno(rset.getInt("pet_service_regno"));
				c.setPet_user_no(rset.getInt("pet_user_no"));
				c.setPet_name(rset.getString("pet_user_name"));	
				c.setPetNickname(rset.getString("pet_nickname"));
				c.setPetAddress(rset.getString("pet_address"));
				c.setPetPhone(rset.getString("pet_phone"));
				c.setPetGender(rset.getString("pet_gender"));
				c.setPet_categoryName(rset.getString("pet_categoryname"));
				c.setContract_type(rset.getString("contract_type"));
				c.setService_charge(rset.getInt("service_charge"));

				if(rset.getString("service_status") != null){
					c.setService_status(rset.getString("service_status"));
				}
				
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return c;
	}

	public ArrayList<Contract> selectList(Connection con, int parseInt) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Contract> cList = null;
		
		String query = prop.getProperty("selectMyAllContract");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, parseInt);
			
			rset = pstmt.executeQuery();
			cList = new ArrayList<Contract>();
			
			while(rset.next()){
				Contract c = new Contract();
				
				c.setContract_date(rset.getDate("contract_date"));
				c.setContract_start(rset.getDate("contract_start"));
				c.setContract_end(rset.getDate("contract_end"));
				c.setUser_no(rset.getInt("client_user_no"));
				c.setContract_no(rset.getInt("contract_no"));
				c.setContract_status(rset.getString("contract_status"));
				c.setContract_star(rset.getInt("contract_star"));
				c.setUserAddress(rset.getString("address"));
				c.setUserName(rset.getString("client_user_name"));
				c.setUserPhone(rset.getString("client_phone"));
				c.setUserNickname(rset.getString("client_nickname"));
				c.setUserGender(rset.getString("client_gender"));
				c.setPet_no(rset.getShort("pet_no"));
				c.setPet_service_regno(rset.getInt("pet_service_regno"));
				c.setPet_user_no(rset.getInt("petsitter_user_no"));
				c.setPet_name(rset.getString("user_name"));	
				c.setPetNickname(rset.getString("nickname"));
				c.setPetAddress(rset.getString("address"));
				c.setPetPhone(rset.getString("phone"));
				c.setPetGender(rset.getString("gender"));
				c.setPet_categoryName(rset.getString("pet_categoryname"));
				c.setContract_type(rset.getString("contract_type"));
				c.setService_charge(rset.getInt("service_charge"));
				
				if(rset.getString("service_status") != null){
					c.setService_status(rset.getString("service_status"));
				}				
				cList.add(c);
			}
			
			// 테스트 코드
			System.out.println("cList dao: " + cList);			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return cList;
	}

	public int AcceptReq(Connection con, int contractno, int client_user_no, String acceptReq) {
		PreparedStatement pstmt = null;
		int result  = 0;
		
		String query = prop.getProperty("AcceptReqContract");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, acceptReq);
			pstmt.setInt(2, contractno);
			pstmt.setInt(3, client_user_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public ArrayList<Contract> selectMyList(Connection con, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Contract> cList = null;
		
		String query = prop.getProperty("selectAllMyClientContract");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, user_no);
			
			rset = pstmt.executeQuery();
			cList = new ArrayList<Contract>();
			
			while(rset.next()){
				Contract c = new Contract();
				
				c.setContract_date(rset.getDate("contract_date"));
				c.setContract_start(rset.getDate("contract_start"));
				c.setContract_end(rset.getDate("contract_end"));
				c.setUser_no(rset.getInt("client_user_no"));
				c.setContract_no(rset.getInt("contract_no"));
				c.setContract_status(rset.getString("contract_status"));
				c.setContract_star(rset.getInt("contract_star"));
				c.setUserAddress(rset.getString("address"));
				c.setUserName(rset.getString("client_user_name"));
				c.setUserPhone(rset.getString("client_phone"));
				c.setUserNickname(rset.getString("client_nickname"));
				c.setUserGender(rset.getString("client_gender"));
				c.setPet_no(rset.getShort("pet_no"));
				c.setPet_service_regno(rset.getInt("pet_service_regno"));
				c.setPet_user_no(rset.getInt("petsitter_user_no"));
				c.setPet_name(rset.getString("user_name"));	
				c.setPetNickname(rset.getString("nickname"));
				c.setPetAddress(rset.getString("address"));
				c.setPetPhone(rset.getString("phone"));
				c.setPetGender(rset.getString("gender"));
				c.setPet_categoryName(rset.getString("pet_categoryname"));
				c.setContract_type(rset.getString("contract_type"));
				c.setService_charge(rset.getInt("service_charge"));
				
				if(rset.getString("service_status") != null){
					c.setService_status(rset.getString("service_status"));
				}
				
				cList.add(c);
			}
			
			// 테스트 코드
			System.out.println("cMyList dao: " + cList);			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return cList;
		
	}

	public CyberMoney checkCMoney(Connection con, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result  = 0;
		CyberMoney cMoney = null;
		
		String query = prop.getProperty("checkCMoney");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, user_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				cMoney = new CyberMoney();
				
				cMoney.setCyberMoneyNo(rset.getInt("money_no"));
				cMoney.setUserNo(rset.getInt("user_no"));
				cMoney.setMoney(rset.getInt("money"));
				
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}			
		
		return cMoney;
	}

	public int refuseReq(Connection con, int contractno, int client_user_no, String acceptReq) {
		PreparedStatement pstmt = null;
		int result  = 0;
		
		String query = prop.getProperty("RefuseReqContract");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, acceptReq);
			pstmt.setInt(2, contractno);
			pstmt.setInt(3, client_user_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int createService(Connection con, int contractno) {
		PreparedStatement pstmt = null;
		int result  = 0;
		
		String query = prop.getProperty("createService");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, contractno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public int insertPayment(Connection con, int contractno, int user_no, int fullPrice) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertPayment");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, user_no);
			pstmt.setInt(2, fullPrice);
			pstmt.setString(3, "U");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}				
		
		return result;
	}

	public int insertPayhistory(Connection con, int contractno, int user_no, int fullPrice) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertPayhistory");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, user_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

	public int proceedCybermoney(Connection con, int contractno, int user_no, int fullPrice) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("proceedCybermoney");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fullPrice);
			pstmt.setInt(2, user_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

	public int insertContractmoney(Connection con, int contractno, int user_no, int fullPrice) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertContractmoney");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, contractno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

	public int updateService(Connection con, int contractno, int user_no, int fullPrice) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateService");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "E");
			pstmt.setInt(2, contractno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

	public int endContract(Connection con, int user_no, int client_user_no, int psrno, int contractNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("endContract");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "X");
			pstmt.setInt(2, contractNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

	public int refundStep1(Connection con, int contractNo, int user_no) {
		int step1 = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("refundStep1");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, contractNo);
			pstmt.setInt(2, user_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){				
				step1 = rset.getInt("pay_amount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return step1;
	}

	public int refundStep2(Connection con, int contractNo, int user_no, int step1) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertPayment");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, user_no);
			pstmt.setInt(2, step1);
			pstmt.setString(3, "F");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}				
		
		return result;
	}

	public int updateRefundService(Connection con, int contractNo, int user_no, int step1) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateService");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "F");
			pstmt.setInt(2, contractNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

	public int increaseMoney(Connection con, int user_no, int step2) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("increaseMoney");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, step2);
			pstmt.setInt(2, user_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;		
	}

	



}
