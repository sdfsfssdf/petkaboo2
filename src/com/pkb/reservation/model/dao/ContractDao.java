package com.pkb.reservation.model.dao;

import static com.pkb.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.pkb.member.model.vo.User;
import com.pkb.petsitterService.model.vo.PetsitterService;
import com.pkb.reservation.model.vo.Contract;

public class ContractDao {
	
	private Properties prop = new Properties();
	
	public ContractDao(){
		
		String fileName = ContractDao.class.getResource("/sql/contract/contract-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	public int insertContractPetsitting(Connection con, Contract c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertContractPetsitting");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, c.getUser_no());
			pstmt.setInt(2, c.getPet_service_regno());
			pstmt.setDate(3, c.getContract_start());
			pstmt.setDate(4, c.getContract_end());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		
		return result;
	}

	public int insertContractServiceHistory(Connection con, int contract_no) {
		
		PreparedStatement pstmt = null;
		int result2 = 0;
		
		String query = prop.getProperty("insertContractServiceHistory");
		
		pstmt = con.prepareStatement(query);
		
		
		
		return 0;
	}

}

