package com.pkb.member.model.service;

import static com.pkb.common.JDBCTemplate.close;
import static com.pkb.common.JDBCTemplate.commit;
import static com.pkb.common.JDBCTemplate.getConnection;
import static com.pkb.common.JDBCTemplate.rollback;

import com.pkb.member.model.vo.ImgFile;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.pkb.commiAndAccount.model.vo.CommissionAndAccountList;
import com.pkb.member.model.dao.UserDAO;
import com.pkb.member.model.vo.User;
import com.pkb.member.util.SHA256;


public class UserService {

	public User loginCheck(String email, String user_pwd) {
		Connection con = getConnection();
		
		User loginUser = new UserDAO().loginCheck(con, email, user_pwd);
		
		if(loginUser != null){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return loginUser;
	}

	public int joinUser(User u) {
		Connection con = getConnection();
		
		int result = new UserDAO().joinUser(con, u);
		
		System.out.println();
		if(result>0){
			commit(con);
			
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}
	

	public int mailAuth(String email, String code) {
		Connection con = getConnection();
		int result = 0;
		
		if(SHA256.getSHA256(email).equals(code)){
			result = new UserDAO().mailAuth(con, email);
		}else{
			result = 0;
		}
		
		if(result>0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public int changeAdd(User loginUser, String address) {
		Connection con = getConnection();
		
		int result = new UserDAO().chageAdd(con, loginUser, address);
		
		if(result>0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public int checkId(String email) {
		Connection con = getConnection();
		
		int result = new UserDAO().checkId(con, email);
		
		close(con);
	
		return result;
	}

	public int checkPwd(String currentPwd, String email) {
		Connection con = getConnection();
		
		int result = new UserDAO().checkPwd(con, currentPwd, email);
		
		close(con);
		
		return result;
	}

	public int changePwd(String newPwd, String email) {
		Connection con = getConnection();
		
		int result = new UserDAO().changePwd(con, newPwd, email);
		
		if(result>0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<User> getPetsitterInfo(User loginUser) {
		Connection con = getConnection();
		
		ArrayList<User> list = new UserDAO().getPetsitterInfo(loginUser, con);
		
		close(con);
		return list;
	
	}

	public int getListCount() {
		Connection con = getConnection();

		int result = new UserDAO().getListCount(con);

		close(con);

		return result;
	}

	public ArrayList<User> selectMemberList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<User> mlist = new UserDAO().selectMemberList(con, currentPage, limit);
		
		close(con);

		return mlist;
	}


	public ArrayList<ImgFile> selectlist(User u) {
		Connection con = getConnection();
		ArrayList<ImgFile> list = null;
		
		list = new UserDAO().selectList(con, u);
		
		close(con);
		
		return list;
	}}
