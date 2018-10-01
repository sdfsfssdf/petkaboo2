package com.pkb.payment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pkb.member.model.vo.User;
import com.pkb.payment.model.service.PaymentService;
import com.pkb.payment.model.vo.PaymentInfo;

/**
 * Servlet implementation class SelectRecPayServlet
 */
@WebServlet("/searchRecPayInfo.py")
public class SearchRecPayInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchRecPayInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String contract_no2 = request.getParameter("contract_no");
		int contract_no = Integer.parseInt(contract_no2);
		HttpSession session = request.getSession();
		int user_no = ((User)(session.getAttribute("loginUser"))).getUser_no();
		
		System.out.println(contract_no + "랑" + user_no + "들어옴");
		
		PaymentInfo pi = new PaymentService().searchRecPayInfo(contract_no, user_no);
		
		String page="";
		if(pi != null){
			page = "views/status/requestPayment.jsp";
			request.setAttribute("pi", pi);
			
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "조회실패");
			
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
