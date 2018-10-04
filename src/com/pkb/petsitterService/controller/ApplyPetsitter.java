package com.pkb.petsitterService.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.member.model.vo.User;
import com.pkb.petsitterService.model.service.PetsitterMainService;

/**
 * Servlet implementation class ApplyPetsitter
 */
@WebServlet("/ApplyPetsitter.req")
public class ApplyPetsitter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyPetsitter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User loginUser = null;
		String page = "";
		String apCheck = request.getParameter("apCheck");
		int result = 0;
		
		if(request.getSession().getAttribute("loginUser") != null){
			// 세션으로 받아올 loginUser 정보가 있다면
			loginUser = (User)request.getSession().getAttribute("loginUser");
		} else {
			// 없다면 바로 에러 페이지로
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "로그인 후 이용해 주세요!");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
			return;
		}
		
		if(apCheck.equals("Y")){
			// 확실히 apCheck 정보가 넘어왔는가?
			
		} else {
			// 없다면 바로 에러 페이지로
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "잘못된 접근입니다.");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
			return;			
		}
		
		int user_no = loginUser.getUser_no();
		
		result = new PetsitterMainService().applyPetsitter(user_no);
		
		if(result > 0){
			page = "views/page/ApplyPetsitter.jsp";
			request.setAttribute("applyPetsitter", "OK");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "펫시터 신청에 실패했습니다. 다시 시도해 주세요.");
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
