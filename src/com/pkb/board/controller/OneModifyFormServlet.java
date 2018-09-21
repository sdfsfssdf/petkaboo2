package com.pkb.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.pkb.board.model.service.BoardService;
import com.pkb.board.model.vo.Board;

/**
 * Servlet implementation class OneModifyFormServlet
 */
@WebServlet("/oneModifyForm.bo")
public class OneModifyFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneModifyFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		
		Board b = new BoardService().selectOneOnebyOne(num);
		
		
		String page = "";
		if(b != null){
			page = "views/myPage/onebyoneModify.jsp";
			request.setAttribute("b", b);
			
			
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "1:1문의 수정 화면 조회 실패!");
			
		}
		
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
