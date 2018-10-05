package com.pkb.payment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.payment.model.service.PaymentService;
import com.pkb.payment.model.service.PaymentService3;

/**
 * Servlet implementation class RefundApprovalServlet
 */
@WebServlet("/refundApproval.pa")
public class RefundApprovalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefundApprovalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));
		int refundAmount = Integer.parseInt(request.getParameter("refundAmount"));
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		int petsitter_no = Integer.parseInt(request.getParameter("petsitter_no"));
		int rate = Integer.parseInt(request.getParameter("rate"));
		int payment_no = Integer.parseInt(request.getParameter("payment_no"));

		
		int result = new PaymentService3().refundApproval(totalAmount,refundAmount,user_no,petsitter_no,rate,payment_no);
		
		if (result> 0) {
			response.sendRedirect(request.getContextPath() + "/refundMain.pa");
		} else {
			String page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지)환불 처리 실패");

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
