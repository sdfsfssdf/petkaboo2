package com.pkb.petsitterService.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pkb.member.model.vo.User;
import com.pkb.petsitterService.model.service.PetsitterMainService;
import com.pkb.petsitterService.model.vo.PetsitterService;

@WebServlet("/insertPetService.do")
public class InsertPetsitterService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPetsitterService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 펫시터 서비스 값 꺼내오기
		String pet_category = request.getParameter("pet_category");
		String contract_type = request.getParameter("contract_type");
		String contract_days = request.getParameter("contract_days");
		
		// 날짜는 parameter에서 String 으로 꺼내온 후 Date로 변형해야 함
		String contract_start_string = request.getParameter("contract_start");
		Date contract_start = Date.valueOf(contract_start_string);
		String contract_end_string = request.getParameter("contract_end");
		Date contract_end = Date.valueOf(contract_end_string);
		
		// 서비스 디테일 값 꺼내오기
		String service_charge = request.getParameter("service_charge");
		String pet_count = request.getParameter("pet_count");
		String service_detail = request.getParameter("service_detail");
		String service_restrict = request.getParameter("service_restrict");
		
		// 로그인 유저 세션에서 유저 no를 가져오는 코드를 여기에 삽입
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		String user_no = String.valueOf(loginUser.getUser_no());
		
		// 서비스와 서비스 디테일을 서비스로 넘기기	
		// 펫시터 서비스 vo 객체 생성 및 값 넣기
		PetsitterService ps = new PetsitterService();
		ps.setUser_no(Integer.parseInt(user_no));	// 로그인 세션에서 가져온 유저 no 세팅
		ps.setContract_days(contract_days);
		ps.setContract_type(contract_type);
		
		// contract_start와 contract_end는 Date로 형변환 후 집어넣어야 한다
		ps.setContract_start(contract_start); // Todo
		ps.setContract_end(contract_end); // Todo

		// 펫시터 서비스 상세 값 넣기
		ps.setPet_category(Integer.parseInt(pet_category));
		ps.setPet_count(Integer.parseInt(pet_count));
		ps.setService_detail(service_detail);
		ps.setService_restrict(service_restrict);
		ps.setService_charge(Integer.parseInt(service_charge));
		// 테스트용 코드
		System.out.println("ps 객체의 정보는: " + ps);
		
		// 펫시터 등록 및 상세 정보 등록 서비스로 객체 넘기기
		int result = new PetsitterMainService().insertPetsitterService(ps);
		
		// 넘겨줄 페이지 초기화
		String page = "";
		
		// 둘 다 성공시에만 성공처리
		if(result > 0){
			// selectList.bo를 펫시터 목록 조회 서블릿으로 대체
			response.sendRedirect(request.getContextPath() + "/PetSitter.all");
		}else{
			request.setAttribute("msg", "펫시터 등록 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}