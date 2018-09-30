package com.pkb.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.member.model.vo.User;
import com.pkb.member.util.Gmail;
import com.pkb.member.util.SHA256;


@WebServlet("/sendPwd.sp")
public class SendPwd extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		// 사용자에게 보낼 메시지를 기입합니다.
		String email = request.getParameter("email");
		String sendPwd = (String)request.getSession().getAttribute("sendPwd");
		
		String host = "http://localhost:8001/pkb";
		
		String from = "getfreshair1@gmail.com";

		String to = email;

		String subject = "펫카부 임시 비밀번호 이메일입니다.";

		String content = "펫카부 임시비밀번호 입니다. "+ sendPwd + "  로그인 후 비밀번호를 바꿔주세요"+
				"<a href='" + host + "/views/common/login.jsp'>로그인하러가기</a>";
							
		System.out.println("들어옴?");
		// SMTP에 접속하기 위한 정보를 기입합니다.

		Properties p = new Properties();

		p.put("mail.smtp.user", from);

		p.put("mail.smtp.host", "smtp.googlemail.com");

		p.put("mail.smtp.port", "465");

		p.put("mail.smtp.starttls.enable", "true");

		p.put("mail.smtp.auth", "true");

		p.put("mail.smtp.debug", "true");

		p.put("mail.smtp.socketFactory.port", "465");

		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		p.put("mail.smtp.socketFactory.fallback", "false");



		try{

			Authenticator auth = new Gmail();

			Session ses = Session.getInstance(p, auth);

			ses.setDebug(true);

			MimeMessage msg = new MimeMessage(ses); 

			msg.setSubject(subject);

			Address fromAddr = new InternetAddress(from);

			msg.setFrom(fromAddr);

			Address toAddr = new InternetAddress(to);

			msg.addRecipient(Message.RecipientType.TO, toAddr);

			msg.setContent(content, "text/html;charset=UTF-8");

			Transport.send(msg);

		} catch(Exception e){

			e.printStackTrace();

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('오류가 발생했습니다..');");

			script.println("history.back();");

			script.println("</script>");

			script.close();		

			return;

		}

	}
	
}
