package com.pkb.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.commiAndAccount.model.service.CommiAndAccountService;
import com.pkb.member.model.service.UserService;

/**
 * Servlet implementation class DeleteMemberServlet
 */
@WebServlet("/deleteMember.me")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteMemberServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String selectUserNo = request.getParameter("selecUserNo");

		String[] tempUserNos = selectUserNo.split(",");
		int[] selectUserNos = new int[tempUserNos.length];

		for (int i = 0; i < selectUserNos.length; i++) {
			selectUserNos[i] = Integer.parseInt(tempUserNos[i]);
		}

		int[] result = new UserService().deleteMember(selectUserNos);

		String page = "";
		if (result.length > 0) {
			response.sendRedirect(request.getContextPath() + "/selectList.me");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지)회원 탈퇴처리 실패");

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
