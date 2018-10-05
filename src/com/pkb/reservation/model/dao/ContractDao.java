package com.pkb.reservation.model.dao;

import static com.pkb.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

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
			pstmt.setInt(2, c.getPet_service_regno());
			pstmt.setDate(3, c.getContract_start());
			pstmt.setDate(4, c.getContract_end());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		
		return result;
	}

	public int insertContractServiceHistory(Connection con, int contract_no) {
		
		Statement stmt = null;
		int result2 = 0;
		
		
		String query = prop.getProperty("insertContractServiceHistory");
		
		
		try {
			stmt = con.createStatement();
			result2 = stmt.executeUpdate(query);
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			
			close(stmt);
		}
		return result2;
	}



	public Contract searchContractPetsitting(Connection con, int user_no, int servno) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Contract c = null;
		
		String query = prop.getProperty("searchContractPetsitting");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, servno);
			pstmt.setInt(2, user_no);
			
			rset = pstmt.executeQuery();
			
		
			while(rset.next()){
				
				c = new Contract();
				c.setUserName(rset.getString("user_name"));
				c.setUserPhone(rset.getString("phone"));
				c.setUserAddress(rset.getString("address"));
				c.setPetNickname(rset.getString("nickname"));
				c.setPetAddress(rset.getString("address"));
				c.setPetPhone(rset.getString("phone"));
				c.setContract_no(rset.getInt("contract_no"));
				c.setContract_date(rset.getDate("contract_date"));
				c.setContract_start(rset.getDate("contract_start"));
				c.setContract_end(rset.getDate("contract_end"));
				c.setContract_status(rset.getString("contract_status"));
				c.setContract_star(rset.getInt("contract_star"));
				c.setPet_service_regno(rset.getInt("pet_service_regno"));
				c.setUser_no(rset.getInt("user_no"));
				c.setPet_no(rset.getInt("pet_no"));
				c.setPet_name(rset.getString("pet_name"));
				c.setPet_birth(rset.getDate("pet_birth"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		return c;
	}

	public ArrayList<Integer> getCountReservationStatus(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("getStatusCount");
		ArrayList<Integer> list = null;
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			list = new ArrayList<Integer>();
			
			if(rs.next()){
				list.add(rs.getInt(1));
				list.add(rs.getInt(2));
				list.add(rs.getInt(3));
				list.add(rs.getInt(4));
				list.add(rs.getInt(5));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectTotalList(Connection con, int currPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		String query = prop.getProperty("totalList");
		
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<HashMap<String,Object>>();
			while(rs.next()){
				hmap = new HashMap<String,Object>();
				hmap.put("contract_no", rs.getInt("contract_no"));
				hmap.put("user_no", rs.getInt("user_no"));
				hmap.put("pet_no", rs.getInt("pet_no"));
				hmap.put("pet_service_regno", rs.getInt("PET_SERVICE_REGNO"));
				hmap.put("contract_date", rs.getString("CONTRACT_DATE"));
				hmap.put("contract_start", rs.getString("CONTRACT_START"));
				hmap.put("contract_end", rs.getString("CONTRACT_END"));
				hmap.put("contract_status", rs.getString("CONTRACT_STATUS"));
				hmap.put("service_status", rs.getString("SERVICE_STATUS"));
				hmap.put("service_date", rs.getString("SERVICE_DATE"));
				
				list.add(hmap);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

}

