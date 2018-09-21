package com.pkb.commiAndAccount.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.commiAndAccount.model.service.CommiAndAccountService;

/**
 * Servlet implementation class DeleteCategoryServlet
 */
@WebServlet("/deleteCategory.caa")
public class DeleteCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteCategoryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String selectAccNo = request.getParameter("selecCategorys");

		String[] tempAccNos = selectAccNo.split(",");
		int[] accNos = new int[tempAccNos.length];

		for (int i = 0; i < accNos.length; i++) {
			accNos[i] = Integer.parseInt(tempAccNos[i]);
		}

		int[] result = new CommiAndAccountService().deleteCategory(accNos);

		
		String page = "";
		if (result.length > 0) {
			response.sendRedirect(request.getContextPath() + "/caaList.caa");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지)관리자 무통장 입금계좌 삭제 실패");

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
