package com.pkb.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.member.model.service.UserService;
import com.pkb.member.model.vo.User;

/**
 * Servlet implementation class ChangePwdServlet
 */
@WebServlet("/checkPwd.me")
public class CheckPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currentPwd = request.getParameter("user_pwd");
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		String email = loginUser.getEmail();
		
		int result = new UserService().checkPwd(currentPwd,email);
		System.out.println("비번확인"+result);
		if(result == 1){
			response.getWriter().print(result);
			request.getRequestDispatcher("changePwd.me").forward(request, response);
		}else{
			response.getWriter().print(result);
			response.sendRedirect("views/myPage/modifyPassword.jsp");
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
