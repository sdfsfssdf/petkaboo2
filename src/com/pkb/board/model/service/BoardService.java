package com.pkb.board.model.service;

import static com.pkb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import com.pkb.board.model.dao.BoardDao;
import com.pkb.board.model.vo.Board;

public class BoardService {

	//1:1문의 등록 메소드
	public int insertOnebyOneQna(Board b) {
	
		Connection con = getConnection();
		
		int result = new BoardDao().insertOnebyOneQna(con, b);
		
		if(result > 0){
			commit(con);
			
		}else{
			rollback(con);
			
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Board> selectOnebyOneList(int currentPage, int limit, int user_no) {
		
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectOnebyOneList(con, currentPage, limit, user_no);
		
		close(con);
		
		return list;
	}

	public int getOnebyOneListCount() {
		Connection con = getConnection();
		
		int oneByOneListCount = new BoardDao().getOnebyOneListCount(con);
		
		close(con);
		
		return oneByOneListCount;
	}

	public Board selectOneOnebyOne(int num) {
		Connection con = getConnection();
	
	
		Board b = new BoardDao().selectOneOnebyOne(con, num);
		
		close(con);
		
		return b;
	}

	public int modifyOnebyOne(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().modifyOnebyOne(con, b);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	
}
