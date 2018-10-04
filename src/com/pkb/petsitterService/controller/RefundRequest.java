package com.pkb.petsitterService.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.member.model.vo.User;
import com.pkb.petsitterService.model.service.ContractMainService;
import com.pkb.reservation.model.vo.Contract;

/**
 * Servlet implementation class RefundRequest
 */
@WebServlet("/refundReq.do")
public class RefundRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefundRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User loginUser = null;
		String page = "";
		int contractNo = 0;
		int user_no = 0;
		
		if(request.getSession().getAttribute("loginUser") != null && request.getParameter("contractNo") != null){
			// 세션으로 받아올 loginUser & contractNo정보가 있다면
			loginUser = (User)request.getSession().getAttribute("loginUser");
			contractNo = Integer.parseInt(request.getParameter("contractNo"));
			user_no = loginUser.getUser_no();
		} else {
			// 없다면 바로 에러 페이지로 넘김
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "비정상적인 접근!");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
			return;
		}
				
		int result = new ContractMainService().refundProceed(contractNo, user_no);
		
		if(result > 0){
			System.out.println("환불 신청 성공!");
			page = "/psContract.do";
			request.setAttribute("refund", "apply");
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
