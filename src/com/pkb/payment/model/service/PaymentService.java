package com.pkb.payment.model.service;

import com.pkb.payment.model.dao.PaymentDao;
import com.pkb.payment.model.vo.Payment;

import java.sql.Connection;

import static com.pkb.common.JDBCTemplate.*;

public class PaymentService {

	public int insertRecharge(Payment py, int user_no) {
		Connection con = getConnection();
		
		int result = new PaymentDao().insertRecharge(con, py);
		
		int result2 = 0;
		int result3 = 0;
		if(result > 0){ //결제 테이블 insert한 결과가 1일시
			result2 = new PaymentDao().insertPayHistory(con, user_no); 
			
			if(result2 > 0){
				//사이버머니 이력 테이블에 insert한 결과가 1일시
				commit(con);
				
			}else{
				rollback(con);
			}
			
		}else{
			rollback(con);
		}
		close(con);
		
		return result2;
	}

}
