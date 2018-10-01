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

/**
 * Servlet implementation class FindPasswordServlet
 */
@WebServlet("/findPwd.me")
public class FindPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public FindPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String newPwd = request.getParameter("newPwd");
		String sendPwd = request.getParameter("sendPwd");
		System.out.println(email);
		System.out.println(name);
		int result = new UserService().findPwd(email,name);
		System.out.println(result+"성공이지?");
		if(result>0){
			int result1 = new UserService().changePwd(newPwd, email);
			if(result1 >0){
			HttpSession session = request.getSession();
			request.setAttribute("email", email);
			session.setAttribute("sendPwd", sendPwd);
			SendPwd se = new SendPwd();
			se.doGet(request, response);
			response.sendRedirect("/pkb/views/member/newPwdCheck.jsp");
			}else{
				System.out.println("실패");
			}
		}else{
			System.out.println("실패");
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
