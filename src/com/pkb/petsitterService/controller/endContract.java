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

/**
 * Servlet implementation class endContract
 */
@WebServlet("/endContract.do")
public class endContract extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public endContract() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User loginUser = null;
		String page = "";
		int user_no = 0;
		int client_user_no = 0;
		int psrno = 0;
		int contractNo = 0;
		int result = 0;
		
		if(request.getParameter("endContract") != null && request.getSession().getAttribute("loginUser") != null && request.getParameter("endContract").equals("완료")){
			// 세션으로 받아올 loginUser 정보가 있다면
			loginUser = (User)request.getSession().getAttribute("loginUser");			
		}else{
			// 없다면 바로 에러 페이지로 넘김
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "비정상적인 접근!");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
			return;
		}
		
		user_no = loginUser.getUser_no();
		client_user_no = Integer.parseInt(request.getParameter("client_user_no"));
		psrno = Integer.parseInt(request.getParameter("psrno"));
		contractNo = Integer.parseInt(request.getParameter("contractNo"));
		
		result = new ContractMainService().endContract(user_no, client_user_no, psrno, contractNo);
		
		if(result > 0){
			page = "/psContract.do";
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "계약 상태 변경에 실패했습니다. 다시 시도해 주세요.");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
			return;
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
