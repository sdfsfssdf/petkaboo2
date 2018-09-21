package com.pkb.commiAndAccount.model.service;

import static com.pkb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.pkb.commiAndAccount.model.dao.CommiAndAccountDao;
import com.pkb.commiAndAccount.model.vo.Account;
import com.pkb.commiAndAccount.model.vo.Commission;
import com.pkb.commiAndAccount.model.vo.CommissionAndAccountList;
import com.pkb.commiAndAccount.model.vo.PetCategory;

public class CommiAndAccountService {

	public CommissionAndAccountList selectCAAList(int current, int limit) {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		CommissionAndAccountList caa = new CommiAndAccountDao().selectCommitonList(con);

		if (caa.getClist() != null) {
			CommissionAndAccountList tempcaa = new CommiAndAccountDao().selectAccountList(con);

			if (tempcaa != null) {
				caa.setAlist(tempcaa.getAlist());
				ArrayList<PetCategory> plist = new CommiAndAccountDao().selectPetCategory(con, current, limit);
				if (plist != null) {
					caa.setPlist(plist);
				} else {
					caa = null;
				}
			} else {
				caa = null;
			}
		}

		close(con);

		return caa;
	}

	public int[] modifyCommssion(ArrayList<Commission> clist) {
		Connection con = getConnection();

		int[] result = new CommiAndAccountDao().modifyCommssion(con, clist);

		if (result.length > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return result;
	}

	public int[] deleteAccount(int[] accNos) {
		Connection con = getConnection();

		int[] result = new CommiAndAccountDao().deleteAccount(con, accNos);

		if (result.length > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return result;
	}

	public int insertAccount(Account ac, int user_no) {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		int result = new CommiAndAccountDao().insertAccount(con, ac, user_no);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int insertCategoryMajor(PetCategory pc, int commission) {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		int result = new CommiAndAccountDao().insertCategoryMajor(con, pc);
		int result2 = 0;
		if (result > 0) {
			result2 = new CommiAndAccountDao().insertFee(con, commission);

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

	public int insertCategoryMinor(PetCategory pc) {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		int result = new CommiAndAccountDao().insertCateogoryMinor(con, pc);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int getListCount() {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		int result = new CommiAndAccountDao().getListCount(con);

		close(con);

		return result;
	}

	public int[] deleteCategory(int[] accNos) {
		Connection con = getConnection();

		int[] result = new CommiAndAccountDao().deleteCategory(con, accNos);

		if (result.length > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return result;
	}

}
