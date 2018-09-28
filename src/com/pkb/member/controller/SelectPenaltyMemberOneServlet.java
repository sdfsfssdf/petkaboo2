package com.pkb.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pkb.board.model.vo.Board;
import com.pkb.member.model.service.UserService;

/**
 * Servlet implementation class SelectPenaltyMemberOneServlet
 */
@WebServlet("/selectPenaltyOne.me")
public class SelectPenaltyMemberOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPenaltyMemberOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int article_no = Integer.parseInt(request.getParameter("selectNum"));
		
		Board b = new UserService().selectPenaltyMemberOne(article_no);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		// 자동으로 인코딩 처리와 JSON타입으로 변환 해주고 실행시켜준다.
		// 또한 자동으로 디코딩 처리까지 해준다.
		new Gson().toJson(b,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
