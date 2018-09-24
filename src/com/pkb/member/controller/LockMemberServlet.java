package com.pkb.member.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
 * Servlet implementation class LockMemberServlet
 */
@WebServlet("/lockMember.me")
public class LockMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LockMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectUserNo = request.getParameter("selecUserNo");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String lockDate = request.getParameter("lockDate");

		String[] selectUserNos = selectUserNo.split(",");
		HttpSession session = request.getSession();
		int adminUserNo = ((User)session.getAttribute("loginUser")).getUser_no();
		
		
		int[] result = new UserService().lockMember(selectUserNos,title,content,adminUserNo,lockDate);

		String page = "";
		if (result.length > 0) {
			response.sendRedirect(request.getContextPath() + "/selectList.me");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지)회원 제재처리 실패");

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
