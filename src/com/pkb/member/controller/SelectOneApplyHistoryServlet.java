package com.pkb.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pkb.member.model.service.UserService;
import com.pkb.member.model.vo.ApplyHistory;

/**
 * Servlet implementation class SelectOneApplyHistoryServlet
 */
@WebServlet("/selectOneApplyHistory.me")
public class SelectOneApplyHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneApplyHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectNum = request.getParameter("selectNum");
		
		ApplyHistory ah = new UserService().selectOneApplyHistory(selectNum);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		// 자동으로 인코딩 처리와 JSON타입으로 변환 해주고 실행시켜준다.
		// 또한 자동으로 디코딩 처리까지 해준다.
		new Gson().toJson(ah,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
