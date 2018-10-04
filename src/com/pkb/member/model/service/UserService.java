package com.pkb.member.model.service;

import static com.pkb.common.JDBCTemplate.close;
import static com.pkb.common.JDBCTemplate.commit;
import static com.pkb.common.JDBCTemplate.getConnection;
import static com.pkb.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.pkb.board.model.vo.Board;
import com.pkb.member.model.dao.UserDAO;
import com.pkb.member.model.vo.ApplyHistory;
import com.pkb.member.model.vo.ImgFile;
import com.pkb.member.model.vo.Pet;
import com.pkb.member.model.vo.User;
import com.pkb.member.util.SHA256;
import com.pkb.payment.model.dao.PaymentDao;
import com.pkb.payment.model.dao.PaymentDao3;
import com.pkb.payment.model.vo.Payment;
import com.pkb.reservation.model.vo.Reservation;

public class UserService {

	public User loginCheck(String email, String user_pwd, String ip, String reply) {
		Connection con = getConnection();

		User loginUser = new UserDAO().loginCheck(con, email, user_pwd);

		if (loginUser != null) {
			commit(con);
			int result = new UserDAO().loginHistory(con, loginUser, ip, reply);
			if (result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		close(con);
		return loginUser;
	}

	public int joinUser(User u, String ip, String reply) {
		Connection con = getConnection();

		int result = new UserDAO().joinUser(con, u);

		if (result > 0) {
			int result1 = new UserDAO().setCyberMoney(con, u);
			if (result1 > 0) {
				int result2 = new UserDAO().insertLoginHistory(con, u, ip, reply);
				if (result2 > 0) {
					commit(con);
				} else {
					rollback(con);
				}
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
			if (profile != null) {
				ArrayList<ImgFile> profileHistory = new UserDAO().selectProfileHistory(con, profile.getFile_no(),
						userNo);
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

	public ImgFile selectUserProfile(User u) {
		Connection con = getConnection();

		ImgFile profile = new UserDAO().selectUserProfile(con, u.getFile_no());

		close(con);

		return profile;
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

		if (mlist != null) {
			dmMap = new HashMap<String, Object>();
			dmMap.put("mlist", mlist);
			ArrayList<HashMap<String, Object>> needMemberList = new UserDAO().selectNeedDiapauseMemberList(con);
			dmMap.put("nmlist", needMemberList);
		}

		close(con);

		return dmMap;
	}

	public int findPwd(String email, String name) {
		Connection con = getConnection();

		int result = new UserDAO().findPwd(con, email, name);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return result;
	}

	public int[] updateDiapauseMember(String[] selectUserNos, int adminNo) {
		Connection con = getConnection();
		int[] result = new UserDAO().updateDiapauseMember(con, selectUserNos);
		int[] result2 = null;
		if (result.length > 0) {
			result2 = new UserDAO().writeDiapauseReason(con, adminNo, selectUserNos);
			if (result2.length > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		close(con);

		return result2;
	}

	public int getPenaltyMemberCount() {
		Connection con = getConnection();

		int result = new UserDAO().getPenaltyMemberCount(con);

		close(con);

		return result;
	}

	public HashMap<String, Object> selectPenaltyMemberList(int currentPage, int limit) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = null;
		ArrayList<Board> pmlist = new UserDAO().selectPenaltyMemberList(con, currentPage, limit);
		if (pmlist != null) {
			hmap = new HashMap<String, Object>();
			hmap.put("pmlist", pmlist);

			ArrayList<Board> recentlyList = new UserDAO().selectRecentlyList(con);
			hmap.put("reList", recentlyList);

			ArrayList<Board> sanctinsExpirationList = new UserDAO().selectSEList(con);
			hmap.put("seList", sanctinsExpirationList);
		}
		close(con);
		return hmap;
	}

	public int[] updateSanctions(String[] selectUserNos) {
		Connection con = getConnection();
		int[] result = new UserDAO().updateSanctions(con, selectUserNos);
		if (result.length > 0) {
			int[] result2 = new UserDAO().updateBoardStatus(con, selectUserNos);
			if (result2.length > 0) {
				commit(con);
			} else {
				rollback(con);
				result = null;
			}
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int loginHistory(User loginUser, String ip, String reply) {
		Connection con = getConnection();

		int result = new UserDAO().loginHistory(con, loginUser, ip, reply);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;

	}

	public Board selectPenaltyMemberOne(int article_no) {
		Connection con = getConnection();
		Board b = new UserDAO().selectPenaltyMemberOne(con, article_no);

		close(con);

		return b;
	}

	public int insertAcc(int userNo, String bankName, String acc) {
		Connection con = getConnection();

		int result = new UserDAO().insertAcc(con, userNo, bankName, acc);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int getPetsitterRequestCount() {
		Connection con = getConnection();

		int result = new UserDAO().getPetsitterRequestCount(con);

		close(con);

		return result;
	}

	public ArrayList<ApplyHistory> selectPetsitterRequest(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<ApplyHistory> alist = new UserDAO().selectPetsitterRequest(con, currentPage, limit);

		close(con);

		return alist;
	}

	public int refusalPetsitterRequest(int no, String content) {
		Connection con = getConnection();

		int result = new UserDAO().refusalPetsitterRequest(con, no, content);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int approvalPetsitterRequest(int record_no) {
		Connection con = getConnection();
		int result = new UserDAO().approvalPetsitterRequest(con, record_no);
		int result2 = 0;
		if (result > 0) {
			result2 = new UserDAO().updateUserGrade(con, record_no);
			if (result2 > 0) {

				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}

		close(con);

		return result2;
	}

	public ApplyHistory selectOneApplyHistory(String selectNum) {
		Connection con = getConnection();
		ApplyHistory ah = new UserDAO().selectOneApplyHistory(con, selectNum);

		close(con);

		return ah;
	}

	public HashMap<String, Object> getAdminMainInfo(User u) {
		Connection con = getConnection();

		HashMap<String, Object> totalInfo = null;
		Integer memberCount = new UserDAO().getMemberCount(con);
		if (memberCount != null) {
			Integer petsitterCount = new UserDAO().getPetsitterCount(con);
			if (petsitterCount != null) {
				ArrayList<HashMap<String, String>> incomeList = new PaymentDao().selectTodayIncomeList(con);
				if (incomeList != null) {
					Integer newMemberCount = new UserDAO().getNewMemberCount(con);
					if (newMemberCount != null) {
						String loginDate = new UserDAO().getLastLoginDate(con, u);
						if (loginDate != null) {
							HashMap<String, Integer> todayInfo = new PaymentDao().selectTodayPaymentHistoryList(con);
							if (todayInfo != null) {
								ArrayList<HashMap<String, Object>> needMemberList = new UserDAO()
										.selectNeedDiapauseMemberList(con);
								if (needMemberList != null) {

									ArrayList<Board> recentlyList = new UserDAO().selectRecentlyList(con);
									if (recentlyList != null) {

										ArrayList<Board> sanctinsExpirationList = new UserDAO().selectSEList(con);
										if (sanctinsExpirationList != null) {
											ArrayList<Payment> plist = new PaymentDao3().selectTodayInfo(con);
											if (plist != null) {
												totalInfo = new HashMap<String, Object>();
												totalInfo.put("memberCount", memberCount);
												totalInfo.put("petsitterCount", petsitterCount);
												totalInfo.put("incomList", incomeList);
												totalInfo.put("newMemberCount", newMemberCount);
												totalInfo.put("loginDate", loginDate);
												totalInfo.put("todayInfo", todayInfo);
												totalInfo.put("needMemberList", needMemberList);
												totalInfo.put("recentlyList", recentlyList);
												totalInfo.put("sanctinsExpirationList", sanctinsExpirationList);
												totalInfo.put("plist", plist);
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}

		close(con);
		return totalInfo;
	}

	public HashMap<String,Object> selectStatisticInfo() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		HashMap<String,Object> totalMap = null;
		ArrayList<HashMap<String, Object>> totalInfo = null;

		totalInfo = new UserDAO().selectStatisticInfo(con);
		if (totalInfo != null) {
			int cnt = new UserDAO().selectStatisticInfoByJoinMember(con, totalInfo);
			if (cnt != 0) {
				HashMap<String,Object> mMap = new UserDAO().totalMemberCounts(con);
				if(mMap != null){
					totalMap = new HashMap<String,Object>();
					totalMap.put("totalInfo", totalInfo);
					totalMap.put("mMap", mMap);
				}
			}
		}
		close(con);
		
		return totalMap;
	}

}
