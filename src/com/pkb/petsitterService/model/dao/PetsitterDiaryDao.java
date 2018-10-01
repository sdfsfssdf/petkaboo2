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

import com.pkb.petsitterService.model.vo.PetsitterDiary;
import com.pkb.petsitterService.model.vo.PetsitterService;

public class PetsitterDiaryDao {
	
	private Properties prop = new Properties();	// Properties
	
	public PetsitterDiaryDao(){
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

	public ArrayList<PetsitterDiary> searchDiary(Connection con, String user_no, String email) {
		// 페이징 처리시에는 PrepareStatement 사용
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		ArrayList<PetsitterDiary> myList = null;
		
		// 반드시 수정 필요
		String query = prop.getProperty("searchMydiary");
		
		try {
			// 페이징 처리 후
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			myList = new ArrayList<PetsitterDiary>();
			
			while(rset.next()){
				PetsitterDiary pd = new PetsitterDiary();
				
				pd.setPet_service_regno(rset.getInt("pet_service_regno"));
				pd.setUser_no(rset.getInt("user_no"));
				pd.setUser_name(rset.getString("user_name"));
				pd.setNickname(rset.getString("nickname"));
				pd.setAddress(rset.getString("address"));
				pd.setPhone(rset.getString("phone"));
				pd.setGender(rset.getString("gender"));
				// 프로필 이미지 경로 가져오기
				String file_path = rset.getString("file_path");
				String file_name = rset.getString("file_name");
				String fullpath = "/" + file_path + file_name;
				pd.setProfileImage(fullpath);
				pd.setContract_type(rset.getString("contract_type"));
				pd.setPet_category(rset.getInt("pet_category"));
				pd.setPet_count(rset.getInt("pet_count"));
				pd.setService_charge(rset.getInt("service_charge"));
				pd.setContract_days(rset.getString("contract_days"));
				pd.setContract_start(rset.getDate("contract_start"));
				pd.setContract_end(rset.getDate("contract_end"));
				pd.setService_detail(rset.getString("service_detail"));
				pd.setService_restrict(rset.getString("service_restrict"));
				
				myList.add(pd);
			}
			
			// 테스트 코드
			System.out.println("다이어리 조회 myList : " + myList);			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
				
		return myList;
	}
	
	

}
