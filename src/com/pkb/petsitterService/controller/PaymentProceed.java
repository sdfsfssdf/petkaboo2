package com.pkb.petsitterService.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.petsitterService.model.service.ContractMainService;

/**
 * Servlet implementation class PaymentProceed
 */
@WebServlet("/PaymentProceed.do")
public class PaymentProceed extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentProceed() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int contractno = Integer.parseInt(request.getParameter("contractno"));
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		int fullPrice = Integer.parseInt(request.getParameter("fullPrice"));
		String page = "";
		int result = new ContractMainService().paymentProceed(contractno, user_no, fullPrice);
		
		if(result > 0){
			System.out.println("결제 성공!");
			page = "/psContract.do";
			request.setAttribute("payment", "성공!");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);			
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "펫시터 등록 실패!");
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
