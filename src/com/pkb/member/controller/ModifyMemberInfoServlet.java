package com.pkb.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.member.model.service.UserService;
import com.pkb.member.model.vo.User;

/**
 * Servlet implementation class ModifyMemberInfoServlet
 */
@WebServlet("/modifyMember.me")
public class ModifyMemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyMemberInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] emailChk = request.getParameterValues("emailChk");
		String[] smsChk = request.getParameterValues("smsChk");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		User user = new User();
		user.setUser_no(userNo);
		user.setEmail(request.getParameter("email"));
		user.setUser_name(request.getParameter("userName"));
		user.setPhone(request.getParameter("phone"));
		user.setEmail_chk(emailChk[0]);
		user.setSms_chk(smsChk[0]);

		int result = new UserService().modifyMemberInfo(user);
		
		if(result > 0){
			response.sendRedirect(request.getContextPath() + "/selectOneMember.me?num="+userNo);
		} else {
			String page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지)회원 정보 수정 실패");
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
