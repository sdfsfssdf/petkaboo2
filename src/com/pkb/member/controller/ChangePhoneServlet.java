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
 * Servlet implementation class ChangePhoneServlet
 */
@WebServlet("/smsCheck.sc")
public class ChangePhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePhoneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phone = (String)request.getSession().getAttribute("rphone");
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		String sms = request.getParameter("inputNum");
		System.out.println("dhzl"+sms);
		int result = new UserService().updatePhone(phone, sms, loginUser);
		System.out.println("dhzl"+sms);
		if(result>0){
			response.sendRedirect("/pkb/views/myPage/modifyMemberInfo.jsp");
		}else{
			response.sendRedirect("views/member/smsCheck.jsp");
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
