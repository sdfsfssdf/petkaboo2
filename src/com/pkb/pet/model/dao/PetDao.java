package com.pkb.pet.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.pkb.pet.model.vo.Pet;
import static com.pkb.common.JDBCTemplate.*;

public class PetDao {
	
	private Properties prop = new Properties();
	
	public PetDao(){
		String fileName = PetDao.class.getResource("/sql/pet/pet-query.properties").getPath();
	
			try {
				prop.load(new FileReader(fileName));
			} catch (FileNotFoundException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
	}
		
	
	public int insertPetInfo(Connection con, Pet p) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("insertPetInfo");
			
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, p.getUser_no());
				pstmt.setString(2, p.getPet_name());
				pstmt.setDate(3, p.getPet_birth());
				pstmt.setString(4, p.getPet_gender());
				pstmt.setString(5, p.getNeutral_chk());
				pstmt.setString(6, p.getPet_weight());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally{
				close(pstmt);
				
				
			}
		
		
		return result;
	}

}
