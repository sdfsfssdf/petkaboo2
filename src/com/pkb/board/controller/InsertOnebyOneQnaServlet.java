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
 * Servlet implementation class InsertOnebyOneQnaServlet
 */
@WebServlet("/insertQna.bo")
public class InsertOnebyOneQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertOnebyOneQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("onetitle");
		String content = request.getParameter("onecontent");
		
		System.out.println(title);
		System.out.println(content);

		Board b = new Board();
		b.setArticle_title(title);
		b.setArticle_contents(content);
		
		
		HttpSession session = request.getSession();
		b.setUser_no(((User)(session.getAttribute("loginUser"))).getUser_no());
		
		int result = new BoardService().insertOnebyOneQna(b);

		String page = "";
		if(result > 0) {
			page = "views/myPage/onebyoneList.jsp";
			Paging pg = new Paging(1,10);
	
			if(request.getParameter("currentPage") != null){
				pg.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
			}
			
			pg.setListCount(new BoardService().getOnebyOneListCount());
			
			pg.setMaxPage((int) ((double)pg.getListCount() / pg.getLimit() + 0.9));
			
			pg.setStartPage((((int) ((double) pg.getCurrentPage() / pg.getLimit() + 0.9)) - 1) * pg.getLimit() + 1);
			
			if (pg.getMaxPage() < pg.getEndPage()) {
				pg.setEndPage(pg.getMaxPage());
			}
			ArrayList<Board> list = new BoardService().selectOnebyOneList(pg.getCurrentPage(),pg.getLimit(),b.getUser_no());
			System.out.println(list);
			request.setAttribute("list", list);
			request.setAttribute("pg", pg);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "1:1문의 등록 실패");		
			
		}
		
		
		//등록한 정보가 있다면 내 질문내역 화면 띄워주기
	/*	response.sendRedirect(request.getContextPath() + "/selectOnebyOneList.bo");*/
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
