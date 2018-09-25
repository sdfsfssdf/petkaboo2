package com.pkb.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pkb.board.model.service.BoardService;
import com.pkb.board.model.vo.Board;
import com.pkb.member.model.vo.User;

/**
 * Servlet implementation class WritingReviewServlet
 */
@WebServlet("/review.wr")
public class WritingReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WritingReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("왔다");
		
//		User loginUser = (User) request.getSession().getAttribute("loginUser");
		
//		String 
		
//		System.out.println("22" + request.getParameter("contractNo"));
//		System.out.println("33" + request.getParameter(""));
	/*	String contractNo = request.getParameter("contractNo");
		System.out.println(contractNo);
		String petName=request.getParameter("petName");*/
		
		
		String page = "";
		page="views/myPage/reviewWrite.jsp";
		
		request.setAttribute("petsitterName", request.getParameter("petsitterName"));
		request.setAttribute("petName", request.getParameter("petName"));
		request.setAttribute("contractNo", request.getParameter("contractNo"));
		/*request.setAttribute("writter", request.getParameter("writter"));
		
		System.out.println(writter);*/
		
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
		
		
		//request.setAttribute("contractNo", request.getParameter("contractNo"));
		
//		
//		
//		String title = request.getParameter("onetitle");
//		String content = request.getParameter("onecontent");
//		
//		System.out.println(title);
//		System.out.println(content);
//
//		Board b = new Board();
//		b.setArticle_title(title);
//		b.setArticle_contents(content);
//		
//		
//		HttpSession session = request.getSession();
//		b.setUser_no(((User)(session.getAttribute("loginUser"))).getUser_no());
//		
//		int result = new BoardService().insertOnebyOneQna(b);
//		System.out.println(result);
//		String page = "";
//		if(result > 0) {
//			page = "views/myPage/reviewWrite.jsp";
//			
//		/*	String page="";
//			page="views/myPage/reserveList.jsp";
//			request.setAttribute("rsvList", rsvList);
////			request.setAttribute("pg", pg);//페이징처리에 쓸거임
//			System.out.println("sss" + loginUser);
//			
//			System.out.println("rsvList = " + rsvList );*/
//		RequestDispatcher view = request.getRequestDispatcher(page);
//		view.forward(request, response);
//		
//		/*
//			Paging pg = new Paging(1,10);
//	
//			if(request.getParameter("currentPage") != null){
//				pg.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
//			}
//			
//			pg.setListCount(new BoardService().getOnebyOneListCount());
//			
//			pg.setMaxPage((int) ((double)pg.getListCount() / pg.getLimit() + 0.9));
//			
//			pg.setStartPage((((int) ((double) pg.getCurrentPage() / pg.getLimit() + 0.9)) - 1) * pg.getLimit() + 1);
//			
//			if (pg.getMaxPage() < pg.getEndPage()) {
//				pg.setEndPage(pg.getMaxPage());
//			}
//			ArrayList<Board> list = new BoardService().selectOnebyOneList(pg.getCurrentPage(),pg.getLimit(),b.getUser_no());
//			System.out.println(list);
//			request.setAttribute("list", list);
//			request.setAttribute("pg", pg);*/
//			
//		}else {
//			page = "views/common/errorPage.jsp";
//			request.setAttribute("msg", "리뷰남기기 실패");		
//			
//		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
