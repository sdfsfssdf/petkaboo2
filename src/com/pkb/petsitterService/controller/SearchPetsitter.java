package com.pkb.petsitterService.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/search.do")
public class SearchPetsitter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchPetsitter() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchKeyword = request.getParameter("searchKeyword");
		String gender = request.getParameter("gender");
		String arrayCondition = request.getParameter("arrayCondition");
		
		// 테스트코드
		System.out.println("키워드: " + searchKeyword);
		System.out.println("성별: " + gender);
		System.out.println("정렬조건: " + arrayCondition);
		
		// 테스트 코드
		if(searchKeyword.equals("") || searchKeyword.equals(null)){
			// 아무 키워드도 안 들어왔으면 다시 모든 리스트 보여주기
			response.sendRedirect(request.getContextPath() + "/PetSitter.all");
		}else{
			// 아니면 질의 개시
			
			
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
