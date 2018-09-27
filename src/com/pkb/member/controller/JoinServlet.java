package com.pkb.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pkb.member.model.service.UserService;
import com.pkb.member.model.vo.User;
import com.pkb.member.util.SHA256;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/join.me")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String user_pwd = request.getParameter("user_pwd");
		String email_hash = (String)SHA256.getSHA256(email);
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String sms = request.getParameter("sms_chk");
		String email_chk = request.getParameter("email_chk");
		String ip = request.getParameter("ip");
		String s = request.getParameter("s");
		
		System.out.println(s);
		User u = new User();
		
		u.setEmail(email);
		u.setUser_pwd(user_pwd);
		u.setEmail_hash(email_hash);
		u.setUser_name(name);
		u.setGender(gender);
		u.setSms_chk(sms);
		u.setEmail_chk(email_chk);
		
		System.out.println("조인고");
		
		int result = new UserService().joinUser(u);
	
		String page = "";
		
		if(result>0){
			SendEmail se = new SendEmail();
			se.doGet(request, response);
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			response.sendRedirect("/pkb/views/member/emailCheck.jsp");
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
