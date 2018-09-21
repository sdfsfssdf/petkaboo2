package com.pkb.member.model.dao;

import static com.pkb.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.pkb.member.model.vo.File;
import com.pkb.member.model.vo.User;

public class UserDAO {

	private Properties prop = new Properties();
	
	public UserDAO(){
		String fileName = UserDAO.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public User loginCheck(Connection con, String email, String user_pwd){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		User loginUser = null;
		
		String query = prop.getProperty("loginUser");
		try{
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, user_pwd);
			rset=pstmt.executeQuery();
			if(rset.next()){
				loginUser = new User();
				loginUser.setUser_no(rset.getInt("user_no"));
				loginUser.setEmail(rset.getString("email"));
				loginUser.setUser_pwd(rset.getString("user_pwd"));
				loginUser.setUser_type(rset.getInt("user_type"));
				loginUser.setUser_name(rset.getString("user_name"));
				loginUser.setPhone(rset.getString("phone"));
				loginUser.setBirthday(rset.getDate("birthday"));
				loginUser.setGender(rset.getString("gender"));
				loginUser.setAddress(rset.getString("address"));
				loginUser.setSms_chk(rset.getString("sms_chk"));
				loginUser.setEmail_chk(rset.getString("email_chk"));
				loginUser.setEnrollDate(rset.getDate("enrolldate"));
				loginUser.setNickname(rset.getString("nickname"));
				loginUser.setUser_grade(rset.getInt("user_grade"));
				loginUser.setPet_auth(rset.getString("pet_auth"));
				loginUser.setUser_status(rset.getInt("user_status"));
				loginUser.setFile_no(rset.getInt("file_no"));
				loginUser.setEmail_hash(rset.getString("email_hash"));
				loginUser.setArticle_no(rset.getInt("article_no"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return loginUser;
	}

	public int joinUser(Connection con, User u) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("joinUser");
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, u.getEmail());
			pstmt.setString(2, u.getUser_pwd());
			pstmt.setString(3, u.getEmail_hash());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public int mailAuth(Connection con, String email) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("setAuth");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public int chageAdd(Connection con, User loginUser) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = prop.getProperty("changeAdd");
		System.out.println("change" + loginUser.getAddress());
		System.out.println("email" + loginUser.getEmail());
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, loginUser.getAddress());
			pstmt.setString(2, loginUser.getEmail());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public int checkId(Connection con, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		String query = prop.getProperty("checkEmail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			rset= pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		return result;
	}

	public int checkPwd(Connection con, String currentPwd, String email) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		String query = prop.getProperty("checkPwd");
		
		System.out.println("DAO"+email);
		System.out.println(currentPwd);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, currentPwd);
			pstmt.setString(2, email);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public int changePwd(Connection con, String newPwd, String email) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changePwd");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, email);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public int changeNickname(Connection con, String nickname, String email) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("changeNickname");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, nickname);
			pstmt.setString(2, email);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public int insertIdentify(Connection con, File f) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertIdentify");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, f.getFile_name());
			pstmt.setInt(2, f.getUser_no());
			pstmt.setString(3, f.getFile_path());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public int insertProfile(Connection con, File f) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertProfile");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, f.getFile_name());
			pstmt.setInt(2, f.getUser_no());
			pstmt.setString(3, f.getFile_path());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}
	public ArrayList<User> getPetsitterInfo(User loginUser, Connection con) {
		PreparedStatement pstmt = null;
		ArrayList<User> list = null;
		String query = prop.getProperty("petsitterInfo");
		
		try {
			pstmt=con.prepareStatement(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public int insertLicense(Connection con, File f) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertLicense");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, f.getFile_name());
			pstmt.setInt(2, f.getUser_no());
			pstmt.setString(3, f.getFile_path());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public int getListCount(Connection con) {
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

	public ArrayList<User> selectMemberList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<User> mlist = null;
		String query = prop.getProperty("selectMemberList");
		
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			mlist = new ArrayList<User>();
			while(rs.next()){
				User u = new User();
				u.setUser_no(rs.getInt("user_no"));
				u.setEmail(rs.getString("email"));
				u.setUser_pwd(rs.getString("user_pwd"));
				u.setUser_type(rs.getInt("user_type"));
				u.setUser_name(rs.getString("user_name"));
				u.setPhone(rs.getString("phone"));
				u.setBirthday(rs.getDate("birthday"));
				u.setGender(rs.getString("gender"));
				u.setAddress(rs.getString("address"));
				u.setSms_chk(rs.getString("sms_chk"));
				u.setEmail_chk(rs.getString("email_chk"));
				u.setEnrollDate(rs.getDate("enrolldate"));
				u.setNickname(rs.getString("nickname"));
				u.setUser_grade(rs.getInt("user_grade"));
				u.setPet_auth(rs.getString("pet_auth"));
				u.setUser_status(rs.getInt("user_status"));
				u.setFile_no(rs.getInt("file_no"));
				u.setEmail_hash(rs.getString("email_hash"));
				u.setArticle_no(rs.getInt("article_no"));
				
				mlist.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return mlist;
	}

	public User selectMemberOne(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User u = null;
		String query = prop.getProperty("selectMemberOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				u = new User();
				
				u.setUser_no(rs.getInt("user_no"));
				u.setEmail(rs.getString("email"));
				u.setUser_pwd(rs.getString("user_pwd"));
				u.setUser_type(rs.getInt("user_type"));
				u.setUser_name(rs.getString("user_name"));
				u.setPhone(rs.getString("phone"));
				u.setBirthday(rs.getDate("birthday"));
				u.setGender(rs.getString("gender"));
				u.setAddress(rs.getString("address"));
				u.setSms_chk(rs.getString("sms_chk"));
				u.setEmail_chk(rs.getString("email_chk"));
				u.setEnrollDate(rs.getDate("enrolldate"));
				u.setNickname(rs.getString("nickname"));
				u.setUser_grade(rs.getInt("user_grade"));
				u.setPet_auth(rs.getString("pet_auth"));
				u.setUser_status(rs.getInt("user_status"));
				u.setFile_no(rs.getInt("file_no"));
				u.setEmail_hash(rs.getString("email_hash"));
				u.setArticle_no(rs.getInt("article_no"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return u;
	}
}
