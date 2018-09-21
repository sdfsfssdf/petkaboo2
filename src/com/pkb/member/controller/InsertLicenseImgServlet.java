package com.pkb.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.pkb.common.MyFileRenamePolicy;
import com.pkb.member.model.service.FileService;
import com.pkb.member.model.vo.ImgFile;
import com.pkb.member.model.vo.User;

/**
 * Servlet implementation class InsertLicenseImgServlet
 */

@WebServlet("/insert.li")
public class InsertLicenseImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertLicenseImgServlet() {
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
		
		String name = mr.getParameter("licenseImg");
		String upload =  mr.getFilesystemName("licenseImg");
		String original = mr.getOriginalFileName("licenseImg");
		
		File file = mr.getFile("licenseImg");
		
		ImgFile f = new ImgFile();
		
		f.setFile_name(upload);
		f.setFile_path(finalPath);
		f.setUser_no(Integer.valueOf(((User) (request.getSession().getAttribute("loginUser"))).getUser_no()));
		
		
		int result = new FileService().insertLicense(f);
		
		System.out.println(result);
		
		
		if(result > 0){
		
			response.sendRedirect("views/member/imgUploadCheck.jsp");
		}else{
			System.out.println("실패");
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
