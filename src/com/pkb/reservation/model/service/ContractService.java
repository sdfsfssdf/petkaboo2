package com.pkb.reservation.model.service;

import static com.pkb.common.JDBCTemplate.close;
import static com.pkb.common.JDBCTemplate.commit;
import static com.pkb.common.JDBCTemplate.getConnection;
import static com.pkb.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

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



	public HashMap<String, Object> selectreservationMainInfo(int i, int j) {
		Connection con = getConnection();
		
		HashMap<String,Object> totalMap = null;
		ArrayList<Integer> countList = new ContractDao().getCountReservationStatus(con);
		
		if(countList != null) {
			ArrayList<HashMap<String,Object>> totalList = new ContractDao().selectTotalList(con,i,j);
			if(totalList != null){
				totalMap = new HashMap<String,Object>();
				totalMap.put("list", totalList);
				totalMap.put("counts", countList);
			}
		}
		
		return totalMap;
	}



	public int getListCount() {
		Connection con = getConnection();
		ArrayList<Integer> countList = new ContractDao().getCountReservationStatus(con);
		close(con);
		return countList.get(0);
	}
}
