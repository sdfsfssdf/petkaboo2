package com.pkb.petsitterService.model.service;

import static com.pkb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.pkb.petsitterService.model.dao.PetsitterApplyDao;
import com.pkb.petsitterService.model.dao.PetsitterContractDao;
import com.pkb.petsitterService.model.dao.PetsitterDiaryDao;
import com.pkb.petsitterService.model.dao.PetsitterServiceDao;
import com.pkb.petsitterService.model.dao.PetsitterServiceDetailDao;
import com.pkb.petsitterService.model.vo.PetsitterDiary;
import com.pkb.petsitterService.model.vo.PetsitterService;
import com.pkb.reservation.model.vo.Contract;

public class PetsitterMainService {

	// 서블릿에서 받아온 펫시터 서비스 기본 등록 데이터를 처리
	public int insertPetsitterService(PetsitterService ps) {
		Connection con = getConnection();
		int result = 0;
		
		int psResult1 = new PetsitterServiceDao().insertPetsitterService(con, ps);
		
		if(psResult1 > 0){
			// 펫시터 기본 서비스 데이터 삽입 성공시 상세 서비스 데이터 삽입
			int psResult2 = new PetsitterServiceDetailDao().insertPetsitterServiceDetail(con, ps);
			
			if(psResult2 > 0){
				// 펫시터 상세 서비스 데이터 삽입 성공시
				commit(con);
				result = psResult1 + psResult2;
			}else{
				// 아니라면
				rollback(con);
			}
			
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new PetsitterServiceDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<PetsitterService> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<PetsitterService> list = new PetsitterServiceDao().selectList(con, currentPage, limit);
		
		close(con);
		
		// 반드시 수정
		return list;
	}

	public PetsitterService selectOne(int psrno) {
		Connection con = getConnection();
		PetsitterService p = null;
		
		p = new PetsitterServiceDao().selectOne(con, psrno);
		
		close(con);
		
		return p;
	}

	public ArrayList<PetsitterService> searchList(String searchKeyword, String gender, String arrayCondition) {
		Connection con = getConnection();
		
		ArrayList<PetsitterService> list = new PetsitterServiceDao().searchList(con, searchKeyword, gender, arrayCondition);
		
		close(con);
		
		return list;
	}

	public ArrayList<PetsitterService> searchList(String user_no) {
		Connection con = getConnection();
		
		ArrayList<PetsitterService> list = new PetsitterServiceDao().searchList(con, user_no);
		
		close(con);
		
		return list;
	}

	public int updatePetsitterService(PetsitterService ps) {
		Connection con = getConnection();
		int result = 0;
		
		int psResult1 = new PetsitterServiceDao().updatePetsitterService(con, ps);
		
		if(psResult1 > 0){
			// 펫시터 기본 서비스 데이터 삽입 성공시 상세 서비스 데이터 삽입
			int psResult2 = new PetsitterServiceDetailDao().updatePetsitterServiceDetail(con, ps);
			
			if(psResult2 > 0){
				// 펫시터 상세 서비스 데이터 삽입 성공시
				commit(con);
				result = psResult1 + psResult2;
			}else{
				// 아니라면
				rollback(con);
			}
			
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<PetsitterDiary> searchDiary(String user_no, String email) {
		Connection con = getConnection();
		
		ArrayList<PetsitterDiary> myList = new PetsitterDiaryDao().searchDiary(con, user_no, email);
		
		close(con);
		
		// 반드시 수정
		return myList;
	}

	public Contract selectOneContract(int psrno, int petsitterno) {
		Connection con = getConnection();
		
		Contract c = new PetsitterContractDao().selectOne(con, psrno, petsitterno);
		
		close(con);
		
		return c;
	}

	public int applyPetsitter(int user_no) {
		Connection con = getConnection();
		int result = 0;
		int step1 = 0;
		int step2 = 0;
		
		step1 = new PetsitterApplyDao().insertOne(con, user_no);
		
		if(step1 > 0){
			// 1단계 성공
			step2 = new PetsitterApplyDao().insertHistory(con, user_no);
			if(step2 > 0){
				commit(con);
				result = step1 + step2;
			}else{
				rollback(con);
			}
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
}
