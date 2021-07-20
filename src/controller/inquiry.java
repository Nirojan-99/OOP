package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Inquirys;
import model.customer;
import service.InquiryService;


@WebServlet("/inquiry")
public class inquiry extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String button = request.getParameter("inquirysub");
		
		if(button.equals("Submit")) {
			String name = request.getParameter("name");
			String number = request.getParameter("number");
			String inquiry = request.getParameter("inquiry");
			
			HttpSession session = request.getSession();
			customer cus  = (customer)session.getAttribute("user");
			
			Inquirys inq = new Inquirys();
			
			inq.setName(name);
			inq.setInquiry(inquiry);
			inq.setNumber(number);
			
			InquiryService.userInquiry(inq,cus);
			
			response.sendRedirect("create.jsp");
		}
		else {
		
		String name = request.getParameter("name");
		String mail = request.getParameter("email");
		String number = request.getParameter("number");
		String inquiry = request.getParameter("inquiry");
		
		Inquirys inq = new Inquirys();
		
		inq.setName(name);
		inq.setEmail(mail);
		inq.setInquiry(inquiry);
		inq.setNumber(number);
		
		InquiryService.newInquiry(inq);
		
		response.sendRedirect("index.jsp");
		}
		
	}

}
