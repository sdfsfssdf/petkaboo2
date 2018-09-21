package com.pkb.petsitterService.model.service;

import static com.pkb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.pkb.petsitterService.model.dao.PetsitterServiceDao;
import com.pkb.petsitterService.model.dao.PetsitterServiceDetailDao;
import com.pkb.petsitterService.model.vo.PetsitterService;

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
		
		return p;
	}

}
