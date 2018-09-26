package com.pkb.member.model.service;

import static com.pkb.common.JDBCTemplate.close;
import static com.pkb.common.JDBCTemplate.commit;
import static com.pkb.common.JDBCTemplate.getConnection;
import static com.pkb.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.pkb.member.model.dao.UserDAO;
import com.pkb.member.model.vo.ImgFile;
import com.pkb.member.model.vo.Pet;
import com.pkb.member.model.vo.User;
import com.pkb.member.util.SHA256;
import com.pkb.reservation.model.vo.Reservation;

public class UserService {

	public User loginCheck(String email, String user_pwd) {
		Connection con = getConnection();

		User loginUser = new UserDAO().loginCheck(con, email, user_pwd);

		if (loginUser != null) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return loginUser;
	}

	public int joinUser(User u) {
		Connection con = getConnection();

		int result = new UserDAO().joinUser(con, u);

		if (result > 0) {
			int result1 = new UserDAO().setCyberMoney(con, u);
			if (result1 > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		close(con);

		return result;
	}

	public int mailAuth(String email, String code) {
		Connection con = getConnection();
		int result = 0;

		if (SHA256.getSHA256(email).equals(code)) {
			result = new UserDAO().mailAuth(con, email);
		} else {
			result = 0;
		}

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int changeAdd(User loginUser, String address) {
		Connection con = getConnection();

		int result = new UserDAO().chageAdd(con, loginUser, address);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int checkId(String email) {
		Connection con = getConnection();

		int result = new UserDAO().checkId(con, email);

		close(con);

		return result;
	}

	public int checkPwd(String currentPwd, String email) {
		Connection con = getConnection();

		int result = new UserDAO().checkPwd(con, currentPwd, email);

		close(con);

		return result;
	}

	public int changePwd(String newPwd, String email) {
		Connection con = getConnection();

		int result = new UserDAO().changePwd(con, newPwd, email);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int changeNickname(String nickname, String email) {
		Connection con = getConnection();

		int result = new UserDAO().changeNickname(con, nickname, email);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Reservation> getReservation(User loginUser) {

		Connection con = getConnection();

		ArrayList<Reservation> list = new UserDAO().getReservation(loginUser, con);

		close(con);
		return list;
	}

	public int getListCount() {
		Connection con = getConnection();

		int result = new UserDAO().getListCount(con);

		close(con);

		return result;
	}

	public ArrayList<User> selectMemberList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<User> mlist = new UserDAO().selectMemberList(con, currentPage, limit);

		close(con);

		return mlist;
	}

	public ArrayList<ImgFile> selectlist(User u) {
		Connection con = getConnection();
		ArrayList<ImgFile> list = null;

		list = new UserDAO().selectList(con, u);

		close(con);

		return list;

	}

	public int[] deleteMember(String[] selectUserNos, String title, String content, int adminUserNo) {
		Connection con = getConnection();

		int result[] = new UserDAO().deleteMember(con, selectUserNos);
		if (result.length > 0) {
			int result2[] = new UserDAO().writeDeleteReason(con, selectUserNos, adminUserNo, title, content);

			if (result2.length > 0) {
				result = result2;
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

	public HashMap<String, Object> selectMemberOne(int userNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		HashMap<String, Object> hmap = new UserDAO().selectMemberOne(con, userNo);
		if (hmap != null) {
			ImgFile profile = new UserDAO().selectUserProfile(con, ((User) hmap.get("user")).getFile_no());

			hmap.put("profile", profile);
			if(profile != null){
				ArrayList<ImgFile> profileHistory = new UserDAO().selectProfileHistory(con, profile.getFile_no(), userNo);
				hmap.put("profileHistory", profileHistory);
			}
			ArrayList<Pet> plist = new UserDAO().selectUserPet(con, userNo);
			hmap.put("pet", plist);
		}

		close(con);

		return hmap;
	}

	public String phone(String msg) {

		return msg;

	}

	public int[] lockMember(String[] selectUserNos, String title, String content, int adminUserNo, String lockDate) {
		Connection con = getConnection();

		int result[] = new UserDAO().lockMember(con, selectUserNos);
		if (result.length > 0) {
			int result2[] = new UserDAO().writeLockReason(con, selectUserNos, adminUserNo, title, content, lockDate);

			if (result2.length > 0) {
				result = result2;
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int insertSms(String smsNumber, String email) {
		Connection con = getConnection();

		int result = new UserDAO().insertSms(con, smsNumber, email);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return result;
	}

	public int updatePhone(String phone, String sms, User loginUser) {
		Connection con = getConnection();

		int result = new UserDAO().updatePhone(con, phone, sms, loginUser);

		if (result > 0) {
			int result1 = new UserDAO().authTBphone(con, loginUser);
			if (result1 > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int getListCountUserId(String value) {
		Connection con = getConnection();

		int result = new UserDAO().getListCountUserId(con, value);

		close(con);

		return result;
	}

	public int getListCountUserStatus(String value) {
		Connection con = getConnection();

		int result = new UserDAO().getListCountUserStatus(con, value);

		close(con);

		return result;
	}

	public int getListCountUserGrade(String value) {
		Connection con = getConnection();

		int result = new UserDAO().getListCountUserGrade(con, value);

		close(con);

		return result;
	}

	public ArrayList<User> selectMemberListForUserNo(int currentPage, int limit, String value) {
		Connection con = getConnection();

		ArrayList<User> mlist = new UserDAO().selectMemberListForUserNo(con, currentPage, limit, value);

		close(con);

		return mlist;
	}

	public ArrayList<User> selectMemberListForUserId(int currentPage, int limit, String value) {
		Connection con = getConnection();

		ArrayList<User> mlist = new UserDAO().selectMemberListForUserId(con, currentPage, limit, value);

		close(con);

		return mlist;
	}

	public ArrayList<User> selectMemberListForUserStatus(int currentPage, int limit, String value) {
		Connection con = getConnection();

		ArrayList<User> mlist = new UserDAO().selectMemberListForUserStatus(con, currentPage, limit, value);

		close(con);

		return mlist;
	}

	public ArrayList<User> selectMemberListForUserGrade(int currentPage, int limit, String value) {
		Connection con = getConnection();

		ArrayList<User> mlist = new UserDAO().selectMemberListForUserGrade(con, currentPage, limit, value);

		close(con);

		return mlist;
	}

	public int deleteTitleProfile(String fileNo, int userNo) {
		Connection con = getConnection();

		int result = new UserDAO().deleteTitleProfileSetMember(con, userNo);

		if (result > 0) {
			result = new UserDAO().deleteTitleProfileSetFile(con, fileNo);
			if (result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

	public int deleteSubProfile(String fileNo) {
		Connection con = getConnection();

		int result = new UserDAO().deleteTitleProfileSetFile(con, fileNo);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return result;
	}

	public int updateTitleProfile(String fileNo, int userNo) {
		Connection con = getConnection();

		int result = new UserDAO().updateTitleProfile(con, fileNo, userNo);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return result;

	}

	public int modifyMemberInfo(User user) {
		Connection con = getConnection();

		int result = new UserDAO().modifyMemberInfo(con, user);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int deletePetInfo(int petNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		int result = new UserDAO().deletePetInfo(con, petNo);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public HashMap<String, Object> selectDiapauseMember(int currentPage, int limit) {
		Connection con = getConnection();
		HashMap<String, Object> dmMap = null;
		ArrayList<User> mlist = new UserDAO().selectMemberListForUserStatus(con, currentPage, limit, "dia");
		
		if(mlist != null){
			dmMap = new HashMap<String,Object>();
			dmMap.put("mlist", mlist);
			ArrayList<User> needMemberList = new UserDAO().selectNeedDiapauseMemberList(con);
			dmMap.put("nmlist", needMemberList);
		}
		
		close(con);
		return dmMap;
	}

}
