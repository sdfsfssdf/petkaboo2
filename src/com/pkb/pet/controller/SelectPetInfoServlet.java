package com.pkb.pet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.pet.model.service.PetService;
import com.pkb.pet.model.vo.Pet;

/**
 * Servlet implementation class SelectPetInfoServlet
 */
@WebServlet("/selectPetInfo.pi")
public class SelectPetInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPetInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Pet p = null;
		p = (Pet)request.getAttribute("p");
		
		Pet p2 = new PetService().selectPetInfo(p);
		
		if(p2 != null){
			request.setAttribute("p2", p2);
			
		}else{
			
			System.out.println("조회실패");
			
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
