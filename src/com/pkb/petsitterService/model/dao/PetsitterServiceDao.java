package com.pkb.petsitterService.model.dao;

import static com.pkb.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.pkb.petsitterService.model.vo.PetsitterService;

public class PetsitterServiceDao {

	private Properties prop = new Properties();	// ProperTies
	
	public PetsitterServiceDao(){
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

	public int insertPetsitterService(Connection con, PetsitterService ps) {
		PreparedStatement pstmt = null;
		int result  = 0;
		
		String query = prop.getProperty("insertPetsitterService");
		System.out.println(ps);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ps.getUser_no());
			pstmt.setString(2, ps.getContract_type());
			// 임시코드. 요일은 구분자 처리 후 넣어야 함
			pstmt.setString(3, ps.getContract_days());
			pstmt.setDate(4, ps.getContract_start());
			pstmt.setDate(5, ps.getContract_end());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		// 쿼리 받아오기
		String query = prop.getProperty("listCount");
		
		int listCount = 0;
		
		System.out.println(query);
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	// 모든 펫시터 조회
	public ArrayList<PetsitterService> selectList(Connection con, int currentPage, int limit) {
		// 페이징 처리시에는 PrepareStatement 사용
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		ArrayList<PetsitterService> list = null;
		
		String query = prop.getProperty("selectAllPetsitterService");
		
		try {
			// 페이징 처리 후
			pstmt = con.prepareStatement(query);
			
			// 조회 시작할 행 번호와 마지막 행 번호 계산
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<PetsitterService>();
			
			while(rset.next()){
				PetsitterService p = new PetsitterService();
				
				p.setPet_service_regno(rset.getInt("pet_service_regno"));
				p.setUser_no(rset.getInt("user_no"));
				p.setUser_name(rset.getString("user_name"));
				p.setNickname(rset.getString("nickname"));
				p.setAddress(rset.getString("address"));
				p.setPhone(rset.getString("phone"));
				p.setGender(rset.getString("gender"));
				// 프로필 이미지 경로 가져오기
				String file_path = rset.getString("file_path");
				String file_name = rset.getString("file_name");
				String fullpath = "/" + file_path + file_name;
				p.setProfileImage(fullpath);
				p.setContract_type(rset.getString("contract_type"));
				p.setPet_category(rset.getInt("pet_category"));
				p.setPet_count(rset.getInt("pet_count"));
				p.setService_charge(rset.getInt("service_charge"));
				p.setContract_days(rset.getString("contract_days"));
				p.setContract_start(rset.getDate("contract_start"));
				p.setContract_end(rset.getDate("contract_end"));
				p.setService_detail(rset.getString("service_detail"));
				p.setService_restrict(rset.getString("service_restrict"));
				
				list.add(p);
			}
			
			// 테스트 코드
			System.out.println("dao : " + list);			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public PetsitterService selectOne(Connection con, int psrno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		PetsitterService p = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, psrno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				p = new PetsitterService();
				
				p.setPet_service_regno(rset.getInt("pet_service_regno"));
				p.setUser_no(rset.getInt("user_no"));
				p.setUser_name(rset.getString("user_name"));
				p.setNickname(rset.getString("nickname"));
				p.setAddress(rset.getString("address"));
				p.setPhone(rset.getString("phone"));
				p.setGender(rset.getString("gender"));
				// p.setFile_no(rset.getString("file_no"));
				// 프로필 이미지 경로 가져오기
				String file_path = rset.getString("file_path");
				String file_name = rset.getString("file_name");
				String fullpath = "/" + file_path + file_name;
				p.setProfileImage(fullpath);
				p.setContract_type(rset.getString("contract_type"));
				p.setPet_category(rset.getInt("pet_category"));
				p.setPet_count(rset.getInt("pet_count"));
				p.setService_charge(rset.getInt("service_charge"));
				p.setContract_days(rset.getString("contract_days"));
				p.setContract_start(rset.getDate("contract_start"));
				p.setContract_end(rset.getDate("contract_end"));
				p.setService_detail(rset.getString("service_detail"));
				p.setService_restrict(rset.getString("service_restrict"));		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}
	
	public ArrayList<PetsitterService> searchList(Connection con, String searchKeyword, String gender, String arrayCondition) {
		// 페이징 처리시에는 PrepareStatement 사용
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		ArrayList<PetsitterService> list = null;
		
		String address = null;
		String pet_categoryname = null;
		String nickname = null;
		String gender1 = null;
		String gender2 = null;
		
		if(searchKeyword == null){
			address = "";
			pet_categoryname = "";
			nickname = "";
		} else {
			address = searchKeyword.toUpperCase();
			pet_categoryname = searchKeyword.toUpperCase();
			nickname = searchKeyword.toUpperCase();
		}
		
		if(gender == null){
			gender1 = "M";
			gender2 = "F";
		}else{
			gender1 = gender;
			gender2 = gender;
		}
		
		if(arrayCondition == null){
			arrayCondition = "";
		}
		
		String query = prop.getProperty("searchList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + nickname + "%");
			pstmt.setString(2, "%" + address + "%");
			pstmt.setString(3, "%" + pet_categoryname + "%");
			pstmt.setString(4, gender1);
			pstmt.setString(5, gender2);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<PetsitterService>();
			
			while(rset.next()){
				PetsitterService p = new PetsitterService();
				
				p.setPet_service_regno(rset.getInt("pet_service_regno"));
				p.setUser_no(rset.getInt("user_no"));
				p.setUser_name(rset.getString("user_name"));
				p.setNickname(rset.getString("nickname"));
				p.setAddress(rset.getString("address"));
				p.setPhone(rset.getString("phone"));
				p.setGender(rset.getString("gender"));
				// p.setFile_no(rset.getString("file_no"));
				// 프로필 이미지 경로 가져오기
				String file_path = rset.getString("file_path");
				String file_name = rset.getString("file_name");
				String fullpath = "/" + file_path + file_name;
				p.setProfileImage(fullpath);
				p.setContract_type(rset.getString("contract_type"));
				p.setPet_category(rset.getInt("pet_category"));
				p.setPet_count(rset.getInt("pet_count"));
				p.setService_charge(rset.getInt("service_charge"));
				p.setContract_days(rset.getString("contract_days"));
				p.setContract_start(rset.getDate("contract_start"));
				p.setContract_end(rset.getDate("contract_end"));
				p.setService_detail(rset.getString("service_detail"));
				p.setService_restrict(rset.getString("service_restrict"));
				
				list.add(p);
			}
			
			// 테스트 코드
			System.out.println("dao : " + list);			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}
	
	
}
