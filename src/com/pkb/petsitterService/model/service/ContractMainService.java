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
		
		close(con);
		
		return c;
	}

	public ArrayList<Contract> selectList(int parseInt) {
		Connection con = getConnection();
		
		ArrayList<Contract> cList = new ContractS2Dao().selectList(con, parseInt);
		
		close(con);
		
		return cList;
	}

	public int acceptReq(int contractno, int client_user_no, String acceptReq) {
		Connection con = getConnection();
		int result = 0;
		int result2 = 0;
		
		result = new ContractS2Dao().AcceptReq(con, contractno, client_user_no, acceptReq);
		
		if(result > 0){
			
			result2 = new ContractS2Dao().createService(con, contractno);
			
			if(result2 > 0){
				commit(con);
			}else{
				rollback(con);
			}
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
		
		close(con);
		
		return cMoney;
	}

	public int refuseReq(int contractno, int client_user_no, String acceptReq) {
		Connection con = getConnection();
		int result = 0;
		
		result = new ContractS2Dao().refuseReq(con, contractno, client_user_no, acceptReq);
		
		if(result > 0){
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int paymentProceed(int contractno, int user_no, int fullPrice) {
		Connection con = getConnection();
		int result = 0;
		int step1 = 0;
		int step2 = 0;
		int step3 = 0;
		int step4 = 0;
		int step5 = 0;
		
		step1 = new ContractS2Dao().insertPayment(con, contractno, user_no, fullPrice);
		
		if(step1 > 0){
			// 1단계 성공시
			step2 = new ContractS2Dao().insertPayhistory(con, contractno, user_no, fullPrice);			
			if(step2 > 0){
				// 2단계 성공시
				step3 = new ContractS2Dao().proceedCybermoney(con, contractno, user_no, fullPrice);
				if(step3 > 0){
					// 3단계 성공시
					step4 = new ContractS2Dao().insertContractmoney(con, contractno, user_no, fullPrice);
					if(step4 > 0){
						// 4단계 성공시
						step5 = new ContractS2Dao().updateService(con, contractno, user_no, fullPrice);
						if(step5 > 0){
							// 5단계 성공시 커밋
							commit(con);
							result = step1 + step2 + step3 + step4 + step5;
						}else{
							rollback(con);
						}
					}else{
						rollback(con);
					}
				}else{
					rollback(con);
				}
			}else{
				// 2단계 실패시
				rollback(con);
			}	
		}else{
			// 1단계 실패시
			rollback(con);
		}
		
		close(con);
			
		return result;
	}

	public int endContract(int user_no, int client_user_no, int psrno, int contractNo) {
		System.out.println("endContract 메인 서비스 개시");
		int step1 = 0;
		int step2 = 0;
		int step3 = 0;
		int result = 0;
		Connection con = getConnection();
		
		System.out.println("CM서비스에서 user_no는: " + user_no);
		System.out.println("CM서비스에서 client_user_no는: " + client_user_no);
		System.out.println("CM서비스에서 psrno는: " + psrno);
		System.out.println("CM서비스에서 contractNo는: " + contractNo);
		
		step1 = new ContractS2Dao().endContract(con, user_no, client_user_no, psrno, contractNo);
		System.out.println("step1은: " + step1);
		
		if(step1 > 0){
			// 계약 상태 변경이 성공하면 해당 계약의 사이버머니를 조회
			System.out.println("1단계 성공");
			step2 = new ContractS2Dao().refundStep1(con, contractNo, client_user_no);
			if(step2 > 0){
				// 얻어온 사이버 머니 만큼 펫시터의 테이블에 추가
				System.out.println("2단계 성공");
				System.out.println("계약 가격은?: " + step2);
				step3 = new ContractS2Dao().increaseMoney(con, user_no, step2);
				if(step3 > 0){
					System.out.println("3단계 성공");
					result = step1 + step2 + step3;
					commit(con);
				}else{
					rollback(con);
				}
			}else{
				rollback(con);
			}
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int refundProceed(int contractNo, int user_no) {
		Connection con = getConnection();
		int result = 0;
		int step1 = 0;
		int step2 = 0;
		int step3 = 0;
		int step4 = 0;
		int step5 = 0;
		
		step1 = new ContractS2Dao().refundStep1(con, contractNo, user_no);
		
		if(step1 > 0){
			// 1단계 성공시
			step2 = new ContractS2Dao().refundStep2(con, contractNo, user_no, step1);			
			if(step2 > 0){
				// 2단계 성공시
				step3 = new ContractS2Dao().insertPayhistory(con, contractNo, user_no, step1);
				if(step3 > 0){
					// 3단계 성공시
					step4 = new ContractS2Dao().insertContractmoney(con, contractNo, user_no, step1);
					if(step4 > 0){
						// 4단계 성공시
						step5 = new ContractS2Dao().updateRefundService(con, contractNo, user_no, step1);
						if(step5 > 0){
							// 5단계 성공시 커밋
							commit(con);
							result = step1 + step2 + step3 + step4 + step5;
						}else{
							rollback(con);
						}
					}else{
						rollback(con);
					}
				}else{
					rollback(con);
				}
			}else{
				// 2단계 실패시
				rollback(con);
			}	
		}else{
			// 1단계 실패시
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
