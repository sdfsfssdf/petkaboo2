package com.pkb.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.member.model.service.UserService;

/**
 * Servlet implementation class UpdateSanctionsSelvelt
 */
@WebServlet("/updateSantions.me")
public class UpdateSanctionsSelvelt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateSanctionsSelvelt() {
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

		String[] selectUserNos = selectUserNo.split(",");
		for (int i = 0; i < selectUserNos.length; i++) {
			System.out.println(selectUserNos[i]);
		}
		
		int[] result = new UserService().updateSanctions(selectUserNos);

		if (result != null && result.length > 0) {
			response.sendRedirect(request.getContextPath() + "/selectPenaltyList.me");
		} else {
			String page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지)회원 제재 만료설정 실패");
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
