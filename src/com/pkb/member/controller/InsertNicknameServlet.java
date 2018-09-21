package com.pkb.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pkb.member.model.vo.ImgFile;
import com.pkb.common.MyFileRenamePolicy;
import com.pkb.member.model.service.FileService;
import com.pkb.member.model.service.UserService;
import com.pkb.member.model.vo.User;
import com.oreilly.servlet.MultipartRequest;
import javafx.application.Application;

/**
 * Servlet implementation class InsertNicknameServlet
 */
@WebServlet("/insert.tn")
public class InsertNicknameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNicknameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String AbsolutePath = request.getSession().getServletContext().getRealPath("/");
		
		String finalPath = "images\\profileImagesUpload\\";
		
		MultipartRequest mr = new MultipartRequest(request, AbsolutePath + finalPath, 1024*768, "UTF-8", new MyFileRenamePolicy());
		
		String name = mr.getParameter("profile");
		String upload =  mr.getFilesystemName("profile");
		String original = mr.getOriginalFileName("profile");
		String nickname = mr.getParameter("nickname");
		File file = mr.getFile("profile");
		int result = 0;
		
		if(nickname == null && upload != null){
			ImgFile f = new ImgFile();
			f.setFile_name(upload);
			f.setFile_path(finalPath);
			f.setUser_no(Integer.valueOf(((User) (request.getSession().getAttribute("loginUser"))).getUser_no()));
			
			result = new FileService().InsertProfile(f);
		}else if(nickname != null && upload ==null){
			HttpSession session = request.getSession();
			User u = (User)session.getAttribute("loginUser");
			u.setNickname(nickname);
			
			result = new FileService().InsertProfile(u);
		}else if(nickname != null && upload != null){
			ImgFile f = new ImgFile();
			f.setFile_name(upload);
			f.setFile_path(finalPath);
			f.setUser_no(Integer.valueOf(((User) (request.getSession().getAttribute("loginUser"))).getUser_no()));
			
			HttpSession session = request.getSession();
			User u = (User)session.getAttribute("loginUser");
			u.setNickname(nickname);
			
			result = new FileService().InsertProfile(f, u);
			
		}
			HttpSession session = request.getSession();
			User u = (User)session.getAttribute("loginUser");
		
			ArrayList<ImgFile> list= new UserService().selectlist(u);
			
			
			String fileName =  list.get(0).getFile_name();
			
			
			
			System.out.println(fileName);
			System.out.println(list);
			String page = "";
		if(result > 0){
				u.setNickname(nickname);
				// 키값은 중복이 안된다. 
				session.setAttribute("loginUser", u);
				request.setAttribute("fileName", fileName);
				page = "views/myPage/modifyMemberInfoMain.jsp";
		}else if(result == 0){
			System.out.println("실패");		
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
