package com.pkb.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.member.model.vo.User;
import com.pkb.payment.model.service.PaymentService;
import com.pkb.payment.model.vo.Payment;

/**
 * Servlet implementation class selectCyberMoneyHistory
 */
@WebServlet("/selectCyberMoneyHistory.pm")
public class SelectCyberMoneyHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCyberMoneyHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("일단 내역서 서블릿부터 만든다");
		
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		System.out.println("보이냐 보이면 끝 :" + loginUser.getMoney());
		
		Payment payment = new Payment();
		payment.setUser_no(loginUser.getUser_no());
		payment.setPay_date(java.sql.Date.valueOf(request.getParameter("pay_date")));
		payment.setPay_method(request.getParameter("pay_method"));
		
		ArrayList<Payment> inquiry= new PaymentService().selectListInquiry(payment);
		
		System.out.println();
		String page = "";
		
//		if(balance !=null){
		page="views/myPage/mypagemain.jsp";
//		}else{
//			page="views/common/errorPage.jsp";
//		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
