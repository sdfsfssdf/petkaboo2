package com.pkb.notice.model.service;

import static com.pkb.common.JDBCTemplate.close;
import static com.pkb.common.JDBCTemplate.commit;
import static com.pkb.common.JDBCTemplate.getConnection;
import static com.pkb.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.pkb.notice.model.dao.NoticeDao;
import com.pkb.notice.model.vo.Notice;

public class NoticeService {

	public int insertNotice(Notice nt, int userNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		int result = new NoticeDao().insertNotice(con, nt, userNo);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public ArrayList<Notice> selectNoticeList(int currentPage, int limit) {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		ArrayList<Notice> list = new NoticeDao().selectNoticeList(con, currentPage, limit);

		close(con);

		return list;
	}

	public int getListCount() {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		int result = new NoticeDao().getListCount(con);

		close(con);

		return result;
	}

	public Notice selectOneNotice(int nno) {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		Notice nt = new NoticeDao().selectOneNotice(con, nno);

		close(con);

		return nt;
	}

	public int modifyNotice(Notice nt) {
		Connection con = getConnection();

		int result = new NoticeDao().modifyNotice(con, nt);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int[] deleteNotices(int[] deleteNnos) {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		int[] result = new NoticeDao().deleteNotices(con, deleteNnos);

		if (result.length > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int deleteNoticeOne(int deleteNno) {
		Connection con = getConnection();

		int result = new NoticeDao().deleteNoticeOne(con, deleteNno);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int getSearchListCount(String searchValue, String condition) {
		Connection con = getConnection();

		int result = new NoticeDao().getSearchListCount(con,searchValue,condition);

		close(con);

		return result;
	}

	public ArrayList<Notice> selectSearchNoticeList(int currentPage, int limit, String searchValue, String condition) {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		ArrayList<Notice> list = new NoticeDao().selectSearchNoticeList(con, currentPage, limit,searchValue,condition);

		close(con);

		return list;
	}

}
