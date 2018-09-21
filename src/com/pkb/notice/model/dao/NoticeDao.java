package com.pkb.notice.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.pkb.common.JDBCTemplate.*;
import com.pkb.notice.model.vo.Notice;

public class NoticeDao {

	private Properties prop = new Properties();

	public NoticeDao() {
		String fileName = NoticeDao.class.getResource("/sql/notice/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertNotice(Connection con, Notice nt, int userNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int rs = 0;

		String query = prop.getProperty("insertNotice");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, nt.getArticle_title());
			pstmt.setString(3, nt.getArticle_contents());
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return rs;

	}

	public ArrayList<Notice> selectNoticeList(Connection con, int currentPage, int limit) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Notice> list = null;
		Notice nt = null;
		String query = prop.getProperty("selectList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();
			list = new ArrayList<Notice>();

			while (rs.next()) {
				nt = new Notice();

				nt.setArticle_no(rs.getInt("ARTICLE_NO"));
				nt.setUser_name(rs.getString("NICKNAME"));
				nt.setArticle_date(rs.getDate("ARTICLE_DATE"));
				nt.setArticle_title(rs.getString("ARTICLE_TITLE"));
				nt.setArticle_contents(rs.getString("ARTICLE_CONTENTS"));
				nt.setArticle_type(rs.getString("ARTICLE_TYPE"));
				nt.setArticle_lv(rs.getInt("ARTICLE_LV"));
				nt.setArticle_refno(rs.getInt("article_refno"));
				nt.setArticle_status(rs.getInt("article_status"));
				nt.setArticle_modify_date(rs.getDate("ARTICLE_MODIFY_DATE"));

				list.add(nt);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("listCount");

		int listCount = 0;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			if (rs.next()) {
				listCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return listCount;
	}

	public Notice selectOneNotice(Connection con, int nno) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Notice nt = null;
		String query = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				nt = new Notice();

				nt.setArticle_no(rs.getInt("ARTICLE_NO"));
				nt.setUser_name(rs.getString("NICKNAME"));
				nt.setArticle_date(rs.getDate("ARTICLE_DATE"));
				nt.setArticle_title(rs.getString("ARTICLE_TITLE"));
				nt.setArticle_contents(rs.getString("ARTICLE_CONTENTS"));
				nt.setArticle_type(rs.getString("ARTICLE_TYPE"));
				nt.setArticle_lv(rs.getInt("ARTICLE_LV"));
				nt.setArticle_refno(rs.getInt("article_refno"));
				nt.setArticle_status(rs.getInt("article_status"));
				nt.setArticle_modify_date(rs.getDate("ARTICLE_MODIFY_DATE"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return nt;
	}

	public int modifyNotice(Connection con, Notice nt) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("modifyNotice");

		try {
			System.out.println(nt);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, nt.getArticle_title());
			pstmt.setString(2, nt.getArticle_contents());
			pstmt.setInt(3, nt.getArticle_no());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int[] deleteNotices(Connection con, int[] deleteNnos) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int[] result = null;
		String query = prop.getProperty("deleteNotice");

		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < deleteNnos.length; i++) {
				pstmt.setInt(1, deleteNnos[i]);
				pstmt.addBatch();
				pstmt.addBatch();
			}
			result = pstmt.executeBatch();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteNoticeOne(Connection con, int deleteNno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteNotice");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, deleteNno);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int getSearchListCount(Connection con, String searchValue, String condition) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		if(searchValue.equals("title")){
			query = prop.getProperty("listSearchForTitleCount");
		} else if ( searchValue.equals("number")){
			query = prop.getProperty("listSearchForNnoCount");
		}
		int listCount = 0;

		try {
			pstmt = con.prepareStatement(query);
			if(searchValue.equals("title")){
				pstmt.setString(1, "%"+condition+"%");
			} else if ( searchValue.equals("number")){
				pstmt.setInt(1, Integer.parseInt(condition));
			}
			
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<Notice> selectSearchNoticeList(Connection con, int currentPage, int limit, String searchValue,
			String condition) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Notice> list = null;
		Notice nt = null;
		String query = null;
		if(searchValue.equals("title")){
			query = prop.getProperty("selectSearchListForTitle");
		} else if ( searchValue.equals("number")){
			query = prop.getProperty("selectSearchListForNno");
		}

		try {
			pstmt = con.prepareStatement(query);
			
			if(searchValue.equals("title")){
				pstmt.setString(1, "%"+condition+"%");
			} else if ( searchValue.equals("number")){
				pstmt.setInt(1, Integer.parseInt(condition));
			}
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rs = pstmt.executeQuery();
			list = new ArrayList<Notice>();

			while (rs.next()) {
				nt = new Notice();

				nt.setArticle_no(rs.getInt("ARTICLE_NO"));
				nt.setUser_name(rs.getString("user_name"));
				nt.setArticle_date(rs.getDate("ARTICLE_DATE"));
				nt.setArticle_title(rs.getString("ARTICLE_TITLE"));
				nt.setArticle_contents(rs.getString("ARTICLE_CONTENTS"));
				nt.setArticle_type(rs.getString("ARTICLE_TYPE"));
				nt.setArticle_lv(rs.getInt("ARTICLE_LV"));
				nt.setArticle_refno(rs.getInt("article_refno"));
				nt.setArticle_status(rs.getInt("article_status"));
				nt.setArticle_modify_date(rs.getDate("ARTICLE_MODIFY_DATE"));

				list.add(nt);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}

}
