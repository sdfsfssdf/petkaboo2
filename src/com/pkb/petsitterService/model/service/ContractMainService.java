package com.pkb.petsitterService.model.service;

import static com.pkb.common.JDBCTemplate.commit;
import static com.pkb.common.JDBCTemplate.rollback;
import static com.pkb.common.JDBCTemplate.close;
import static com.pkb.common.JDBCTemplate.getConnection;

import java.sql.Connection;

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

}
