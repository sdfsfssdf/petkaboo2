package com.pkb.member.model.dao;

import static com.pkb.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.pkb.board.model.vo.Board;
import com.pkb.member.model.vo.CyberMoney;
import com.pkb.member.model.vo.ImgFile;
import com.pkb.member.model.vo.LoginHistory;
import com.pkb.member.model.vo.Pet;
import com.pkb.member.model.vo.User;
import com.pkb.reservation.model.vo.Reservation;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.sun.xml.internal.ws.api.message.Packet.Status;

public class UserDAO {

	private Properties prop = new Properties();

	public UserDAO() {
		String fileName = UserDAO.class.getResource("/sql/member/member-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public User loginCheck(Connection con, String email, String user_pwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		User loginUser = null;

		String query = prop.getProperty("loginUser");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, user_pwd);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				loginUser = new User();
				loginUser.setUser_no(rset.getInt("user_no"));
				loginUser.setEmail(rset.getString("email"));
				loginUser.setUser_pwd(rset.getString("user_pwd"));
				loginUser.setUser_type(rset.getInt("user_type"));
				loginUser.setUser_name(rset.getString("user_name"));
				loginUser.setPhone(rset.getString("phone"));
				loginUser.setBirthday(rset.getDate("birthday"));
				loginUser.setGender(rset.getString("gender"));
				loginUser.setAddress(rset.getString("address"));
				loginUser.setSms_chk(rset.getString("sms_chk"));
				loginUser.setEmail_chk(rset.getString("email_chk"));
				loginUser.setEnrollDate(rset.getDate("enrolldate"));
				loginUser.setNickname(rset.getString("nickname"));
				loginUser.setUser_grade(rset.getInt("user_grade"));
				loginUser.setPet_auth(rset.getString("pet_auth"));
				loginUser.setUser_status(rset.getInt("user_status"));
				loginUser.setFile_no(rset.getInt("file_no"));
				loginUser.setEmail_hash(rset.getString("email_hash"));
				loginUser.setArticle_no(rset.getInt("article_no"));
				loginUser.setMoney(rset.getInt("money"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return loginUser;
	}

	public int joinUser(Connection con, User u) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("joinUser");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, u.getEmail());
			pstmt.setString(2, u.getUser_pwd());
			pstmt.setString(3, u.getEmail_hash());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int mailAuth(Connection con, String email) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("setAuth");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int chageAdd(Connection con, User loginUser, String address) {
		PreparedStatement pstmt = null;

		int result = 0;
		String query = prop.getProperty("changeAdd");
		System.out.println("change" + address);
		System.out.println("email" + loginUser.getEmail());
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, address);
			pstmt.setString(2, loginUser.getEmail());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int checkId(Connection con, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int result = 0;
		String query = prop.getProperty("checkEmail");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return result;
	}

	public int checkPwd(Connection con, String currentPwd, String email) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("checkPwd");

		System.out.println("DAO" + email);
		System.out.println(currentPwd);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, currentPwd);
			pstmt.setString(2, email);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int changePwd(Connection con, String newPwd, String email) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("changePwd");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, email);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int changeNickname(Connection con, User u) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("changeNickname");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, u.getNickname());
			pstmt.setString(2, u.getEmail());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertIdentify(Connection con, ImgFile f) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertIdentify");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, f.getFile_name());
			pstmt.setInt(2, f.getUser_no());
			pstmt.setString(3, f.getFile_path());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertProfile(Connection con, ImgFile f) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertProfile");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, f.getFile_name());
			pstmt.setInt(2, f.getUser_no());
			pstmt.setString(3, f.getFile_path());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Reservation> getReservation(User loginUser, Connection con) {
		PreparedStatement pstmt = null;
		ArrayList<Reservation> rsvList = null;
		ResultSet rs = null;
		String query = prop.getProperty("reservationList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginUser.getUser_no());
			rs = pstmt.executeQuery();

			rsvList = new ArrayList<Reservation>();
			while (rs.next()) {
				Reservation r = new Reservation();
				r.setContract_start(rs.getDate("contract_start"));
				r.setContract_end(rs.getDate("contract_end"));
				r.setPet_name(rs.getString("pet_name"));
				r.setContract_no(rs.getInt("contract_no"));
				r.setUser_name(rs.getString("user_name"));
				r.setAddress(rs.getString("address"));

				rsvList.add(r);
			}

			// PET_NAME, ADDRESS, CONTRACT_START, CONTRACT_END, CONTRACT_NO,
			// USER_NAME

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rsvList;
	}

	public int insertLicense(Connection con, ImgFile f) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertLicense");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, f.getFile_name());
			pstmt.setInt(2, f.getUser_no());
			pstmt.setString(3, f.getFile_path());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
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

	public ArrayList<User> selectMemberList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<User> mlist = null;
		String query = prop.getProperty("selectMemberList");

		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			mlist = new ArrayList<User>();
			while (rs.next()) {
				User u = new User();
				u.setUser_no(rs.getInt("user_no"));
				u.setEmail(rs.getString("email"));
				u.setUser_pwd(rs.getString("user_pwd"));
				u.setUser_type(rs.getInt("user_type"));
				u.setUser_name(rs.getString("user_name"));
				u.setPhone(rs.getString("phone"));
				u.setBirthday(rs.getDate("birthday"));
				u.setGender(rs.getString("gender"));
				u.setAddress(rs.getString("address"));
				u.setSms_chk(rs.getString("sms_chk"));
				u.setEmail_chk(rs.getString("email_chk"));
				u.setEnrollDate(rs.getDate("enrolldate"));
				u.setNickname(rs.getString("nickname"));
				u.setUser_grade(rs.getInt("user_grade"));
				u.setPet_auth(rs.getString("pet_auth"));
				u.setUser_status(rs.getInt("user_status"));
				u.setFile_no(rs.getInt("file_no"));
				u.setEmail_hash(rs.getString("email_hash"));
				u.setArticle_no(rs.getInt("article_no"));

				mlist.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return mlist;
	}

	public ArrayList<ImgFile> selectList(Connection con, User u) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ImgFile> list = null;

		System.out.println("uno들오옴" + u.getUser_no());
		String query = prop.getProperty("selectList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, u.getUser_no());
			rset = pstmt.executeQuery();
			list = new ArrayList<ImgFile>();

			if (rset.next()) {
				ImgFile f = new ImgFile();
				f.setFile_name(rset.getString("file_name"));
				list.add(f);
				System.out.println("list 들어옴/" + list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}

	public int[] deleteMember(Connection con, String[] selectUserNos) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int[] result = null;
		String query = prop.getProperty("deleteMember");

		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < selectUserNos.length; i++) {
				String[] tempUserNo = selectUserNos[i].split("/");
				pstmt.setInt(1, Integer.parseInt(tempUserNo[0]));
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

	public HashMap<String, Object> selectMemberOne(Connection con, int userNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HashMap<String, Object> hmap = null;
		User u = null;
		LoginHistory lh = null;
		CyberMoney cm = null;
		String query = prop.getProperty("selectMemberOne");

		try {

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rs = pstmt.executeQuery();
			hmap = new HashMap<String, Object>();
			if (rs.next()) {
				u = new User();
				lh = new LoginHistory();
				cm = new CyberMoney();
				u.setUser_no(rs.getInt("user_no"));
				u.setEmail(rs.getString("email"));
				u.setUser_pwd(rs.getString("user_pwd"));
				u.setUser_type(rs.getInt("user_type"));
				u.setUser_name(rs.getString("user_name"));
				u.setPhone(rs.getString("phone"));
				u.setBirthday(rs.getDate("birthday"));
				u.setGender(rs.getString("gender"));
				u.setAddress(rs.getString("address"));
				u.setSms_chk(rs.getString("sms_chk"));
				u.setEmail_chk(rs.getString("email_chk"));
				u.setEnrollDate(rs.getDate("enrolldate"));
				u.setNickname(rs.getString("nickname"));
				u.setUser_grade(rs.getInt("user_grade"));
				u.setPet_auth(rs.getString("pet_auth"));
				u.setUser_status(rs.getInt("user_status"));
				u.setFile_no(rs.getInt("file_no"));
				u.setEmail_hash(rs.getString("email_hash"));
				u.setArticle_no(rs.getInt("article_no"));
				lh.setUserNo(userNo);
				lh.setLoginDate(rs.getDate("login_date"));
				lh.setLoginIp(rs.getString("login_ip"));
				lh.setLocation(rs.getString("location"));
				cm.setUserNo(userNo);
				cm.setCyberMoneyNo(rs.getInt("MONEY_NO"));
				cm.setMoney(rs.getInt("money"));

				hmap.put("user", u);
				hmap.put("loginHistory", lh);
				hmap.put("money", cm);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return hmap;

	}

	public int[] lockMember(Connection con, String[] selectUserNos) {

		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result[] = null;
		String query = prop.getProperty("lockMember");

		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < selectUserNos.length; i++) {
				String[] tempUserNo = selectUserNos[i].split("/");
				pstmt.setInt(1, Integer.parseInt(tempUserNo[0]));
				pstmt.addBatch();
			}
			result = pstmt.executeBatch();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertSms(Connection con, String smsNumber, String email) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertSms");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, smsNumber);
			pstmt.setString(2, email);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updatePhone(Connection con, String phone, String sms, User loginUser) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updatePhone");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, phone);
			pstmt.setString(2, loginUser.getEmail());
			pstmt.setString(3, sms);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int authTBidentify(Connection con, ImgFile f) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("authTbidentify");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, f.getUser_no());
			System.out.println("출력되지" + f.getUser_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int authTBlicense(Connection con, ImgFile f) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("authTBlicense");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, f.getUser_no());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int authTBphone(Connection con, User loginUser) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("authTBphone");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginUser.getUser_no());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int[] writeLockReason(Connection con, String[] selectUserNos, int adminUserNo, String title, String content,
			String lockDate) {
		PreparedStatement pstmt = null;
		int result[] = null;
		String query = prop.getProperty("writeLockReason");
		String[] tempDate = lockDate.split("-");
		java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy/MM/dd");

		java.util.Date date = null;
		try {
			date = format.parse(tempDate[0] + "/" + tempDate[1] + "/" + tempDate[2]);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		java.sql.Date date2 = new java.sql.Date(date.getTime());

		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < selectUserNos.length; i++) {
				pstmt.setInt(1, adminUserNo);
				pstmt.setString(2, "(" + selectUserNos[i] + ")" + title);
				pstmt.setString(3, content);
				pstmt.setDate(4, date2);
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

	public int[] writeDeleteReason(Connection con, String[] selectUserNos, int adminUserNo, String title,
			String content) {
		PreparedStatement pstmt = null;
		int result[] = null;
		String query = prop.getProperty("writeDeleteReason");

		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < selectUserNos.length; i++) {
				pstmt.setInt(1, adminUserNo);
				pstmt.setString(2, "(" + selectUserNos[i] + ")" + title);
				pstmt.setString(3, content);
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

	public int getListCountUserId(Connection con, String value) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("listCountUserId");

		int listCount = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + value + "%");
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

	public int getListCountUserStatus(Connection con, String value) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("listCountUserStatus");

		int listCount = 0;

		try {
			pstmt = con.prepareStatement(query);
			if (value.equals("dia")) {
				pstmt.setInt(1, 0);
			} else if (value.equals("nomal")) {
				pstmt.setInt(1, 1);
			} else if (value.equals("leave")) {
				pstmt.setInt(1, 2);
			} else {
				pstmt.setInt(1, 4);
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

	public int getListCountUserGrade(Connection con, String value) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("listCountUserGrade");

		int listCount = 0;

		try {
			pstmt = con.prepareStatement(query);
			if (value.equals("nonCer")) {
				pstmt.setInt(1, 0);
			} else if (value.equals("nomal")) {
				pstmt.setInt(1, 1);
			} else if (value.equals("cer")) {
				pstmt.setInt(1, 2);
			} else {
				pstmt.setInt(1, 3);
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

	public ArrayList<User> selectMemberListForUserNo(Connection con, int currentPage, int limit, String value) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User u = null;
		ArrayList<User> mlist = null;
		String query = prop.getProperty("selectMemberOne");

		try {

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(value));
			rs = pstmt.executeQuery();

			mlist = new ArrayList<User>();
			if (rs.next()) {
				u = new User();
				u.setUser_no(rs.getInt("user_no"));
				u.setEmail(rs.getString("email"));
				u.setUser_pwd(rs.getString("user_pwd"));
				u.setUser_type(rs.getInt("user_type"));
				u.setUser_name(rs.getString("user_name"));
				u.setPhone(rs.getString("phone"));
				u.setBirthday(rs.getDate("birthday"));
				u.setGender(rs.getString("gender"));
				u.setAddress(rs.getString("address"));
				u.setSms_chk(rs.getString("sms_chk"));
				u.setEmail_chk(rs.getString("email_chk"));
				u.setEnrollDate(rs.getDate("enrolldate"));
				u.setNickname(rs.getString("nickname"));
				u.setUser_grade(rs.getInt("user_grade"));
				u.setPet_auth(rs.getString("pet_auth"));
				u.setUser_status(rs.getInt("user_status"));
				u.setFile_no(rs.getInt("file_no"));
				u.setEmail_hash(rs.getString("email_hash"));
				u.setArticle_no(rs.getInt("article_no"));

				mlist.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return mlist;
	}

	public ArrayList<User> selectMemberListForUserId(Connection con, int currentPage, int limit, String value) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User u = null;
		ArrayList<User> mlist = null;
		String query = prop.getProperty("searchMemberForName");

		try {

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + value + "%");
			rs = pstmt.executeQuery();

			mlist = new ArrayList<User>();

			while (rs.next()) {
				System.out.println("시행");
				u = new User();
				u.setUser_no(rs.getInt("user_no"));
				u.setEmail(rs.getString("email"));
				u.setUser_pwd(rs.getString("user_pwd"));
				u.setUser_type(rs.getInt("user_type"));
				u.setUser_name(rs.getString("user_name"));
				u.setPhone(rs.getString("phone"));
				u.setBirthday(rs.getDate("birthday"));
				u.setGender(rs.getString("gender"));
				u.setAddress(rs.getString("address"));
				u.setSms_chk(rs.getString("sms_chk"));
				u.setEmail_chk(rs.getString("email_chk"));
				u.setEnrollDate(rs.getDate("enrolldate"));
				u.setNickname(rs.getString("nickname"));
				u.setUser_grade(rs.getInt("user_grade"));
				u.setPet_auth(rs.getString("pet_auth"));
				u.setUser_status(rs.getInt("user_status"));
				u.setFile_no(rs.getInt("file_no"));
				u.setEmail_hash(rs.getString("email_hash"));
				u.setArticle_no(rs.getInt("article_no"));

				mlist.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return mlist;
	}

	public ArrayList<User> selectMemberListForUserStatus(Connection con, int currentPage, int limit, String value) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User u = null;
		ArrayList<User> mlist = null;
		String query = prop.getProperty("searchMemberForStatus");

		try {

			pstmt = con.prepareStatement(query);
			if (value.equals("dia")) {
				pstmt.setInt(1, 0);
			} else if (value.equals("nomal")) {
				pstmt.setInt(1, 1);
			} else if (value.equals("leave")) {
				pstmt.setInt(1, 2);
			} else {
				pstmt.setInt(1, 4);
			}
			rs = pstmt.executeQuery();

			mlist = new ArrayList<User>();
			while (rs.next()) {
				u = new User();
				u.setUser_no(rs.getInt("user_no"));
				u.setEmail(rs.getString("email"));
				u.setUser_pwd(rs.getString("user_pwd"));
				u.setUser_type(rs.getInt("user_type"));
				u.setUser_name(rs.getString("user_name"));
				u.setPhone(rs.getString("phone"));
				u.setBirthday(rs.getDate("birthday"));
				u.setGender(rs.getString("gender"));
				u.setAddress(rs.getString("address"));
				u.setSms_chk(rs.getString("sms_chk"));
				u.setEmail_chk(rs.getString("email_chk"));
				u.setEnrollDate(rs.getDate("enrolldate"));
				u.setNickname(rs.getString("nickname"));
				u.setUser_grade(rs.getInt("user_grade"));
				u.setPet_auth(rs.getString("pet_auth"));
				u.setUser_status(rs.getInt("user_status"));
				u.setFile_no(rs.getInt("file_no"));
				u.setEmail_hash(rs.getString("email_hash"));
				u.setArticle_no(rs.getInt("article_no"));

				mlist.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return mlist;
	}

	public ArrayList<User> selectMemberListForUserGrade(Connection con, int currentPage, int limit, String value) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User u = null;
		ArrayList<User> mlist = null;
		String query = prop.getProperty("searchMemberForGrade");

		try {

			pstmt = con.prepareStatement(query);
			if (value.equals("nonCer")) {
				pstmt.setInt(1, 0);
			} else if (value.equals("nomal")) {
				pstmt.setInt(1, 1);
			} else if (value.equals("cer")) {
				pstmt.setInt(1, 2);
			} else {
				pstmt.setInt(1, 3);
			}

			rs = pstmt.executeQuery();

			mlist = new ArrayList<User>();
			while (rs.next()) {
				u = new User();
				u.setUser_no(rs.getInt("user_no"));
				u.setEmail(rs.getString("email"));
				u.setUser_pwd(rs.getString("user_pwd"));
				u.setUser_type(rs.getInt("user_type"));
				u.setUser_name(rs.getString("user_name"));
				u.setPhone(rs.getString("phone"));
				u.setBirthday(rs.getDate("birthday"));
				u.setGender(rs.getString("gender"));
				u.setAddress(rs.getString("address"));
				u.setSms_chk(rs.getString("sms_chk"));
				u.setEmail_chk(rs.getString("email_chk"));
				u.setEnrollDate(rs.getDate("enrolldate"));
				u.setNickname(rs.getString("nickname"));
				u.setUser_grade(rs.getInt("user_grade"));
				u.setPet_auth(rs.getString("pet_auth"));
				u.setUser_status(rs.getInt("user_status"));
				u.setFile_no(rs.getInt("file_no"));
				u.setEmail_hash(rs.getString("email_hash"));
				u.setArticle_no(rs.getInt("article_no"));

				mlist.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return mlist;
	}

	public ImgFile selectUserProfile(Connection con, int file_no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ImgFile img = null;
		String query = prop.getProperty("selectProfileImg");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, file_no);

			rs = pstmt.executeQuery();
			img = new ImgFile();
			if (rs.next()) {
				img.setFile_no(rs.getInt("file_no"));
				img.setFile_date(rs.getDate("file_date"));
				img.setFile_name(rs.getString("file_name"));
				img.setFile_use(rs.getInt("file_use"));
				img.setFile_path(rs.getString("file_path"));
				img.setFile_dalete(rs.getString("file_delete"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return img;

	}

	public LoginHistory selectLoginHistory(Connection con, int userNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		LoginHistory lh = null;
		ResultSet rs = null;
		String query = prop.getProperty("selectLoginHistory");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);

			rs = pstmt.executeQuery();
			lh = new LoginHistory();
			if (rs.next()) {
				lh.setUserNo(rs.getInt("user_no"));
				lh.setLoginDate(rs.getDate("login_date"));
				lh.setLoginIp(rs.getString("login_ip"));
				lh.setLocation(rs.getString("location"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return lh;
	}

	public int setUserFileNO(Connection con, User u) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("setUserFileNO");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, u.getUser_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<ImgFile> selectProfileHistory(Connection con, int file_no, int userNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ImgFile img = null;
		ResultSet rs = null;
		ArrayList<ImgFile> plist = null;
		String query = prop.getProperty("selectProFileHistory");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, file_no);

			rs = pstmt.executeQuery();
			plist = new ArrayList<ImgFile>();

			while (rs.next()) {
				img = new ImgFile();
				img.setFile_no(rs.getInt("file_no"));
				img.setFile_date(rs.getDate("file_date"));
				img.setFile_name(rs.getString("file_name"));
				img.setFile_use(rs.getInt("file_use"));
				img.setFile_path(rs.getString("file_path"));
				img.setFile_dalete(rs.getString("file_delete"));

				plist.add(img);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return plist;
	}

	public int deleteTitleProfileSetMember(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteTitleProfileSetMember");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int setUserFileNO(Connection con, int UserNO) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("setUserFileNO");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, UserNO);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteTitleProfileSetFile(Connection con, String fileNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteTitleProfileSetFile");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(fileNo));

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int setCyberMoney(Connection con, User u) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("setCyberMoney");

		try {
			pstmt = con.prepareStatement(query);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateTitleProfile(Connection con, String fileNo, int userNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateTitleProfile");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(fileNo));
			pstmt.setInt(2, userNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Pet> selectUserPet(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ArrayList<Pet> plist = null;
		Pet pet = null;
		ResultSet rs = null;
		String query = prop.getProperty("selectUserPet");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);

			rs = pstmt.executeQuery();

			plist = new ArrayList<Pet>();

			while (rs.next()) {
				pet = new Pet();
				pet.setPetNo(rs.getInt("pet_no"));
				pet.setUserNo(rs.getInt("user_no"));
				pet.setPetCategory(rs.getInt("pet_category"));
				pet.setPetName(rs.getString("pet_name"));
				pet.setPetBirth(rs.getDate("pet_birth"));
				pet.setPetGender(rs.getString("pet_gender"));
				pet.setNeutralChk(rs.getString("neutral_chk"));
				pet.setPetWeight(rs.getString("pet_weight"));
				pet.setPetMeno(rs.getString("pet_memo"));
				pet.setPetCategoryMajorName(rs.getString("major"));
				pet.setPetCategoryMinorName(rs.getString("minor"));

				plist.add(pet);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return plist;
	}

	public int modifyMemberInfo(Connection con, User user) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("modifyMemberInfo");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getUser_name());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPhone());
			pstmt.setString(4, user.getSms_chk());
			pstmt.setString(5, user.getEmail_chk());
			pstmt.setInt(6, user.getUser_no());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deletePetInfo(Connection con, int petNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deletePetInfo");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, petNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectNeedDiapauseMemberList(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> maplist = null;
		String query = prop.getProperty("selectNeedDiapauseMember");

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			maplist = new ArrayList<HashMap<String, Object>>();
			while (rs.next()) {
				hmap = new HashMap<String, Object>();
				User u = new User();
				u.setUser_no(rs.getInt("user_no"));
				u.setEmail(rs.getString("email"));
				u.setUser_pwd(rs.getString("user_pwd"));
				u.setUser_type(rs.getInt("user_type"));
				u.setUser_name(rs.getString("user_name"));
				u.setPhone(rs.getString("phone"));
				u.setBirthday(rs.getDate("birthday"));
				u.setGender(rs.getString("gender"));
				u.setAddress(rs.getString("address"));
				u.setSms_chk(rs.getString("sms_chk"));
				u.setEmail_chk(rs.getString("email_chk"));
				u.setEnrollDate(rs.getDate("enrolldate"));
				u.setNickname(rs.getString("nickname"));
				u.setUser_grade(rs.getInt("user_grade"));
				u.setPet_auth(rs.getString("pet_auth"));
				u.setUser_status(rs.getInt("user_status"));
				u.setFile_no(rs.getInt("file_no"));
				u.setEmail_hash(rs.getString("email_hash"));
				u.setArticle_no(rs.getInt("article_no"));

				String loginDate = rs.getString("LOGIN_DATE");

				hmap.put("user", u);
				hmap.put("loginDate", loginDate);

				maplist.add(hmap);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return maplist;
	}

	public int[] updateDiapauseMember(Connection con, String[] selectUserNos) {
		PreparedStatement pstmt = null;
		int[] result = null;
		String query = prop.getProperty("updateDiapause");

		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < selectUserNos.length; i++) {
				pstmt.setInt(1, Integer.parseInt(selectUserNos[i]));
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

	public int getPenaltyMemberCount(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("penaltyListCount");

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

	public ArrayList<Board> selectPenaltyMemberList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> mlist = null;
		String query = prop.getProperty("selectPenaltyMemberList");

		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			mlist = new ArrayList<Board>();
			while (rs.next()) {
				Board b = new Board();
				b.setArticle_no(rs.getInt("ARTICLE_NO"));
				b.setUser_no(rs.getInt("user_no"));
				b.setArticle_date(rs.getDate("ARTICLE_DATE"));
				b.setArticle_title(rs.getString("ARTICLE_TITLE"));
				b.setArticle_contents(rs.getString("ARTICLE_CONTENTS"));
				b.setArticle_type(rs.getString("ARTICLE_TYPE"));
				b.setArticle_lv(rs.getInt("ARTICLE_LV"));
				b.setArticle_refno(rs.getInt("article_refno"));
				b.setArticle_status(rs.getInt("article_status"));
				b.setArticle_modify_date(rs.getDate("ARTICLE_MODIFY_DATE"));

				mlist.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return mlist;
	}

	public ArrayList<Board> selectRecentlyList(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Board> blist = null;
		Board b = null;
		String query = prop.getProperty("selectRecentlyList");
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			blist = new ArrayList<Board>();
			while(rs.next()){
				b = new Board();
				b.setArticle_no(rs.getInt("ARTICLE_NO"));
				b.setUser_no(rs.getInt("user_no"));
				b.setArticle_date(rs.getDate("ARTICLE_DATE"));
				b.setArticle_title(rs.getString("ARTICLE_TITLE"));
				b.setArticle_contents(rs.getString("ARTICLE_CONTENTS"));
				b.setArticle_type(rs.getString("ARTICLE_TYPE"));
				b.setArticle_lv(rs.getInt("ARTICLE_LV"));
				b.setArticle_refno(rs.getInt("article_refno"));
				b.setArticle_status(rs.getInt("article_status"));
				b.setArticle_modify_date(rs.getDate("ARTICLE_MODIFY_DATE"));

				blist.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return blist;
	}

	public ArrayList<Board> selectSEList(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Board> blist = null;
		Board b = null;
		String query = prop.getProperty("selectSEList");
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			blist = new ArrayList<Board>();
			while(rs.next()){
				b = new Board();
				b.setArticle_no(rs.getInt("ARTICLE_NO"));
				b.setUser_no(rs.getInt("user_no"));
				b.setArticle_date(rs.getDate("ARTICLE_DATE"));
				b.setArticle_title(rs.getString("ARTICLE_TITLE"));
				b.setArticle_contents(rs.getString("ARTICLE_CONTENTS"));
				b.setArticle_type(rs.getString("ARTICLE_TYPE"));
				b.setArticle_lv(rs.getInt("ARTICLE_LV"));
				b.setArticle_refno(rs.getInt("article_refno"));
				b.setArticle_status(rs.getInt("article_status"));
				b.setArticle_modify_date(rs.getDate("ARTICLE_MODIFY_DATE"));

				blist.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return blist;
	}

	public int[] updateSanctions(Connection con, String[] selectUserNos) {
		PreparedStatement pstmt = null;
		int[] result = null;
		String query = prop.getProperty("updateSanctions");
		
		try {
			pstmt = con.prepareStatement(query);
			String[] temp ;
			for (int i = 0; i < selectUserNos.length; i++) {
				temp = selectUserNos[i].split("/");
				pstmt.setInt(1, Integer.parseInt(temp[0]));
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

	public int[] updateBoardStatus(Connection con, String[] selectUserNos) {
		PreparedStatement pstmt = null;
		int[] result = null;
		String query = prop.getProperty("updateSanBoardStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			String[] temp ;
			for (int i = 0; i < selectUserNos.length; i++) {
				temp = selectUserNos[i].split("/");
				pstmt.setInt(1, Integer.parseInt(temp[1]));
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
}
