package com.pkb.payment.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.common.Paging;
import com.pkb.payment.model.service.PaymentService;

/**
 * Servlet implementation class SelectBankBookListServlet
 */
@WebServlet("/bankBook.pa")
public class SelectBankBookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectBankBookListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Paging pg = new Paging(1, 10);
		
		if (request.getParameter("currentPage") != null) {
			pg.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		}

		pg.setListCount(new PaymentService().getListCount());

		pg.setMaxPage((int) ((double) pg.getListCount() / pg.getLimit() + 0.9));

		pg.setStartPage((((int)((double) pg.getCurrentPage() / pg.getLimit() + 0.9)) - 1) * pg.getLimit() + 1);

		pg.setEndPage(pg.getStartPage() + pg.getLimit() - 1);

		if (pg.getMaxPage() < pg.getEndPage()) {
			pg.setEndPage(pg.getMaxPage());
		}

		HashMap<String, Object> totalInfo = new PaymentService().selectMainInfo(pg.getCurrentPage(), pg.getLimit());

		String page = "";
		if(totalInfo != null){
			page = "views/admin/paymentManage/cMoneyManage.jsp";
			request.setAttribute("totalInfo", totalInfo);
			request.setAttribute("pg", pg);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지)사이버머니 관리페이지 조회 실패 ");
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
