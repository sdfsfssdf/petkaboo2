package com.pkb.petsitterService.model.dao;

import static com.pkb.common.JDBCTemplate.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
		int result  = 0;
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

}
