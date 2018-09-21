package com.pkb.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.notice.model.service.NoticeService;
import com.pkb.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeModifyServlet
 */
@WebServlet("/noticeModify.no")
public class NoticeModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nno = Integer.parseInt(request.getParameter("nno"));
		String title = request.getParameter("title");
		String user_name = request.getParameter("writer");
		String content = request.getParameter("content");
		
		Notice nt = new Notice();
		nt.setArticle_no(nno);
		nt.setArticle_title(title);
		nt.setUser_name(user_name);
		nt.setArticle_contents(content);
		
		int result = new NoticeService().modifyNotice(nt);
		
		String page = "";
		if(result > 0) {
			page = "views/admin/defaultSet/noticeDetail.jsp";
			request.setAttribute("nt", new NoticeService().selectOneNotice(nno));
		} else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지) 공지사항 수정 실패");
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
