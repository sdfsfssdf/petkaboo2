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
import com.pkb.petsitterService.model.vo.PetsitterService;

@WebServlet("/search.do")
public class SearchPetsitter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchPetsitter() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Paging 처리 사용
		// Paging 처리에 필요한 변수 선언
		int currentPage;	// 현재 페이지를 표시할 변수
		int limit;			// 한 페이지에 보여질 게시물을 설정하는 변수
		int maxPage;		// 전체 페이지에서 가장 마지막 페이지
		int startPage;		// 한 번에 표시되는 페이지가 시작될 페이지
		int endPage;		// 한 번에 표시될 페이지가 끝날 페이지
		
		// 게시판은 아무 값도 넘겨받지 않으면 1페이지에서 시작한다
		currentPage = 1;
				
		// 한 페이지에 보여질 목록 갯수
		limit = 10;		// 10개
				
		// currentPage 값을 받았다면 그 값으로 currentPage 변수 설정
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}		

		// Service에서 전체 목록 개수를 리턴받음
		int listCount = new PetsitterMainService().getListCount();
		
		// 테스트 코드
		System.out.println(listCount);
		
		// 총 페이지 수 계산
		maxPage = (int)((double)listCount / limit + 0.9);
		
		// 시작 페이지 계산
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		// 목록 아래쪽에 보여질 마지막 페이지 수
		endPage = startPage + limit - 1;
		
		// 마지막 페이지가 최대 페이지보다 크다면 마지막 페이지가 최대 페이지가 된다.
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		// 페이지 정보 -> PageInfo class
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
					
		String searchKeyword = request.getParameter("searchKeyword");
		String gender = request.getParameter("gender");
		String arrayCondition = request.getParameter("arrayCondition");
		String page = "";
		
		// 테스트코드
		System.out.println("키워드: " + searchKeyword);
		System.out.println("성별: " + gender);
		System.out.println("정렬조건: " + arrayCondition);
		System.out.println("질의개시");
		
		ArrayList<PetsitterService> list = new PetsitterMainService().searchList(searchKeyword, gender, arrayCondition);
		
		if(list != null){
			// 테스트코드
			System.out.println("검색결과" + list);
			
			page = "views/searchPetsitter/searchPetsitter.jsp";
			RequestDispatcher view = request.getRequestDispatcher(page);
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			view.forward(request, response);		
			
			}else{
				
			System.out.println("조회정보 없음");
			page = "views/common/errorPage.jsp";
			RequestDispatcher view = request.getRequestDispatcher(page);
			request.setAttribute("msg", "조회 실패!");
			view.forward(request, response);		
			
			}
		
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
