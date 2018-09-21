package com.pkb.member.model.service;

import static com.pkb.common.JDBCTemplate.*;

import java.sql.Connection;

import com.pkb.member.model.dao.UserDAO;
import com.pkb.member.model.vo.ImgFile;
import com.pkb.member.model.vo.User;

public class FileService {

	public int insertIdentify(ImgFile f) {
		Connection con = getConnection();
		
		int result = new UserDAO().insertIdentify(con, f);
		
		if(result>0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int InsertProfile(ImgFile f, User u) {
		Connection con = getConnection();
		
		int result1 = 0;
		int result2 = 0;
		
		result1 = new UserDAO().insertProfile(con, f);
		result2 = new UserDAO().changeNickname(con, u);
		
		if(result1+result2>0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result1+result2;
	}
	
	public int InsertProfile(User u) {
		Connection con = getConnection();
		
		int result = 0;
		result = new UserDAO().changeNickname(con, u);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}
	
	public int InsertProfile(ImgFile f){
		Connection con = getConnection();
		
		int result = 0;
		
		result = new UserDAO().insertProfile(con, f);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	
	public int insertLicense(ImgFile f) {
		Connection con = getConnection();
		
		int licenseResult = new UserDAO().insertLicense(con, f);
		
		if(licenseResult > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return licenseResult;
	}

	
	
}
