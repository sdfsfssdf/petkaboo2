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
 * Servlet implementation class DeleteTitleProfileServlet
 */
@WebServlet("/deleteTitleProfile.me")
public class DeleteTitleProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTitleProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String src = request.getParameter("src");
		String fileNo = request.getParameter("fileNo");

		String filePath = src.substring(0,src.lastIndexOf("/")+1);
		String fileName = src.substring(src.lastIndexOf("/")+1, src.length());
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		int result = new UserService().deleteTitleProfile(fileNo,userNo);
		
		String page = "";
		if(result > 0){
			response.sendRedirect(request.getContextPath() + "/selectOneMember.me?num="+userNo);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지)타이틀 이미지 삭제 실패");
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
