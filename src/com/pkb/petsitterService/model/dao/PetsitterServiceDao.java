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
	
}
