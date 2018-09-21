package com.pkb.member.model.service;

import static com.pkb.common.JDBCTemplate.*;

import java.sql.Connection;

import com.pkb.member.model.dao.UserDAO;
import com.pkb.member.model.vo.User;

public class FileService {

	public int insertIdentify(com.pkb.member.model.vo.File f) {
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

	public int InsertProfile(com.pkb.member.model.vo.File f, String nickname, String email) {
		Connection con = getConnection();
		
		int profileResult = new UserDAO().insertProfile(con, f);
		
		int changeNickResult = new UserDAO().changeNickname(con, nickname, email);
		
		int totalresult = 0;
		if(profileResult != 0){
			totalresult = new UserDAO().insertProfile(con, f);
		} else {
			if()
			 totalresult = new UserDAO().changeNickname(con, nickname, email);
		}

	
		if(profileResult > 0){
			commit(con);
			profileResult = 2;
		}else{
			rollback(con);
		}
		if(changeNickResult > 0){
			commit(con);
			changeNickResult = 3;
		}else{
			rollback(con);
		}
		
		close(con);
		return profileResult+changeNickResult;
	}

	public int insertLicense(com.pkb.member.model.vo.File f) {
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
