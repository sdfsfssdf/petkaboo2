package com.pkb.payment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.payment.model.service.PaymentService3;

/**
 * Servlet implementation class UpdateBankBookApprovalServlet
 */
@WebServlet("/bankBookApproval.pa")
public class UpdateBankBookApprovalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBankBookApprovalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectUserNo = request.getParameter("selecUserNo");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		String[] selectUserNos = selectUserNo.split(",");
		for (int i = 0; i < selectUserNos.length; i++) {
			System.out.println(selectUserNos[i]);
		}
		
		int[] result = new PaymentService3().updateBankApproval(selectUserNos);
		
		if (result.length > 0) {
			response.sendRedirect(request.getContextPath() + "/bankBook.pa");
		} else {
			String page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지)무통장 입금 / 입금처리 살패");

			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
