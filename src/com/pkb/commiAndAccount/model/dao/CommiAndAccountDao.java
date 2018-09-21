package com.pkb.commiAndAccount.model.dao;

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
import java.util.Properties;

import com.pkb.commiAndAccount.model.vo.Account;
import com.pkb.commiAndAccount.model.vo.Commission;
import com.pkb.commiAndAccount.model.vo.CommissionAndAccountList;
import com.pkb.commiAndAccount.model.vo.PetCategory;

public class CommiAndAccountDao {

	private Properties prop = new Properties();

	public CommiAndAccountDao() {
		String fileName = CommiAndAccountDao.class.getResource("/sql/commiAndAccount/commiAndAccount-query.properties")
				.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public CommissionAndAccountList selectCommitonList(Connection con) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet rs = null;
		CommissionAndAccountList caa = null;
		String query = prop.getProperty("selectCommitonList");

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			caa = new CommissionAndAccountList();
			caa.setClist(new ArrayList<Commission>());
			while (rs.next()) {
				Commission co = new Commission();
				co.setPetCategory(rs.getInt("PET_CATEGORY"));
				co.setFee_rate(rs.getInt("FEE_RATE"));
				co.setPetCategoryName(rs.getString("PET_CATEGORYNAME"));
				caa.getClist().add(co);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return caa;
	}

	public CommissionAndAccountList selectAccountList(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("selectAccountList");
		CommissionAndAccountList caa = null;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			caa = new CommissionAndAccountList();
			caa.setAlist(new ArrayList<Account>());
			while (rs.next()) {
				Account ac = new Account();
				ac.setWithdrawInfoNo(rs.getInt("WITHDRAW_INFO_NO"));
				ac.setAccountNo(rs.getString("ACCOUNT_NO"));
				ac.setBankName(rs.getString("BANK_NAME"));
				ac.setUser_name(rs.getString("USER_NAME"));

				caa.getAlist().add(ac);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return caa;
	}

	public int[] modifyCommssion(Connection con, ArrayList<Commission> clist) {
		PreparedStatement pstmt = null;
		int[] result = null;
		String query = prop.getProperty("modifyCommssion");

		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < clist.size(); i++) {
				pstmt.setInt(1, clist.get(i).getFee_rate());
				pstmt.setInt(2, clist.get(i).getPetCategory());
				pstmt.addBatch();
			}
			result = pstmt.executeBatch();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int[] deleteAccount(Connection con, int[] accNos) {
		PreparedStatement pstmt = null;
		int[] result = null;
		String query = prop.getProperty("deleteAccount");
		
		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < accNos.length; i++) {
				pstmt.setInt(1, accNos[i]);
				pstmt.addBatch();
			}
			result = pstmt.executeBatch();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int insertAccount(Connection con, Account ac, int user_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertAccount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ac.getAccountNo());
			pstmt.setString(2, ac.getBankName());
			pstmt.setInt(3,user_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int insertCategoryMajor(Connection con, PetCategory pc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertCategoryMajor");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pc.getCategoryName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);			
		}	
		return result;
	}

	public int insertFee(Connection con, int commission) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertFee");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, commission);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);			
		}	
		return result;
	}

	public int insertCateogoryMinor(Connection con, PetCategory pc) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertCategoryMinor");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pc.getCategoryName());
			pstmt.setInt(2, pc.getCategoryRefNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<PetCategory> selectPetCategory(Connection con, int current, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<PetCategory> plist = null;
		String query = prop.getProperty("selectPetCategory");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (current - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			plist = new ArrayList<PetCategory>();
			while(rs.next()){
				PetCategory pc = new PetCategory();
				pc.setPetCategory(rs.getInt("pet_category"));
				pc.setCategoryName(rs.getString("pet_categoryname"));
				pc.setCategoryLV(rs.getInt("pet_categorylv"));
				pc.setCategoryRefNo(rs.getInt("pet_categoryref"));
	
				plist.add(pc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
	
		return plist;
	}

	public int getListCount(Connection con) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("listCount");

		int listCount = 0;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			if (rs.next()) {
				listCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return listCount;
	}

	public int[] deleteCategory(Connection con, int[] accNos) {
		PreparedStatement pstmt = null;
		int[] result = null;
		String query = prop.getProperty("deleteCategory");
		
		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < accNos.length; i++) {
				pstmt.setInt(1, accNos[i]);
				pstmt.addBatch();
			}
			result = pstmt.executeBatch();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
