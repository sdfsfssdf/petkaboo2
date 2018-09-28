package com.pkb.pet.model.service;

import static com.pkb.common.JDBCTemplate.*;

import java.sql.Connection;

import com.pkb.pet.model.dao.PetDao;
import com.pkb.pet.model.vo.Pet;

public class PetService {

	public int insertPetInfo(Pet p) {
		Connection con = getConnection();
		
		int result = new PetDao().insertPetInfo(con, p);
		
		if(result > 0){
			
			Pet p = new PetDao().selectPetInfo(con);
			
			commit(con);
		}else{
			rollback(con);
			
		}
		
		return  result;
	}

	public Pet selectPetInfo(Pet p) {
		Connection con = getConnection();
		
		Pet p2 = new PetDao().selectPetInfo(con, p);
		
		if(p2 != null){
			commit(con);
			
		}else{
			rollback(con);
		}
		
		
		return p2;
	}

}
