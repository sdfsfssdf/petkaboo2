package com.pkb.payment.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static com.pkb.common.JDBCTemplate.*;

import com.pkb.common.Paging;
import com.pkb.notice.model.service.NoticeService;
import com.pkb.notice.model.vo.Notice;
import com.pkb.payment.model.dao.PaymentDao;
import com.pkb.payment.model.service.PaymentService;
import com.pkb.payment.model.vo.PayHistory;

/**
 * Servlet implementation class SelectPaymentMainInfoServlet
 */
@WebServlet("/selectMain.pe")
public class SelectPaymentMainInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectPaymentMainInfoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Paging pg = new Paging(1, 10);

		if (request.getParameter("currentPage") != null) {
			pg.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		}

		pg.setListCount(new PaymentService().getListCount());

		pg.setMaxPage((int) ((double) pg.getListCount() / pg.getLimit() + 0.9));

		pg.setStartPage((((int) ((double) pg.getCurrentPage() / pg.getLimit() + 0.9)) - 1) * pg.getLimit() + 1);

		pg.setEndPage(pg.getStartPage() + pg.getLimit() - 1);

		if (pg.getMaxPage() < pg.getEndPage()) {
			pg.setEndPage(pg.getMaxPage());
		}

		HashMap<String, Object> totalInfo = new PaymentService().selectMainInfo(pg.getCurrentPage(), pg.getLimit());

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
