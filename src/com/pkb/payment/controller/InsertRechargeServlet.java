package com.pkb.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertRechargeServlet
 */
@WebServlet("/insertRecharge.rc")
public class InsertRechargeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRechargeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_no = request.getParameter("user_no");
		String pay_method = request.getParameter("pay_method");
		String paid_amount = request.getParameter("paid_amount");
		String apply_num = request.getParameter("apply_num");
		
		System.out.println(user_no);
		System.out.println(pay_method);
		System.out.println(paid_amount);
		System.out.println(apply_num);
		
	/*String json ="{\"user_no\" :" + user_no + ",\"pay_method\" :" + pay_method + ",\"paid_amount\" : " + paid_amount + ",\"apply_num\" : " + apply_num + "}";	
	System.out.println(json);*/
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
