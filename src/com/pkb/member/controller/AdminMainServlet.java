package com.pkb.member.controller;

import java.io.IOException;
import java.util.HashMap;

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
 * Servlet implementation class AdminMainServlet
 */
@WebServlet("/adminMain.me")
public class AdminMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminMainServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ip = request.getParameter("ip");
		
		HttpSession session = request.getSession();
		
		User u = (User) session.getAttribute("loginUser");
		
		HashMap<String, Object> hmap = new UserService().getAdminMainInfo(u);

		String page = "";

		if (hmap != null) {
			page = "views/admin/main/adminMain.jsp";
			request.setAttribute("totalInfo", hmap);
			request.setAttribute("ip", ip);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지)관리자 메인화면 접속 실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
