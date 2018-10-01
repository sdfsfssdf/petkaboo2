package com.pkb.petsitterService.model.dao;

import static com.pkb.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.pkb.petsitterService.model.vo.PetsitterService;
import com.pkb.reservation.model.vo.Contract;

public class PetsitterContractDao {
	
	private Properties prop = new Properties();	// Properties
	
	public PetsitterContractDao(){
		// 경로 가져오기
		String fileName = PetsitterServiceDao.class.getResource("/sql/petsitterService/petsitterService-query.properties").getPath();

		try {
			
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}				
	}
	
	public Contract selectOne(Connection con, int psrno, int petsitterno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Contract c = null;
		
		String query = prop.getProperty("selectOneContract");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, psrno);
			pstmt.setInt(2, petsitterno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				c = new Contract();
				
				c.setContract_date(rset.getDate("contract_date"));
				c.setContract_start(rset.getDate("contract_start"));
				c.setContract_end(rset.getDate("contract_end"));
				c.setUser_no(rset.getInt("user_no"));
				c.setContract_no(rset.getInt("contract_no"));
				c.setContract_status(rset.getString("contract_status"));
				// c.setContract_star(rset.getInt("contract_star"));
				c.setUserAddress(rset.getString("address"));
				c.setUserName(rset.getString("user_name"));
				c.setUserPhone(rset.getString("phone"));
				c.setPet_service_regno(rset.getInt("pet_service_regno"));
				c.setPet_no(rset.getInt("pet_user_no"));
				c.setPet_name(rset.getString("pet_user_name"));
				
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		// 테스트코드
		System.out.println("dao단에서 c 객체의 값은: " + c);
		
		return c;
	}

}
