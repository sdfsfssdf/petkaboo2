package com.pkb.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pkb.member.model.service.UserService;
import com.pkb.member.model.vo.User;

/**
 * Servlet implementation class ChangeAccountServlet
 */
@WebServlet("/changeAcc.ca")
public class ChangeAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bankName = request.getParameter("bankName");
		String acc = request.getParameter("acc");
		
		System.out.println("bankName"+bankName);
		System.out.println("acc"+acc);
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUser_no();
		
		int result = new UserService().insertAcc(userNo, bankName, acc);
		String page="/modify.mb";
		if(result>0){
			loginUser.setAccount_no(acc);
			loginUser.setBank_name(bankName);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			RequestDispatcher view = request.getRequestDispatcher(page);
			request.setAttribute("acc", acc);
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
