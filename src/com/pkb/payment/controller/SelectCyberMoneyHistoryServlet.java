package com.pkb.payment.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.common.Paging;
import com.pkb.member.model.vo.User;
import com.pkb.payment.model.service.PaymentService;
import com.pkb.payment.model.service.PaymentService2;
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
		User loginUser = (User) request.getSession().getAttribute("loginUser");

//		여기부터 복사
		String pay_date = request.getParameter("pay_date");
		String pay_method = request.getParameter("pay_method");
		
		
		System.out.println(pay_date);
		System.out.println(pay_method);
		
		Paging pg = new Paging(1, 10);

		if (request.getParameter("currentPage") != null) {
			pg.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		}

		pg.setListCount(new PaymentService2().selectListInquiryCount(loginUser.getUser_no(),pay_date,pay_method));

		pg.setMaxPage((int) ((double) pg.getListCount() / pg.getLimit() + 0.9));

		pg.setStartPage((((int) ((double) pg.getCurrentPage() / pg.getLimit() + 0.9)) - 1) * pg.getLimit() + 1);

		pg.setEndPage(pg.getStartPage() + pg.getLimit() - 1);

		if (pg.getMaxPage() < pg.getEndPage()) {
			pg.setEndPage(pg.getMaxPage());
		}

		HashMap<String, Object> totalInfo = new PaymentService2().searchMainInfo(pg.getCurrentPage(), pg.getLimit(),pay_date,pay_method);

		String page = "";
		if(totalInfo != null){
			page = "views/myPage/mypagepain.jsp";
			request.setAttribute("totalInfo", totalInfo);
			request.setAttribute("pg", pg);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "사이버머니 조회페이지 조회 실패 ");
		}
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
