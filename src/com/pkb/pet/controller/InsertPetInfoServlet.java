package com.pkb.pet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pkb.member.model.vo.User;
import com.pkb.pet.model.service.PetService;
import com.pkb.pet.model.vo.Pet;


/**
 * Servlet implementation class InsertPetServlet
 */
@WebServlet("/insertPet.pi")
public class InsertPetInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPetInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		String user_no = String.valueOf(loginUser.getUser_no());
		
		String pet_name = request.getParameter("petName");
		String pet_categoryname = request.getParameter("petCategory");
		String birthday_pet = request.getParameter("petBirth");
		Date pet_birth = Date.valueOf(birthday_pet);
		String pet_gender = request.getParameter("petGender");
		String neutral_chk = request.getParameter("neutralization");
		String pet_weight = request.getParameter("petWeight");
	
		Pet p = new Pet();
		
		p.setUser_no(Integer.parseInt(user_no));
		p.setPet_name(pet_name);
		p.setPet_categoryname(pet_categoryname);
		p.setPet_birth(pet_birth);
		p.setPet_gender(pet_gender);
		p.setNeutral_chk(neutral_chk);
		p.setPet_weight(pet_weight);
		
		System.out.println("p잘들어갔나 : " + p);
		
		int result = new PetService().insertPetInfo(p);
		
		String page = "";
		if(result > 0){
			
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript'>");
			out.println("alert('반려동물이 등록되었습니다.');");
			out.println("location.href = 'views/mypagemain.jsp';"); 
			out.println("</script>"); 
			out.close();

		}else{
			
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "반려동물 등록 실패");
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
