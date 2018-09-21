package com.pkb.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.common.Paging;
import com.pkb.notice.model.service.NoticeService;

/**
 * Servlet implementation class DeleteNoticesServlet
 */
@WebServlet("/deleteNotices.no")
public class DeleteNoticesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteNoticesServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String selectNnos = request.getParameter("selecNnos");

		String[] nnos = selectNnos.split(",");
		int[] deleteNnos = new int[nnos.length];

		for (int i = 0; i < nnos.length; i++) {
			deleteNnos[i] = Integer.parseInt(nnos[i]);
		}

		int[] result = new NoticeService().deleteNotices(deleteNnos);

		String page = "";

		if (result.length > 0 ) {
			// 페이징 객체 초기화
			Paging pg = new Paging(1, 10);

			// 현재 페이지 초기화
			if (request.getParameter("currentPage") != null) {
				pg.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
			}

			// 전체 목록 갯수를 리턴받음
			pg.setListCount(new NoticeService().getListCount());

			// 총 페이지수 계산
			// 예) 목록 수가 123개이면 페이지가 13개가 필요함
			pg.setMaxPage((int) ((double) pg.getListCount() / pg.getLimit() + 0.9));
			// 시작페이지 계산
			pg.setStartPage((((int) ((double) pg.getCurrentPage() / pg.getLimit() + 0.9)) - 1) * pg.getLimit() + 1);

			// 목록 아래쪽에 보여질 마지막 페이지 수
			pg.setEndPage(pg.getStartPage() + pg.getLimit() - 1);

			if (pg.getMaxPage() < pg.getEndPage()) {
				pg.setEndPage(pg.getMaxPage());
			}
			response.sendRedirect(request.getContextPath()+"/noticeList.no");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지)공지사항 삭제하기 실패");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
