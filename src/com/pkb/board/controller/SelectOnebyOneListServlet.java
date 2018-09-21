package com.pkb.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pkb.board.model.service.BoardService;
import com.pkb.board.model.vo.Board;
import com.pkb.common.Paging;
import com.pkb.member.model.vo.User;


/**
 * Servlet implementation class SelectOnebyOneList
 */
@WebServlet("/selectOnebyOneList.bo")
public class SelectOnebyOneListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOnebyOneListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		
		Paging pg = new Paging(1,10);
		
		if (request.getParameter("currentPage") != null) {
			pg.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		}
		
		pg.setListCount(new BoardService().getOnebyOneListCount());
		
		pg.setMaxPage((int) ((double) pg.getListCount() / pg.getLimit() + 0.9));
		
		pg.setStartPage((((int) ((double) pg.getCurrentPage() / pg.getLimit() + 0.9)) - 1) * pg.getLimit() + 1);
		
		pg.setEndPage(pg.getStartPage() + pg.getLimit() - 1);
		
		if (pg.getMaxPage() < pg.getEndPage()) {
			pg.setEndPage(pg.getMaxPage());
		}
		
		int user_no = ((User)(session.getAttribute("loginUser"))).getUser_no();
		
		ArrayList<Board> list = new BoardService().selectOnebyOneList(pg.getCurrentPage(), pg.getLimit(), user_no);
		
		String page = "";
		
		
		if(list != null){
			page = "views/myPage/onebyoneList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pg", pg);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "내 질문내역 조회 실패");
			
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
