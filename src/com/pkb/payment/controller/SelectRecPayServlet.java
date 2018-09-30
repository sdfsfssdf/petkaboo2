package com.pkb.payment.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pkb.member.model.vo.User;
import com.pkb.payment.model.service.PaymentService;

/**
 * Servlet implementation class SelectRecPayServlet
 */
@WebServlet("/selectRecPay.rp")
public class SelectRecPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectRecPayServlet() {
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
		
	
		HashMap<String, Object> rp = new PaymentService().selectRecPay(contract_no, user_no);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
