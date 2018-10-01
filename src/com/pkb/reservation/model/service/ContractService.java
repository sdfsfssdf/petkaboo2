package com.pkb.reservation.model.service;

import static com.pkb.common.JDBCTemplate.close;
import static com.pkb.common.JDBCTemplate.commit;
import static com.pkb.common.JDBCTemplate.getConnection;
import static com.pkb.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.pkb.reservation.model.dao.ContractDao;
import com.pkb.reservation.model.vo.Contract;


public class ContractService {

	
	
	public int insertContractPetsitting(Contract c) {
		Connection con = getConnection();
		
		int result = new ContractDao().insertContractPetsitting(con, c);
		
		if(result > 0){
			
			commit(con);
			
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}



	public Contract searchContractPetsitting(int user_no, int servno) {
		Connection con = getConnection();
		
		
		Contract c = null;
		
		c = new ContractDao().searchContractPetsitting(con, user_no, servno);
		
		close(con);
		return c;
	}



}
