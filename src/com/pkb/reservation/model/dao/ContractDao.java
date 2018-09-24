package com.pkb.reservation.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import static com.pkb.common.JDBCTemplate.*;

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
			pstmt.setDate(2, c.getContract_start());
			pstmt.setDate(3, c.getContract_end());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		
		return result;
	}

}

