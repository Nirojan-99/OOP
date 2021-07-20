package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.InquiryService;
import service.MailService;


@WebServlet("/SendAdminMail")
public class SendAdminMail extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail = request.getParameter("mail");
		String msg = request.getParameter("message");
		int id = Integer.parseInt(request.getParameter("id"));
		String qui = request.getParameter("qui");
		
		String reply = "Inquiry : "+ qui +"\r\n" + "reply : " + msg;
		
		MailService.sendMail(mail, "REPLY MESSAGE", reply);
		
		InquiryService.deleteInquiry(id);
		
		response.sendRedirect("admin.jsp");
	}

}
