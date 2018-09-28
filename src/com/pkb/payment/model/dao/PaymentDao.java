package com.pkb.payment.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import static com.pkb.common.JDBCTemplate.*;
import com.pkb.notice.model.dao.NoticeDao;
import com.pkb.notice.model.vo.Notice;
import com.pkb.payment.model.vo.PayHistory;
import com.pkb.payment.model.vo.Payment;

public class PaymentDao {

	private Properties prop = new Properties();

	public PaymentDao() {
		String fileName = PaymentDao.class.getResource("/sql/notice/payment-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<PayHistory> selectTodayPaymentHistoryList(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		PayHistory ph = null;
		ArrayList<PayHistory> phlist = null;
		String query = prop.getProperty("selectTodayPaymentHistoryList");

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			phlist = new ArrayList<PayHistory>();
			while (rs.next()) {
				ph = new PayHistory();
				ph.setPay_no(rs.getInt("pay_no"));
				ph.setPay_recordno(rs.getInt("pay_recordno"));
				ph.setUser_no(rs.getInt("user_no"));

				phlist.add(ph);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return phlist;
	}

	public ArrayList<HashMap<String, Object>> selectTotalList(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("getListCount");
		int count = 0;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return count;
	}

	public ArrayList<Payment> selectTotalList(Connection con, int currPage, int limit) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Payment> plist = null;
		Payment p = null;
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
}
