package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.customer;
import service.CustomerService;


@WebServlet("/deleteAccount")
public class deleteAccount extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		
		customer cus = new customer();
		cus.setEmail_id(session.getAttribute("uname").toString());
		cus.setPassword(password);
		
		if(CustomerService.deleteCustomer(cus)) {
			response.sendRedirect("index.jsp");
		}
		else {
			response.sendRedirect("profile.jsp");
		}
	}

}
