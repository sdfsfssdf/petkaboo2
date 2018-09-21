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
 * Servlet implementation class OnebyOneModifyServlet
 */
@WebServlet("/oneModify.bo")
public class OnebyOneModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OnebyOneModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String user_name = request.getParameter("writer");
		String content = request.getParameter("content");
		
		Board b = new Board();
		
		b.setArticle_no(num);
		b.setArticle_title(title);
		b.setUser_name(user_name);
		b.setArticle_contents(content);
		
		int result = new BoardService().modifyOnebyOne(b);
		
		String page = "";
		if(result > 0){
			page = "views/myPage/onebyoneDetail.jsp";
			request.setAttribute("b", new BoardService().selectOneOnebyOne(num));
		
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "1:1문의 수정 실패!");
			
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
