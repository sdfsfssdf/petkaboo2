package com.pkb.pet.model.dao;

import static com.pkb.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import com.pkb.common.JDBCTemplate.*;

import com.pkb.pet.model.vo.Pet;

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


	public Pet selectPetInfo(Connection con, Pet p) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Pet p2 = null;
		
		String query = prop.getProperty("selectPetInfo");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p.getUser_no());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				p2 = new Pet();
				
				p2.setPet_no(rset.getInt("pet_no"));
				p2.setUser_no(rset.getInt("user_no"));
				p2.setPet_category(rset.getInt("pet_category"));
				p2.setPet_name(rset.getString("pet_name"));
				p2.setPet_birth(rset.getDate("pet_birth"));
				p2.setPet_gender(rset.getString("pet_gender"));
				p2.setNeutral_chk(rset.getString("netural_chk"));
				p2.setPet_weight(rset.getString("pet_weight"));
				p2.setPet_memo(rset.getString("pet_memo"));
				
				
			}
			
			
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
			
		}
		
		
		return p2;
	}

}
