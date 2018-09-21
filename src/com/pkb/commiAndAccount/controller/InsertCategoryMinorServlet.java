package com.pkb.commiAndAccount.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.commiAndAccount.model.service.CommiAndAccountService;
import com.pkb.commiAndAccount.model.vo.Commission;
import com.pkb.commiAndAccount.model.vo.PetCategory;

/**
 * Servlet implementation class InsertCategoryMinorServlet
 */
@WebServlet("/insertCategoryMinor.caa")
public class InsertCategoryMinorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCategoryMinorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String categoryName = request.getParameter("categoryName");
		String[] categoryNo = request.getParameterValues("selectCategory");
		int category = Integer.parseInt(categoryNo[0]);
		
		PetCategory pc = new PetCategory();
		pc.setCategoryName(categoryName);
		pc.setCategoryRefNo(category);
		
		
		int result = new CommiAndAccountService().insertCategoryMinor(pc);
		
		String page = "";
		if (result > 0) {
			response.sendRedirect(request.getContextPath()+ "/caaList.caa");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "(관리자 페이지)펫 카테고리 추가 실패");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
