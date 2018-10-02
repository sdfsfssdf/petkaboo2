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
 * Servlet implementation class ApprovalPetsitterRequestServlet
 */
@WebServlet("/approvalRequest.me")
public class ApprovalPetsitterRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApprovalPetsitterRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int record_no = Integer.parseInt(request.getParameter("record_no"));
		
		int result = new UserService().approvalPetsitterRequest(record_no);
		
		if(result > 0){
			response.sendRedirect(request.getContextPath() + "/petsitterRequest.me");
		} else {
			String page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지)펫시터 요청 승인 실패");
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
