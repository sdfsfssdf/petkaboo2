package com.pkb.petsitterService.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.petsitterService.model.service.PetsitterMainService;
import com.pkb.petsitterService.model.vo.PageInfo;
import com.pkb.petsitterService.model.vo.PetsitterDiary;
import com.pkb.petsitterService.model.vo.PetsitterService;

@WebServlet("/psdiary.do")
public class SearchMyDiary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchMyDiary() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Paging 처리 필요 없음
		// request에서 parameter 꺼내오기
		String user_no = request.getParameter("user_no");
		String email = request.getParameter("email");			
		
		// 테스트 코드
		System.out.println("user_no");
		System.out.println("email");
		
		String page = "";
		
		if(user_no != null){
			// user_no를 전달받았다면
			ArrayList<PetsitterDiary> myList = new PetsitterMainService().searchDiary(user_no, email);
			
			if(myList != null){
				// 테스트코드
				// System.out.println("검색결과" + list);
				
				page = "views/myPage/petSitterDiary.jsp";
				RequestDispatcher view = request.getRequestDispatcher(page);
				request.setAttribute("myList", myList);
				view.forward(request, response);
				
				}else{
					
				// System.out.println("조회정보 없음");
				page = "views/common/errorPage.jsp";
				RequestDispatcher view = request.getRequestDispatcher(page);
				request.setAttribute("msg", "조회 실패!");
				view.forward(request, response);		
				
				}
			
			return;
			
		}
		
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
