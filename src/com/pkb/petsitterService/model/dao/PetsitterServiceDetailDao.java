package com.pkb.petsitterService.model.dao;

import static com.pkb.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.pkb.petsitterService.model.vo.PetsitterService;

public class PetsitterServiceDetailDao {
	private Properties prop = new Properties();

	public PetsitterServiceDetailDao(){
		String fileName = PetsitterServiceDetailDao.class.getResource("/sql/petsitterService/petsitterService-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	public int insertPetsitterServiceDetail(Connection con, PetsitterService ps) {
		PreparedStatement pstmt = null;
		int result  = 0;
		
		String query = prop.getProperty("insertPetsitterServiceDetail");
		System.out.println(ps);
		try {
			pstmt = con.prepareStatement(query);
			
			// psdDetail 객체의 정보 꺼내와서 쿼리문 완성
			pstmt.setInt(1, ps.getPet_category());
			pstmt.setInt(2, ps.getService_charge());
			pstmt.setInt(3, ps.getPet_count());
			pstmt.setString(4, ps.getService_detail());
			pstmt.setString(5, ps.getService_restrict());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
