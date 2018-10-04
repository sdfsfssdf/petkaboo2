package com.pkb.petsitterService.model.dao;

import static com.pkb.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

public class PetsitterApplyDao {

	private Properties prop = new Properties();	// Properties
	
	public PetsitterApplyDao(){
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

	public int insertOne(Connection con, int user_no) {
		PreparedStatement pstmt = null;		
		int result = 0;
		String query = prop.getProperty("PetsitterApply");
		
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

	public int insertHistory(Connection con, int user_no) {
		PreparedStatement pstmt = null;		
		int result = 0;
		String query = prop.getProperty("PetsitterApplyHistory");
		
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
	
	
	
}
