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
import java.util.Properties;

import com.pkb.pet.model.vo.Pet;
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
	
	public int insertContractPetsitting(Connection con, Contract c, PetsitterService p) {
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

	public Contract selectContractPetsitting(Connection con, Contract c) {
		Contract c2 = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectContractPetsitting");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, c.getContract_no());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				c2 = new Contract();
				
				c2.setContract_no(rset.getInt("contract_no"));
				c2.setUser_no(rset.getInt("user_no"));
				c2.setPet_no(rset.getInt("pet_no"));
				c2.setPet_service_regno(rset.getInt("pet_service_regno"));
				c2.setContract_date(rset.getDate("contract_date"));
				c2.setContract_start(rset.getDate("contract_start"));
				c2.setContract_end(rset.getDate("contract_end"));
				c2.setContract_status(rset.getString("contract_status"));
				c2.setContract_star(rset.getInt("contrct_star"));
				c2.setAddress(rset.getString("address"));
				c2.setUser_name(rset.getString("user_name"));
				
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
			
		}
		
		
		return c2;
	}

}

