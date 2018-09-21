package com.pkb.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pkb.member.model.service.UserService;
import com.pkb.member.model.vo.ImgFile;
import com.pkb.member.model.vo.User;

/**
 * Servlet implementation class ModifyMemberMoveServlet
 */
@WebServlet("/modify.mb")
public class ModifyMemberMoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyMemberMoveServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("loginUser");
		ArrayList<ImgFile> list= new UserService().selectlist(u);
		String fileName =  list.get(0).getFile_name();
		
		String page = "";
		request.setAttribute("fileName", fileName);
		page = "views/myPage/modifyMemberInfoMain.jsp";
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
