package com.pkb.reservation.model.service;

import static com.pkb.common.JDBCTemplate.*;

import java.sql.Connection;

import com.pkb.reservation.model.dao.ContractDao;
import com.pkb.reservation.model.vo.Contract;


public class ContractService {

	
	
	public int insertContractPetsitting(Contract c) {
		Connection con = getConnection();
		
		int result = new ContractDao().insertContractPetsitting(con, c);
		
		if(result > 0){
			Contract c2 = new ContractDao().selectContractPetsitting(con, c);
			if(c2 != null){
				
				commit(con);
			} else {
				rollback(con);
				result = 0;
			}
			
		}else{
			rollback(con);
			
		}
		
		return result;
	}



	public Contract selectContractPetsitting(Contract c) {
		Connection con = getConnection();
		
		Contract c2 = new ContractDao().selectContractPetsitting(con, c);
		
		close(con);
		
		return c2 ;
	}

}
