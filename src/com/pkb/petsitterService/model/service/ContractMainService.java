package com.pkb.petsitterService.model.service;

import static com.pkb.common.JDBCTemplate.commit;
import static com.pkb.common.JDBCTemplate.rollback;
import static com.pkb.common.JDBCTemplate.close;
import static com.pkb.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.pkb.member.model.vo.CyberMoney;
import com.pkb.petsitterService.model.dao.ContractS2Dao;
import com.pkb.reservation.model.vo.Contract;

public class ContractMainService {

	public int insertContract(Contract c) {
		Connection con = getConnection();
		int result = 0;
		
		result = new ContractS2Dao().insertContract(con, c);
		
		if(result > 0){
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Contract selectOne(int parseInt, int parseInt2) {
		Connection con = getConnection();
		Contract c = null;
		
		c = new ContractS2Dao().selectOne(con, parseInt, parseInt2);
		
		return c;
	}

	public ArrayList<Contract> selectList(int parseInt) {
		Connection con = getConnection();
		
		ArrayList<Contract> cList = new ContractS2Dao().selectList(con, parseInt);
		
		close(con);
		
		return cList;
	}

	public int acceptReq(int contractno, int client_user_no) {
		Connection con = getConnection();
		int result = 0;
		
		result = new ContractS2Dao().AcceptReq(con, contractno, client_user_no);
		
		if(result > 0){
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Contract> selectMyList(int user_no) {
		Connection con = getConnection();
		
		ArrayList<Contract> cList = new ContractS2Dao().selectMyList(con, user_no);
		
		close(con);
		
		return cList;
	}

	public CyberMoney checkCMoney(int user_no) {
		Connection con = getConnection();
		CyberMoney cMoney = null;
		
		cMoney = new ContractS2Dao().checkCMoney(con, user_no);
		
		return cMoney;
	}

}
