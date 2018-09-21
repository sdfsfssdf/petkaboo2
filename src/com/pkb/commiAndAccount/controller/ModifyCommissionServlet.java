package com.pkb.commiAndAccount.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.commiAndAccount.model.service.CommiAndAccountService;
import com.pkb.commiAndAccount.model.vo.Commission;
import com.pkb.commiAndAccount.model.vo.CommissionAndAccountList;

/**
 * Servlet implementation class ModifyCommissionServlet
 */
@WebServlet("/modifyCommission.caa")
public class ModifyCommissionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModifyCommissionServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String category = request.getParameter("category");
		String value = request.getParameter("value");

		// 분류별로 조합하기
		ArrayList<Commission> clist = new ArrayList<Commission>();
		String[] tempCategorys = category.split(",");
		String[] tempValues = value.split(",");

		// 넘겨온 값 체크
		for (int i = 0; i < tempValues.length; i++) {
			if (tempValues[i] != null && !tempValues[i].equals("")) {
				Commission com = new Commission();
				com.setPetCategory(Integer.parseInt(tempCategorys[i]));
				com.setFee_rate(Integer.parseInt(tempValues[i]));

				clist.add(com);
			}
		}

		int[] result = new CommiAndAccountService().modifyCommssion(clist);

		
		String page = "";
		if (result.length > 0) {
			response.sendRedirect(request.getContextPath()+ "/caaList.caa");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지)카테고리별 수수로 변경 실패");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
