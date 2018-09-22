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

/**
 * Servlet implementation class PhoneAuthServlet
 */
@WebServlet("/phone.au")
public class PhoneAuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhoneAuthServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String smsNumber = request.getParameter("name");
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		String email = loginUser.getEmail();
		System.out.println("이값이 들어와야해"+smsNumber);
		
		int result = new UserService().insertSms(smsNumber, email);
		
		
		if(result>0){
			HttpSession session = request.getSession();
			User u = (User)session.getAttribute("loginUser");
			u.setSms_number(smsNumber);;
			// 키값은 중복이 안된다. 
			session.setAttribute("loginUser", u);
			System.out.println("성공??");
			response.sendRedirect("/pkb/views/myPage/modifyMemberInfo.jsp");
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
